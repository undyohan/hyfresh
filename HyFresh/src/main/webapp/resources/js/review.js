function modifySubmit(rno, rate, title, content){
   let modData = {rno:rno, rate:rate, title:title, content:content};
   $.ajax({
      url: "/review/"+cno,
      type: "put",
      data: JSON.stringify(modData),
      contentType: "application/json; charset=utf-8"
   }).done(function(result){
      alert(result);
   });
}
function transferToModal(pno, writer, odno){
   let titleInput = '리뷰 작성하기';
   $(document).find(".modal-title").text(titleInput);
   let contentInput = '<h4 style="text-align:center;">상품은 만족하셨나요?</h4>';
   contentInput += '<input type="hidden" name="rate" id="rate">';
   contentInput += '<input type="hidden" value="' + odno + '" name="odno" id="odno">';
   contentInput += '<input type="hidden" value="'+ pno +'" name="pno" id="pno">';
   contentInput += '<input type="hidden" value="'+ writer +'" name="writer" id="writer">';
   contentInput += '<div id="starDiv" class="mb-3" style="display: flex; justify-content: center;">';
   contentInput += '<img id="star01" src="/resources/img/star.png" style="width:50px; height:50px; cursor: pointer">';
   contentInput += '<img id="star02" src="/resources/img/star.png" style="width:50px; height:50px; cursor: pointer">';
   contentInput += '<img id="star03" src="/resources/img/star.png" style="width:50px; height:50px; cursor: pointer">';
   contentInput += '<img id="star04" src="/resources/img/star.png" style="width:50px; height:50px; cursor: pointer">';
   contentInput += '<img id="star05" src="/resources/img/star.png" style="width:50px; height:50px; cursor: pointer">';
   contentInput += '</div>';
   contentInput += '<input class="form-control mb-3" id="title" type="text" placeholder="후기의 제목을 입력해주세요." name="title">';
   contentInput += '<textarea name="content" id="rcontent" form="r-form" placeholder="사용 시 느꼈던 점을 작성해주세요." style="width:100%; height: 200px"></textarea>';
   contentInput += '<input type="file" class="form-control" name="imgfile">';
   $(document).find("#r-form").html(contentInput);   
}

function printListReview(listArr, reviewTotal, page){
   $("#rvwList").children().remove();
   for (let rvo of listArr) {
      let rate = '<p class="s0" style="margin:10px 0 0 0;"></p>';
      if(rvo.rate == 0) {
         rate = '<p class="s0" style="margin:10px 0 0 0;"></p>';
      }else if(rvo.rate == 1) {
         rate = '<p class="s1" style="margin:10px 0 0 0;"></p>';
      }else if(rvo.rate == 2) {
         rate = '<p class="s2" style="margin:10px 0 0 0;"></p>';
      }else if(rvo.rate == 3) {
         rate = '<p class="s3" style="margin:10px 0 0 0;"></p>';
      }else if(rvo.rate == 4) {
         rate = '<p class="s4" style="margin:10px 0 0 0;"></p>';
      }else if(rvo.rate == 5) {
         rate = '<p class="s5" style="margin:10px 0 0 0;"></p>';
      }
      
      let content = '<p>' + rvo.content + '</p>';
      if(rvo.img != '/images/NONE') {
         content = '<img src="' + rvo.img + '" style="width:50%;">' + content;
      }
      
      let rwvTag = '<div class="card staticDiv"><div class="card-header"><ul class="card-link" data-toggle="collapse" href="#collapse'+ rvo.rno +'" style="list-style:none; text-align:center;">';
      rwvTag += '<li style="float:left;width: 25%;box-sizing: border-box;">' + rate + '</li>';
      rwvTag += '<li style="float:left; line-height: 43px;width: 50%;box-sizing: border-box;">' + rvo.title + '</li>';
      rwvTag += '<li style="float:left; line-height: 43px;width: 10%;box-sizing: border-box; font-size:12px; color:#b2b2b2">' + displayTime(rvo.modd8) + '</li>';
      rwvTag += '<li style="float:left; line-height: 43px;width: 10%;box-sizing: border-box; font-size:12px; color:#b2b2b2">' + rvo.writer + '</li>';
      rwvTag += '<li style="float:left; line-height: 43px;width: 5%;box-sizing: border-box; font-size:12px; color:#b2b2b2; cursor:pointer "><img src="../resources/img/icon_arrow_down_gray.png"></li></ul></div><div id="collapse' + rvo.rno + '" class="collapse" data-parent="#rvwList">';
      rwvTag += '<div class="card-body" style="width: 80%; margin: 0 auto; text-align: center;">'+ content + '</div></div></div>';
      $("#rvwList").append(rwvTag);
   }
   printReviewPaging(reviewTotal,page);
}

function printReviewPaging(reviewTotal, page) {
   let reviewPagingObj = '<ul class="pagination">';
   let endPagingNum = Math.ceil(page/10.0) * 10;
   let beginPagingNum = endPagingNum - 9;
   let prev = beginPagingNum != 1;
   let next = false;
   
   if(endPagingNum * 10 >= reviewTotal) {
      endPagingNum = Math.ceil(reviewTotal/10.0);
   } else {
      next = true;
   }
   
   if(prev){
      reviewPagingObj += '<li class="page-item">';
      reviewPagingObj += '<a class="page-link" href="'+(beginPagingNum-1)+'" style="position:static;">Prev</a></li>';
   }
   for (var i = beginPagingNum; i <= endPagingNum ; i++) {
      let classActive = page == i ? ' active' : '';
      reviewPagingObj += '<li class="page-item'+classActive+'">';
      reviewPagingObj += '<a class="page-link" href="'+i+'" style="position:static;">'+i+'</a></li>';
   }
   if(next){
      reviewPagingObj += '<li class="page-item">';
      reviewPagingObj += '<a class="page-link" href="'+(endPagingNum+1)+'" style="position:static;">Next</a></li>';
   }
   reviewPagingObj += '</ul>';
   $("#rvwPaging").html(reviewPagingObj);
}

function listReview(param_pno, page){
   let pageNo = page > 1 ? page : 1;
   $.getJSON("/review/list/"+param_pno+"/"+pageNo+".json",function(rdto){
      printListReview(rdto.rlist, rdto.rvwCnt, pageNo);
   }).fail(function(){
      alert("후기 리스트 출력 실패")
   });
}
function displayTime(modd8){
   let today = new Date();
   let changeModd8 = new Date(modd8);
   
   let todayYear = today.getFullYear();
   let todayMonth = today.getMonth()+1; // 0~11
   let todayDate = today.getDate();
   
   let modYear = changeModd8.getFullYear();
   let modMonth = changeModd8.getMonth()+1;
   let modDate = changeModd8.getDate();
   
   let modHour = changeModd8.getHours();
   let modMin = changeModd8.getMinutes();
   let modSec = changeModd8.getSeconds();
   
   let hour = (modHour > 9 ? "" :"0") + modHour;
   let min = (modMin > 9 ? "" : "0") + modMin;
   let sec = (modSec > 9 ? "" : "0") + modSec;
   let month = (modMonth > 9 ? "" : "0") + modMonth;
   let day = (modDate > 9 ? "" : "0") + modDate;
   
   let diff = todayYear == modYear && todayMonth == modMonth && todayDate == modDate;
   let dateStr = modYear+"-"+month+"-"+day;
   let timeStr = hour+":"+min+":"+sec;
   
   return diff ? timeStr : dateStr;
}