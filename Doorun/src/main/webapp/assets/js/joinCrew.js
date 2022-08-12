<script src="http://code.jquery.com/jquery-latest.js"></script>
$(document).ready(function(){
	
	$("#joinBtn").on(function(){
      var query = {crew_id:$("#crew_id").val(), member_id:$("#member_id")};
      
       $.ajax({
          type:"post",
          url:"/joinCrew.do",
          data:query,
          success:function(data){
            alert(data);
          }
       });
   });
});