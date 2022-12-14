<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.*" %>
    <%@page import="com.product.ProductDAO" %>
    <%@page import="com.product.ProductDTO" %>
    <%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<%
	String pageNum = null;
	int pageint = 1;
	if(request.getParameter("pageNum") !=null){
		pageNum = (String)request.getParameter("pageNum");
		pageint = Integer.parseInt(pageNum);
	}	
%>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>최저가 상품</title>
    <script
      src="https://kit.fontawesome.com/20629bba5a.js"
      crossorigin="anonymous"
    ></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#header").load("../html/header.jsp"); // 원하는 파일 경로를 삽입
      });
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet"
    />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/style.css" />
  </head>
  <body>
    <header>
      <div id="header"></div>
    </header>
    
    <main>
      <div id="main_box">
        <div class="main_title3">최저가 상품</div>
      </div>
    </main>
<%@ include file="../html/cart.jsp" %>
  
     <% ProductDAO dao = new ProductDAO();
     	ArrayList<ProductDTO> list = dao.lowestAll();
	      System.out.println();
		
	   try{
		   if(pageint == 1){  
		    	int listlength = 0;
		    	if(list.size() < 100){
		    		if((list.size()%3) == 0){
					  	listlength = list.size()-3;
			    	}else if((list.size()%3) == 1){
			    		listlength = list.size()-2;
			    	}else{
			    		listlength = list.size()-1;
			    	}
		    	}else{
		    		listlength = 97;
		    	}  
		      for(int i = 0 ; i<= listlength;i+=3){
	    	  %>
      <section id="main_container">
          <div class="main_contents2">
            <div class="main_item" >
            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
           	<a href=<%=list.get(i).getLink()%>><input type="text" name="link" value="<%=list.get(i).getLink()%>" style="display: none;">
	            <div class = "prodImg" style="background-image: url(<%=list.get(i).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i).getProdImage()%>" style="display: none;"></div>           
	            <p class="mart" ><%=list.get(i).getMartName()%><input type="text" name="martName" value="<%=list.get(i).getMartName()%>" style="display: none;"></p>
	            <p class="prodName"><%=list.get(i).getProdName()%><input type="text" name="prodName" value="<%=list.get(i).getProdName()%>" style="display: none;"></p>
	            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i).getProdPrice()%>" style="display: none;"><%=list.get(i).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i).getProdStar()%>점</span>
	            <span class="prodReview">(<%=list.get(i).getProdReview()%>개)</span></p>
	       	</a>
            </div>
            <%@ include file="../html/button.jsp" %>
            </form> 
            <div class="main_item" >
            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
            <a href=<%=list.get(i+1).getLink() %>><input type="text" name="link" value="<%=list.get(i+1).getLink()%>" style="display: none;">
	            <div class = "prodImg" style="background-image: url(<%=list.get(i+1).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i+1).getProdImage()%>" style="display: none;"></div>           
	            <p class="mart" ><%=list.get(i+1).getMartName()%><input type="text" name="martName" value="<%=list.get(i+1).getMartName()%>" style="display: none;"></p>
	            <p class="prodName"><%=list.get(i+1).getProdName()%><input type="text" name="prodName" value="<%=list.get(i+1).getProdName()%>" style="display: none;"></p>
	            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i+1).getProdPrice()%>" style="display: none;"><%=list.get(i+1).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i+1).getProdStar()%>점</span>
	            <span class="prodReview">(<%=list.get(i+1).getProdReview()%>개)</span></p>
            </a>
            </div>
            <%@ include file="../html/button.jsp" %>
            </form>
            <div class="main_item" >
            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
             <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
            <a href=<%=list.get(i+2).getLink() %>><input type="text" name="link" value="<%=list.get(i+2).getLink()%>" style="display: none;">
	            <div class = "prodImg" style="background-image: url(<%=list.get(i+2).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i+2).getProdImage()%>" style="display: none;"></div>           
	            <p class="mart" ><%=list.get(i+2).getMartName()%><input type="text" name="martName" value="<%=list.get(i+2).getMartName()%>" style="display: none;"></p>
	            <p class="prodName"><%=list.get(i+2).getProdName()%><input type="text" name="prodName" value="<%=list.get(i+2).getProdName()%>" style="display: none;"></p>
	            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i+2).getProdPrice()%>" style="display: none;"><%=list.get(i+2).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i+2).getProdStar()%>점</span>
	            <span class="prodReview">(<%=list.get(i+2).getProdReview()%>개)</span></p>
            </a>
            </div>
            <%@ include file="../html/button.jsp" %>
            </form>
          </div>
      </section>
      <%	}
	    }else if(pageint == list.size()/100){
	    	int size =0;
	    	size = ((pageint-1)*100)+97;
	    	for(int i = (pageint-1)*100 ; i< size ;i+=3){%>
		      <section id="main_container">
		          <div class="main_contents2">
		            <div class="main_item" >
		            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
		           	<a href=<%=list.get(i).getLink()%>><input type="text" name="link" value="<%=list.get(i).getLink()%>" style="display: none;">
			            <div class = "prodImg" style="background-image: url(<%=list.get(i).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i).getProdImage()%>" style="display: none;"></div>           
			            <p class="mart" ><%=list.get(i).getMartName()%><input type="text" name="martName" value="<%=list.get(i).getMartName()%>" style="display: none;"></p>
			            <p class="prodName"><%=list.get(i).getProdName()%><input type="text" name="prodName" value="<%=list.get(i).getProdName()%>" style="display: none;"></p>
			            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i).getProdPrice()%>" style="display: none;"><%=list.get(i).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i).getProdStar()%>점</span>
			            <span class="prodReview">(<%=list.get(i).getProdReview()%>개)</span></p>
			       	</a>
		            </div>
		            <%@ include file="../html/button.jsp" %>
		            </form> 
		            <div class="main_item" >
		            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
		            <a href=<%=list.get(i+1).getLink() %>><input type="text" name="link" value="<%=list.get(i+1).getLink()%>" style="display: none;">
			            <div class = "prodImg" style="background-image: url(<%=list.get(i+1).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i+1).getProdImage()%>" style="display: none;"></div>           
			            <p class="mart" ><%=list.get(i+1).getMartName()%><input type="text" name="martName" value="<%=list.get(i+1).getMartName()%>" style="display: none;"></p>
			            <p class="prodName"><%=list.get(i+1).getProdName()%><input type="text" name="prodName" value="<%=list.get(i+1).getProdName()%>" style="display: none;"></p>
			            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i+1).getProdPrice()%>" style="display: none;"><%=list.get(i+1).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i+1).getProdStar()%>점</span>
			            <span class="prodReview">(<%=list.get(i+1).getProdReview()%>개)</span></p>
		            </a>
		            </div>
		            <%@ include file="../html/button.jsp" %>
		            </form>
		            <div class="main_item" >
<<<<<<< HEAD
		            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
=======
		             <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
>>>>>>> refs/remotes/origin/main
		            <a href=<%=list.get(i+2).getLink() %>><input type="text" name="link" value="<%=list.get(i+2).getLink()%>" style="display: none;">
			            <div class = "prodImg" style="background-image: url(<%=list.get(i+2).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i+2).getProdImage()%>" style="display: none;"></div>           
			            <p class="mart" ><%=list.get(i+2).getMartName()%><input type="text" name="martName" value="<%=list.get(i+2).getMartName()%>" style="display: none;"></p>
			            <p class="prodName"><%=list.get(i+2).getProdName()%><input type="text" name="prodName" value="<%=list.get(i+2).getProdName()%>" style="display: none;"></p>
			            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i+2).getProdPrice()%>" style="display: none;"><%=list.get(i+2).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i+2).getProdStar()%>점</span>
			            <span class="prodReview">(<%=list.get(i+2).getProdReview()%>개)</span></p>
		            </a>
		            </div>
		            <%@ include file="../html/button.jsp" %>
		            </form>
		          </div>
		      </section>
	      <% }
	    	}
	    else{
    	  for(int i = (pageint-1)*100 ; i< ((pageint-1)*100)+97;i+=3){%>
		     <section id="main_container">
		          <div class="main_contents2">
		            <div class="main_item" >
		            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
		           	<a href=<%=list.get(i).getLink()%>><input type="text" name="link" value="<%=list.get(i).getLink()%>" style="display: none;">
			            <div class = "prodImg" style="background-image: url(<%=list.get(i).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i).getProdImage()%>" style="display: none;"></div>           
			            <p class="mart" ><%=list.get(i).getMartName()%><input type="text" name="martName" value="<%=list.get(i).getMartName()%>" style="display: none;"></p>
			            <p class="prodName"><%=list.get(i).getProdName()%><input type="text" name="prodName" value="<%=list.get(i).getProdName()%>" style="display: none;"></p>
			            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i).getProdPrice()%>" style="display: none;"><%=list.get(i).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i).getProdStar()%>점</span>
			            <span class="prodReview">(<%=list.get(i).getProdReview()%>개)</span></p>
			       	</a>
		            </div>
		            <%@ include file="../html/button.jsp" %>
		            </form> 
		            <div class="main_item" >
		            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
		            <a href=<%=list.get(i+1).getLink() %>><input type="text" name="link" value="<%=list.get(i+1).getLink()%>" style="display: none;">
			            <div class = "prodImg" style="background-image: url(<%=list.get(i+1).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i+1).getProdImage()%>" style="display: none;"></div>           
			            <p class="mart" ><%=list.get(i+1).getMartName()%><input type="text" name="martName" value="<%=list.get(i+1).getMartName()%>" style="display: none;"></p>
			            <p class="prodName"><%=list.get(i+1).getProdName()%><input type="text" name="prodName" value="<%=list.get(i+1).getProdName()%>" style="display: none;"></p>
			            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i+1).getProdPrice()%>" style="display: none;"><%=list.get(i+1).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i+1).getProdStar()%>점</span>
			            <span class="prodReview">(<%=list.get(i+1).getProdReview()%>개)</span></p>
		            </a>
		            </div>
		            <%@ include file="../html/button.jsp" %>
		            </form>
		            <div class="main_item" >
<<<<<<< HEAD
		            <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
=======
		             <form name = "addForm" onsubmit="return confirm('상품을 관심상품에 추가하시겠습니까?')" action="../cartAction.jsp" method="post">
>>>>>>> refs/remotes/origin/main
		            <a href=<%=list.get(i+2).getLink() %>><input type="text" name="link" value="<%=list.get(i+2).getLink()%>" style="display: none;">
			            <div class = "prodImg" style="background-image: url(<%=list.get(i+2).getProdImage()%>);" ><input type="text" name="prodImage" value="<%=list.get(i+2).getProdImage()%>" style="display: none;"></div>           
			            <p class="mart" ><%=list.get(i+2).getMartName()%><input type="text" name="martName" value="<%=list.get(i+2).getMartName()%>" style="display: none;"></p>
			            <p class="prodName"><%=list.get(i+2).getProdName()%><input type="text" name="prodName" value="<%=list.get(i+2).getProdName()%>" style="display: none;"></p>
			            <p class="prodPrice"><input type="text"  name="prodPrice" value="<%=list.get(i+2).getProdPrice()%>" style="display: none;"><%=list.get(i+2).getProdPrice()%>원&nbsp;&nbsp;<span class="prodReview"> <%=list.get(i+2).getProdStar()%>점</span>
			            <span class="prodReview">(<%=list.get(i+2).getProdReview()%>개)</span></p>
		            </a>
		            </div>
		            <%@ include file="../html/button.jsp" %>
		            </form>
		          </div>
		      </section>
      <% }}
	    }catch(Exception e){%>
      		 </div>
          </section>
      	<% }%>
      	</div>
   <nav aria-label="Page navigation example">
    <ul class="pagination">
   	<!-- 이전버튼 -->
      <li class="page-item">
      <%int pagebtn = 0;
      	if(pageint >= 11){
      		pagebtn = pageint-10;
    	  %>
      <% }else{
      	pagebtn = 1;
      	}%>
        <a class="page-link" href="lowestPage.jsp?pageNum=<%=pagebtn%>" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <%
      	
      	int list_length = 0;
      	if((list.size()%100) == 0){
      		list_length = list.size()/100;
      	}else{
      		list_length = list.size()/100+1;
      	}
      	System.out.println(list_length);
      	System.out.println((list.size()%100));
      	if((list.size()%100) == 0){
      		int lastPage = 0;
      		if( (10+pageint) > list_length){
      			lastPage = list_length;
      		}else{
      			lastPage = 10+pageint;
      		}
          	//입력된 값 + 10 보다 마지막 페이지가 작을 경우 마지막 페이지만 나와주게하는 조건문 생성 
          		for(int j = pageint ;j< lastPage;j++){
            	      %>
            	      <li class="page-item"><a class="page-link" href="lowestPage.jsp?pageNum=<%=j%>"><%=j%></a></li>
            	<%}
      	}else{
      		//클릭한 페이지 번호가 마지막 페이지에 근접했을때 그이상으로 출력안되도록 해주는 로직 
      		 if((pageint%10 != 0)&&((list_length-pageint) < 10)){
      			int last=1;
     			if(pageint > 10){
     				last = pageint/10*10;
     			}
          		for(int j = last ;j<= list_length;j++){
            	      %>
            	      <li class="page-item"><a class="page-link" href="lowestPage.jsp?pageNum=<%=j%>"><%=j%></a></li>
            		<%}
          	}
      		 else if (pageint/10 == list_length/10){
          		for(int j = pageint ;j< pageint + list_length%10 ;j++){
          	      %>
          	      <li class="page-item"><a class="page-link" href="lowestPage.jsp?pageNum=<%=j%>"><%=j%></a></li>
          		<%}
          	}else{
          		for(int j = pageint ;j< 10+pageint;j++){
          	      %>
          	      <li class="page-item"><a class="page-link" href="lowestPage.jsp?pageNum=<%=j%>"><%=j%></a></li>
          		<%
          		}
        	}
      	}
       %>
       <!-- 다음버튼 -->
      <li class="page-item">
      <%int nextbtn = 0;
      	if((pageint+10) >= list_length){    		
          		nextbtn =pageint;
      	}else{
      		nextbtn = pageint+10;
      	}
      	%>
        <a class="page-link" href="lowestPage.jsp?pageNum=<%=nextbtn%>" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
    <footer id="main_footer">
      <div class="footer_box">
        <div>
          스마트인재 개발원<span style="font-size: 18px">
            tel ) 070-4120-6295</span
          >
        </div>
        <div>K-Digital Training</div>
        <div>DCX기반 빅데이터분석 서비스 개발자 과정</div>
      </div>
      <div class="footer_box">
        <div>TEAM_ NEXTLEVEL</div>
        <div id="team_name">
          <div>오진서</div>
          <div>이지영</div>
          <div>임태규</div>
          <div>이정욱</div>
        </div>
      </div>
      <div class="icon_style">
        <a href="https://www.facebook.com/"
          ><i class="fa-brands fa-facebook"></i
        ></a>
        <a href="https://github.com/"
          ><i class="fa-brands fa-square-github"></i
        ></a>
        <a href="https://www.youtube.com/channel/UCubIpLB7cA9tWIUZ26WFKPg"
          ><i class="fa-brands fa-youtube"></i
        ></a>
        <a href=""><i class="fa-brands fa-square-js"></i></a>
      </div>
    </footer>
 <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>