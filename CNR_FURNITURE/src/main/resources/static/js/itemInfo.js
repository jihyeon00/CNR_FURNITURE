

    /*제품 검색*/

    let searchItemForm = $("#searchItemForm");
        $("#searchItemForm button").on("click",
            function(e) {
                if (!searchItemForm.find("option:selected").val()) {
                    alert("검색종류를 선택하세요");
                    return false;
                }

                if (!searchItemForm.find("input[name='keyword']").val()) {
                    alert("키워드를 입력하세요");
                    return false;
                }

                e.preventDefault();

                searchItemForm.submit();
            });


	
	
	
    /*등록시 사용  */
	function checkAllFields() {
	    return ($('#i_name').val() && $('#i_color').val() && $('#i_standard').val() && $('#i_type').val() && $('#i_uses').val());
	}
	
	
	function insertItemBox() {
		   console.log($('#i_name').val());
		
		     if (!checkAllFields()) {
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
			 title: '정말 게시하겠습니까?',
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
			      document.getElementById('insertItemForm').submit();
			  }, 2000); // 2초 후에 폼 제출
		      }else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
			  Swal.fire('게시가 취소되었습니다.', '', 'info');
		       }
		   });
		
		} 	
	
    /* 수정할 ID 값을 모달창으로 불러오기  */
      function ItemUpdates(i_id) {
        $.get("/itemUpdate/"+i_id , function(result) {
            console.log("itemUpdate:", result);

            $('#i_id2').val(result.i_id);
              $('#i_name2').val(result.i_name);
              $('#i_color2').val(result.i_color);
              $('#i_standard2').val(result.i_standard);
              $('#i_type2').val(result.i_type);
              $('#i_uses2').val(result.i_uses);

          }).fail(function(xhr, status, err){
              console.log("itemUpdate err:", err);
          });
    }
	
    /* 수정시 사용  */
 	function updateItemBox() {
		   console.log("수정이야~");
		   
	 Swal.fire({
	   	    title: '수정 하시겠습니까?',
	   	    text: '',
	   	    icon: 'warning',
	   	    showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	   	    confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	   	    cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	   	    confirmButtonText: '확인', // confirm 버튼 텍스트 지정
	   	    cancelButtonText: '취소', // cancel 버튼 텍스트 지정                      
	   	    reverseButtons: true, // 버튼 순서 거꾸로
	   	}).then(result => {
	   	    if (result.isConfirmed) {
	   	        Swal.fire('수정 되었습니다.', '', 'success');
	   	        setTimeout(function() {
	   	         document.getElementById('insertUpdateForm').submit();
	   	        }, 2000); // 2초 후에 폼 제출
	   	    } else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
	   	        Swal.fire('수정 취소되었습니다.', '', 'info');
						}
	   	    
	    });   
	}