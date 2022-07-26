function checkInsert(){
	 if( frm.title.value == "" ) {
        frm.title.focus();
        alert("모임의 제목을 입력해 주십시오.");
        return false;
    }
	 if( frm.content.value == "" ) {
        frm.content.focus();
        alert("모임의 내용을 입력해 주십시오.");
        return false;
    }
	 if( frm.location.value == "" ) {
        frm.location.focus();
        alert("모임의 장소를 입력해 주십시오.");
        return false;
    }
	 if( frm.meeting_date.value == "" ) {
        frm.meeting_date.focus();
        alert("모임의 날짜를 입력해 주십시오.");
        return false;
    }

	if(frm.meeting_date.value){
		var now = new Date();
		var meet_date = new Date(frm.meeting_date.value);
	  	if(meet_date < now){
	    alert("모임날짜는 현재날짜보다 빠를 수 없습니다.");
	    frm.meeting_date.focus();
	    return false;
	  }
    }
	 if( frm.meeting_time.value == "" ) {
        frm.meeting_time.focus();
        alert("모임의 시간을 입력해 주십시오.");
        return false;
    }
	 if( frm.total_member.value == "" ) {
        frm.total_member.focus();
        alert("모임의 인원을 입력해 주십시오.");
        return false;
    }
	 if( frm.total_member.value < 2 ) {
        frm.total_member.focus();
        alert("모임의 인원은 2명 이상이어야 합니다.");
        return false;
    }
}

function checkUpdate(){
	 if( update_frm.title.value == "" ) {
        update_frm.title.focus();
        alert("모임의 제목을 입력해 주십시오.");
        return false;
    }
	 if( update_frm.content.value == "" ) {
        update_frm.content.focus();
        alert("모임의 내용을 입력해 주십시오.");
        return false;
    }
	 if( update_frm.location.value == "" ) {
        update_frm.location.focus();
        alert("모임의 장소를 입력해 주십시오.");
        return false;
    }
	 if( update_frm.meeting_date.value == "" ) {
        update_frm.meeting_date.focus();
        alert("모임의 날짜를 입력해 주십시오.");
        return false;
    }

	if(update_frm.meeting_date.value){
		var now = new Date();
		var meet_date = new Date(update_frm.meeting_date.value);
	  	if(meet_date < now){
	    alert("모임날짜는 현재날짜보다 빠를 수 없습니다.");
	    update_frm.meeting_date.focus();
	    return false;
	  }
    }
	 if( update_frm.meeting_time.value == "" ) {
        update_frm.meeting_time.focus();
        alert("모임의 시간을 입력해 주십시오.");
        return false;
    }
	 if( update_frm.total_member.value == "" ) {
        update_frm.total_member.focus();
        alert("모임의 인원을 입력해 주십시오.");
        return false;
    }
	 if( update_frm.total_member.value < 2 ) {
        update_frm.total_member.focus();
        alert("모임의 인원은 2명 이상이어야 합니다.");
        return false;
    }
}


