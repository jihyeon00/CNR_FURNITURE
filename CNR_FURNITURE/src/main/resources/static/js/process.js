
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




  /*제조수행지시 등록시 사용하는 메소드 */
  function insertProDa() {
      return ($('#proLot').val() &&
              $('#proItem').val() &&
              $('#proPi').val() &&
              $('#p_plan_quantity').val() && // 생산시작날짜 확인 input ID 수정 필요
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







