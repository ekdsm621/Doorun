<script src="http://code.jquery.com/jquery-latest.js"></script>
$(document).ready(function(){
	
	$("#joinBtn").on(function(){
      var query = {meeting_id:$("#meeting_id").val(), member_id:$("#member_id")};
      
       $.ajax({
          type:"post",
          url:"/joinMeeting.do",
          data:query,
          success:function(data){
			 window.location.href = "/meeting.do";
            alert(data);
          }
       });
   });
});