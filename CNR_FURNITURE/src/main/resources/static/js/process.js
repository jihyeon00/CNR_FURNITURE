
    function processDate() {
        // 검색 폼을 서버에 전송
        document.getElementById('searchPro').submit();
    }


    /*제조지시 등록시 사용하는 메소드 */
     function insertPro() {
         return ($('#ins_lot_id').val() &&
                 $('#ins_item_id').val() &&
                 $('#ins_emp_id').val() &&
                 $('#ins_ct_id').val() &&
                 $('#ins_pi_id').val() &&
                 $('#ins_lot_size').val() &&
                 $('#ins_start_date').val() &&
                 $('#ins_end_date').val()
                 );
                 }

    /*제조지시 등록시 사용하는 메소드 */
    function insertProBox() {
           console.log($('#p_lot_id').val());

             if (!insertPro()) {
                Swal.fire({
                    title:'입력 오류',
                    text: '모든 정보를 입력하세요.',
                    icon: 'error',
                    confirmButtonColor: '#48088A'
                });
                return;
                }

             // 사용자가 등록을 원하는지 확인하는 창 표시
             Swal.fire({
             title:'정말 게시하겠습니까?',
             text: '게시후 삭제할 수 없습니다.',
             icon: 'warning',

             showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
             confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
             cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
             confirmButtonText: '확인', // confirm 버튼 텍스트 지정
             cancelButtonText: '취소', // cancel 버튼 텍스트 지정
             reverseButtons: true, // 버튼 순서 거꾸로

           }).then(result => {
              if (result.isConfirmed) {
              Swal.fire('게시가 완료되었습니다.', '', 'success');
              setTimeout(function() {
                  document.getElementById('insertProForm').submit();
              }, 2000); // 2초 후에 폼 제출
              }else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
              Swal.fire('게시가 취소되었습니다.', '', 'info');
               }
           });

        }

    /*제조 지시 날짜 조회시 데이터 불러오는 ajax */
    function sendFormWithAjax() {
        var startDate = document.getElementById('ctStartDate').value;
        var endDate = document.getElementById('ctEndDate').value;

        var url = '/manufacturingInstruction?ctStartDate=' + encodeURIComponent(startDate) + '&ctEndDate=' + encodeURIComponent(endDate);

        fetch(url)
        .then(function(response) {
            return response.text(); // 서버로부터 받은 HTML 응답을 텍스트로 변환
        })
        .then(function(html) {
            var parser = new DOMParser();
            var doc = parser.parseFromString(html, "text/html");
            var newTbody = doc.querySelector('.tbl-content.ProTable1').innerHTML; // 새로운 tbody 내용을 추출
            document.querySelector('#contractListTable tbody').innerHTML = newTbody; // 기존 tbody의 내용을 갱신
        })
        .catch(function(error) {
            console.error('Failed to load data: ' + error);
        });

        return false; // 폼의 기본 제출 동작을 방지
    }

    // 제조지시
    // 제조지시에서 등록 모달창에 데이터 추출 함수
    $(document).ready(function() {
        $('#addText').click(function() {
            $('#ctProList input:checked').each(function() {
                var row = $(this).closest('tr');
                var ct_id = row.find('td:nth-child(2)').text().trim();  // 계약번호 추출
                var ct_item_id = row.find('td:nth-child(3)').text().trim();  // 제품번호 추출
                var ct_quantity = parseFloat(row.find('td:nth-child(4)').text().trim());  // 수량 추출

                var calculated_quantity = ct_quantity * 1.2;  // 계약수량에 1.2 곱하기

                // 입력 필드에 값 설정
                $('#ins_ct_id').val(ct_id);
                $('#ins_item_id').val(ct_item_id);
                $('#ins_lot_size').val(calculated_quantity);  // 소수점 없이 설정

                console.log('Set Data:', ct_id, ct_item_id, calculated_quantity.toFixed(2));  // 콘솔에 설정된 데이터 로그

                $(this).prop('checked', false);  // 체크박스 해제
            });

            $('input[name="checkAll3"]').prop('checked', false);  // 전체 선택 체크박스 해제
        });
    });



  /*제조수행지시 등록시 사용하는 메소드 */
  function insertProDa() {
      return ($('#proLot').val() &&
              $('#proItem').val() &&
              $('#proPi').val() &&
              $('#p_plan_quantity').val() && // 생산시작날짜 확인
              $('#p_note').val()  // 계획수량 input ID 확인
             );
  }

  /*제조수행지시 등록시 사용하는 메소드 */
  function insertProDaBox() {
      if (!insertProDa()) {
          Swal.fire({
              title: '입력 오류',
              text: '모든 정보를 입력하세요.',
              icon: 'error',
              confirmButtonColor: '#48088A'
          });
          return;
      }
             // 사용자가 등록을 원하는지 확인하는 창 표시
             Swal.fire({
             title:'정말 게시하겠습니까?',
             text: '게시후 삭제할 수 없습니다.',
             icon: 'warning',

             showCancelButton: true,        // cancel버튼 보이기. 기본은 원래 없음
             confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
             cancelButtonColor: '#d33',     // cancel 버튼 색깔 지정
             confirmButtonText: '확인',      // confirm 버튼 텍스트 지정
             cancelButtonText: '취소',       // cancel 버튼 텍스트 지정
             reverseButtons: true,          // 버튼 순서 거꾸로

           }).then(result => {
              if (result.isConfirmed) {
              Swal.fire('게시가 완료되었습니다.', '', 'success');
              setTimeout(function() {
                  document.getElementById('insertProDaForm').submit();
              }, 2000); // 2초 후에 폼 제출
              }else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
              Swal.fire('게시가 취소되었습니다.', '', 'info');
               }
           });

        }



/*===================================================================================================================**/


// 공정 정보 관리
// 공정정보관리에서 등록모달창에 설비 목록 조회 ajax
$(document).ready(function() {
    // 체크박스 전체 선택 또는 해제 (설비 목록 테이블 전용)
    $('#checkAll1').click(function() {
        $('#mng input[type="checkbox"]').prop('checked', this.checked);
    });

    // 체크박스 전체 선택 또는 해제 (추가된 설비 목록 테이블 전용)
    $('#checkAll2').click(function() {
        $('#addedMng input[type="checkbox"]').prop('checked', this.checked);
    });

    // 추가 버튼 클릭 이벤트
    $('#addSelected').click(function() {
        $('#mng input:checked').each(function() {
            var row = $(this).closest('tr');
            row.find('input[type="checkbox"]').prop('checked', false);  // 체크 상태 해제
            $('#addedMng').append(row);
        });
        $('#checkAll1').prop('checked', false);
        $('#checkAll2').prop('checked', false);
    });

    // 제거 버튼 클릭 이벤트
    $('#removeSelected').click(function() {
        $('#addedMng input:checked').each(function() {
            var row = $(this).closest('tr');
            row.find('input[type="checkbox"]').prop('checked', false);  // 체크 상태 해제
            $('#mng').append(row);
        });
        $('#checkAll1').prop('checked', false);
        $('#checkAll2').prop('checked', false);
    });

    // 추가된 설비 목록에서 추가 버튼을 눌렀을 때 설비 목록으로 데이터를 입력해주는 이벤트
    $('#addSelected2').click(function() {
        console.log('Button clicked');

        $('#addedMng input:checked').each(function() {
            var row = $(this).closest('tr');
            var machineId = $.trim(row.find('td.miId').text()); // miId 클래스를 가진 td에서 텍스트 추출 후 공백 제거

            console.log('Extracted Machine ID:', machineId);  // 콘솔에 추출된 machineId 출력

            $('#pi_machine_id').val(machineId);  // 설비번호 입력 필드에 값 설정
            if ($('#pi_machine_id').val() === machineId) {
                console.log('Value set successfully');
            } else {
                console.log('Failed to set value:', $('#pi_machine_id').val());
            }

            row.find('input[type="checkbox"]').prop('checked', false);
        });

        $('#checkAll1').prop('checked', false);
        $('#checkAll2').prop('checked', false);
    });


    // 공정정보관리에서 등록모달창에 설비 목록 조회 ajax
    $('#prosearchbtnpVO').click(function() {
        searchManagementVO();
    });

    // 리셋 버튼 클릭 이벤트
    $('#resetBtn').click(function() {
        resetSearch();
    });

    // 설비 목록 조회
    function searchManagementVO() {
        var miId = $('#miId').val();  // 입력 필드에서 miId 값을 가져오기

        $.ajax({
            url: '/searchManagementVO',
            type: 'GET',
            data: {miId: miId},
            dataType: 'json',
            success: function(data) {
                updateTable(data, '#mng');
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error:', status, error, xhr);
            }
        });
    }

    // 리셋 검색
    function resetSearch() {
        $.ajax({
            url: '/processInfoAjax',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                $('#miId').val('');
                updateTable(data, '#mng');
                $('#addedMng').empty();  // 추가된 설비목록 비우기
            },
            error: function(xhr, status, error) {
                console.error('Reset AJAX Error:', status, error, xhr);
            }
        });
    }

    // 테이블 업데이트
    function updateTable(data, selector) {
        var tableContent = '';
        $.each(data, function(i, managementVO) {
            tableContent += '<tr>' +
                            '<td><input type="checkbox" name="check1"></td>' +
                            '<td class="miId">' + managementVO.miId + '</td>' +
                            '<td>' + managementVO.miName + '</td>' +
                            '<td>' + managementVO.miType + '</td>' +
                            '</tr>';
        });
        $(selector).html(tableContent);
    }
});



/*===================================================================================================================**/

/**
 * 계약 내역서를 PDF 형태로 생성하고 다운로드
 * jsPDF 라이브러리를 사용하여 PDF 문서를 초기화하고, 맑은 고딕 폰트를 설정한 후,
 * HTML 테이블의 데이터를 PDF로 변환하여 포맷팅
 */

function generatePDF() {
    const { jsPDF } = window.jspdf;  // window 객체에서 jsPDF를 추출합니다.
    const doc = new jsPDF();  // 새로운 jsPDF 문서 객체를 생성합니다.

    // 맑은 고딕 폰트 파일을 VFS에 추가하고 폰트를 등록:  resources/js/fileFont
    doc.addFileToVFS('malgun.ttf', _fonts);  // '_fonts'는 폰트의 base64 인코딩된 문자열
    doc.addFont('malgun.ttf', 'malgun', 'normal');
    doc.addFont('malgun.ttf', 'malgun', 'bold');  // 두꺼운 폰트도 등록

    // 문서의 제목 설정 ("계약 내역서")
    doc.setFont('malgun', 'bold');  // 폰트를 두꺼운 맑은 고딕으로 설정
    doc.setFontSize(16);
    const title = "계약 내역서";
    const pageWidth = doc.internal.pageSize.width;  // 문서의 페이지 너비 계산
    const titleWidth = doc.getTextWidth(title);  // 제목의 텍스트 너비 계산
    doc.text(title, (pageWidth - titleWidth) / 2, 20);  // 페이지 중앙 상단에 제목 배치

    doc.setFont('malgun', 'normal');  // 본문 폰트를 일반 맑은 고딕으로 설정
    doc.setFontSize(10);

    // autoTable 플러그인을 사용하여 HTML 테이블을 PDF로 변환
    if (doc.autoTable) {
        doc.autoTable({
            html: '#resultsTable',
            startY: 30,  // 제목 바로 아래에서 테이블 시작
            margin: { bottom: 40 },  // 페이지 하단 여백 설정
            styles: { font: 'malgun', fontStyle: 'normal' }, // 테이블의 폰트 스타일 지정
            didDrawPage: function(data) {
                // 계약 당사자 서명 추가
                // "계약 당사자 서명: " 문자열과 실제 서명("C&R Furniture")
                const signatureText = "계약 당사자 서명: ";
                const signature = "C&R Furniture";
                const fullSignatureText = signatureText + signature;  // 전체 서명 문자열 생성
                // 전체 서명 문자열의 너비를 계산
                const signatureTextWidth = doc.getTextWidth(fullSignatureText);
                // 전체 페이지 너비를 기준으로 전체 서명 문자열을 페이지 중앙에 위치시키기 위한 X 좌표를 계산
                const pageWidth = doc.internal.pageSize.width;  // 문서의 페이지 너비
                const signatureXPosition = (pageWidth - signatureTextWidth) / 2;  // 중앙 정렬을 위한 X 좌표 계산
                // 서명을 페이지의 하단에서 30pt 위에 위치시키기 위한 Y 좌표를 설정
                const signatureYPosition = doc.internal.pageSize.height - 30;  // 하단에서 30pt 위
                // 계산된 위치에 전체 서명 문자열을 삽입
                doc.text(fullSignatureText, signatureXPosition, signatureYPosition);  // 서명 텍스트 출력


                // 서명에 밑줄 추가 (굵게)
                doc.setLineWidth(0.5);  // 밑줄의 굵기를 0.5로 설정
                const signatureWidth = doc.getTextWidth(signature);  // 'C&R Furniture' 서명의 텍스트 너비를 계산
                // 서명 시작 위치에서 서명 텍스트 너비만큼 오른쪽으로 이동한 위치에 밑줄 추가
                // 밑줄의 시작 위치 설정: '계약 당사자 서명: ' 텍스트 너비를 추가
                doc.line(signatureXPosition + doc.getTextWidth(signatureText), signatureYPosition + 1,
                         signatureXPosition + doc.getTextWidth(signatureText) + signatureWidth, signatureYPosition + 1);

                // 현재 날짜를 페이지 하단 중앙에 추가
                var currentDate = new Date().toLocaleDateString('ko-KR', {
                    year: 'numeric', month: '2-digit', day: '2-digit'
                });  // 현재 날짜를 '년-월-일' 형식으로 포맷팅
                const dateLabel = "날짜: ";  // 날짜 라벨
                const fullDateText = dateLabel + currentDate;  // 전체 날짜 텍스트를 생성
                const dateTextWidth = doc.getTextWidth(fullDateText);  // 전체 날짜 텍스트의 너비를 계산
                const dateXPosition = (pageWidth - dateTextWidth) / 2;  // 날짜 텍스트를 페이지 중앙에 위치시키기 위한 X 좌표를 계산
                const dateYPosition = doc.internal.pageSize.height - 20;  // 날짜 텍스트를 페이지 하단에서 20pt 위에 위치시키기 위한 Y 좌표를 설정
                doc.text(fullDateText, dateXPosition, dateYPosition);  // 날짜 텍스트를 지정된 위치에 출력

                // 날짜에 밑줄 추가 (굵게)
                const dateWidth = doc.getTextWidth(currentDate);  // 실제 날짜 ('YYYY-MM-DD')의 텍스트 너비를 계산
                // 날짜 라벨 너비를 추가한 위치에서 시작하여 날짜 너비만큼 오른쪽으로 이동한 위치에 밑줄을 추가
                doc.line(dateXPosition + doc.getTextWidth(dateLabel), dateYPosition + 1,
                         dateXPosition + doc.getTextWidth(dateLabel) + dateWidth, dateYPosition + 1);

            }
        });

        // 생성된 PDF 파일을 'contract-details.pdf'라는 이름으로 저장
        doc.save('contract-details.pdf');
    } else {
        console.error('autoTable function is not available.');  // autoTable 함수가 사용가능하지 않을 경우 에러 로그
    }
}

$(document).ready(function() {
    $('#generatePDFBtn').click(generatePDF);  // PDF 생성 버튼에 이벤트 연결
    $('#addCt').click(checkboxArrPro);  // 데이터 로드 버튼 이벤트 연결
    updateDateDisplay();  // 날짜 업데이트 함수 호출
});


/**
 * 선택된 계약 정보를 서버로부터 조회
 * 체크박스로 선택된 계약 ID들을 서버에 요청하여 해당 계약 정보를 조회하고,
 * 응답 받은 데이터로 테이블을 업데이트
 */
function checkboxArrPro() {
    var checkProArr = [];
    if ($('.cityPro:checked').length < 1) {
        alert('계약을 선택하십시오.');  // 계약이 선택되지 않았을 때 경고 창
        return;
    }

    $(".cityPro:checked").each(function() {
        var id = $(this).closest('tr').find("#ctProAjax").text().trim();  // 선택된 체크박스에서 계약 ID 추출
        checkProArr.push(id);
    });

    var formattedIds = checkProArr.join(",");  // 배열을 쉼표로 구분된 문자열로 변환
    console.log("Selected IDs: " + formattedIds);  // 콘솔에 선택된 ID 로그

    $.ajax({
        url: "manufacturingInstructionForm",
        type: "GET",
        data: { formattedIds: formattedIds },
        success: function(response) {
            console.log("Response from server: ", response);  // 서버로부터의 응답 로그
            updateTableWithResponse(response);  // 테이블 업데이트 함수 호출
        },
        error: function(xhr, status, error) {
            console.error("Error occurred: " + error);  // 에러 발생시 로그
        }
    });
}

/**
 * 서버로부터 받은 데이터로 테이블 내용을 업데이트
 * @param {Array} data 서버로부터 받은 계약 데이터 배열
 */
function updateTableWithResponse(data) {
    var $table = $("#resultsTable tbody");
    $table.empty();  // 기존 테이블 내용 비우기

    data.forEach(function(item) {  // 받은 데이터 각 항목에 대해 테이블 행 추가
        var $row = $("<tr></tr>");
        $row.append($("<td></td>").text(item.id));
        $row.append($("<td></td>").text(item.company_name));
        $row.append($("<td></td>").text(item.item_name));
        $row.append($("<td></td>").text(item.money));
        $row.append($("<td></td>").text(item.quantity));
        $row.append($("<td></td>").text(item.unit));
        $row.append($("<td></td>").text(item.c_date));
        $row.append($("<td></td>").text(item.ob_date));
        $table.append($row);
    });
}

/**
 * 현재 날짜를 화면에 업데이트
 */
function updateDateDisplay() {
    var currentDate = new Date().toLocaleDateString('ko-KR');  // 현재 날짜를 한국어 형식으로 변환
    $('.ctP').text('날짜: ' + currentDate);  // 날짜 표시 엘리먼트에 날짜 설정
}
