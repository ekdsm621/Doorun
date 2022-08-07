<script src="http://code.jquery.com/jquery-latest.js"></script>
$(document).ready(function(){
	
	$("#joinBtn").click(function(){
      var query = {meeting_id:$("#meeting_id").val(), member_id:$("#member_id")};
      
       $.ajax({
          type:"post",
          url:"joinMeeting.do",
          data:query,
          success:function(check){
             if(check == 'n'){
                alert("모집이 완료된 모임입니다.");
             }else{
                alert("모임에 참가하셨습니다.");	
			}
          }
       });
   });
});