package com.cnr_furniture.controller;

import com.cnr_furniture.domain.member.MemberVO;
import com.cnr_furniture.domain.member.MemberSearch;
import com.cnr_furniture.domain.member.PassWordVO;
import com.cnr_furniture.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Random;

@AllArgsConstructor
@Controller
@Log4j
public class MemberController {
  private MemberService memberService;
  private JavaMailSender mailSender;
  private BCryptPasswordEncoder bCryptPasswordEncoder;

  /**
   * Desc: 로그인 실행 페이지
   * @return 로그인 view page
   */
  @GetMapping(path = {"/login"})
  public String login(@RequestParam(value = "error", required = false) String error,
                      @RequestParam(value = "exception", required = false) String exception,
                      Model model,HttpServletRequest request) {
    // 이전페이지 URL 추출
    String referrer = request.getHeader("Referer");
    request.getSession().setAttribute("prevPage", referrer);
    model.addAttribute("error", error);
    model.addAttribute("exception", exception);
    return "member/login";
  }

  /**
   * Desc: 비밀번호변경 페이지
   * @return 비밀번호변경 view page
   */
  @GetMapping("/PasswordChange")
  public String pwChange() {
    return "member/pwChange";
  }

  /**
   * Desc: 실제 비밀번호 변경 프로세스
   * @return 로그인 redirect page
   */
  @PostMapping("/PasswordChangeProc")
  public String PasswordChangeProc(PassWordVO passWord, RedirectAttributes rttr) {
    String hashedPassword = bCryptPasswordEncoder.encode(passWord.getPassword());
    passWord.setPassword(hashedPassword);
    rttr.addFlashAttribute("updateSuccessCount",  memberService.passwordUpdate(passWord));
    return "redirect:/login";
  }

  /**
   * Desc: 사원정보조회
   * @return 사원정보조회 view page
   */
  @GetMapping("/standardInfo/memberInfo")
  public String memberInfo(MemberSearch search, Model model) {
    // 검색창
    model.addAttribute("search", search);
    // 사원리스트
    List<MemberVO> staffList = memberService.staffList(search);
    model.addAttribute("StaffList", staffList);
    // 매니저리스트
    List<MemberVO> managerList = memberService.managerList(search);
    model.addAttribute("ManagerList", managerList);
    // 디렉터 리스트
    List<MemberVO> directorList = memberService.directorList(search);
    model.addAttribute("DirectorList", directorList);
    // 부서 조회
    List<MemberVO> dpNameList = memberService.dpNameList();
    model.addAttribute("dpNameList", dpNameList);
    return "standardInfo/memberInfo";
  }

  /**
   * Desc: 사용자별 권한관리
   * @return 사용자별 권한관리 view page
   */
  @GetMapping("/M/member/memberRole")
  public String memberRole(MemberSearch search, Model model) {
    // 검색창
    model.addAttribute("search", search);
    // 직원 목록
    List<MemberVO> employeeList = memberService.employeeList(search);
    model.addAttribute("EmployeeList", employeeList);
    // 권한 조회
    List<MemberVO> roleList = memberService.roleList();
    model.addAttribute("roleList", roleList);
    // 부서 조회
    List<MemberVO> dpNameList = memberService.dpNameList();
    model.addAttribute("dpNameList", dpNameList);
    return "member/memberRole";
  }

  /**
   * Desc: 사원 추가
   * @param memberVO
   * @param rttr
   * @return 사용자별 권한관리 view page
   */
  @PostMapping("/addStaffMember")
  public String addStaffMember(MemberVO memberVO, RedirectAttributes rttr) {
    int rtn = memberService.addStaff(memberVO);
    rttr.addFlashAttribute("staffInsertSuccessCount", rtn);
    return "redirect:/memberRole";
  }

  /**
   * Desc: 사원 권한 변경
   * @param checkList
   * @return 사용자별 권한관리 view page
   */
  @ResponseBody
  @RequestMapping(value = "/D/modifyMemberList", method = RequestMethod.POST)
  public String modifyMemberList(@RequestBody List<MemberVO> checkList) {
    for (MemberVO member:checkList) { memberService.modifyRole(member); }
    return "success";
  }

  /**
   * Desc: 인증번호 메일 전송
   * @param email
   * @return checkNum
   */
  @ResponseBody
  @RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
  public String emailAuth(String email) {
    log.info("전달 받은 이메일 주소 : " + email);
    int checkNum = RandomCode();
    sendEmail(email, checkNum);
    log.info("랜덤숫자 : " + checkNum);
    return Integer.toString(checkNum);
  }

  /**
   * Desc: 랜덤 인증번호 생성
   * @return checkNum
   */
  private int RandomCode() {
    //난수의 범위 111111 ~ 999999 (6자리 난수)
    Random random = new Random();
    return random.nextInt(888888) + 111111;
  }

  /**
   * Desc: 메일 전송
   * @param email
   * @param checkNum
   */
  private void sendEmail(String email, int checkNum) {
    String setFrom = "bl_f_@naver.com";
    String title = "C&R Furniture 프로젝트 비밀번호 변경 인증 이메일 입니다";
    String content = "C&R Furniture 프로젝트 비밀번호 변경 인증 이메일 입니다. <br>"
      + "인증 번호는 " + checkNum + "입니다.<br>"
      + "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
      helper.setFrom(setFrom);
      helper.setTo(email);
      helper.setSubject(title);
      helper.setText(content, true);
      mailSender.send(message);
    } catch (Exception e) {
      log.error("Error occurred while sending email: " + e.getMessage());
    }
  }
}
