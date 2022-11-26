<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.xml.transform.Result" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--
Todo : 회사 이름 길어질때 해결책
     : 실시간 랭킹
     :
-->
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Caps, 직무 정보">
    <meta name="description" content="">
    <title>Home</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Home.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 4.21.12, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
    
    
    
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"sameAs": [
				"https://facebook.com/name",
				"https://www.instagram.com/name",
				"https://www.chungbuk.ac.kr/site/www/main.do"
		]
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body u-xl-mode" data-lang="en">
  <%
    request.setCharacterEncoding("utf-8");
    Connection conn = null;
    String jdbcUrl = "jdbc:mysql://15.164.192.100:52817/caps";
    String dbId = "caps";
    String dbPass = "1234";
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
    PreparedStatement pstmt =null;
    String sql;
    session=request.getSession();
  %>
  <header class="u-align-left u-clearfix u-header u-section-row-container" id="sec-ba49">
    <div class="u-section-rows">
        <div class="u-grey-80 u-section-row u-section-row-1" id="sec-46aa">
          <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
            <div class="u-social-icons u-spacing-10 u-social-icons-1">
              <a class="u-social-url" title="facebook" target="_blank" href="https://facebook.com/name"><span class="u-icon u-social-facebook u-social-icon u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-b638"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-b638"><circle fill="currentColor" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M73.5,31.6h-9.1c-1.4,0-3.6,0.8-3.6,3.9v8.5h12.6L72,58.3H60.8v40.8H43.9V58.3h-8V43.9h8v-9.2
            c0-6.7,3.1-17,17-17h12.5v13.9H73.5z"></path></svg></span>
              </a>
              <a class="u-social-url" title="instagram" target="_blank" href="https://www.instagram.com/name"><span class="u-icon u-social-icon u-social-instagram u-icon-2"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-59e7"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-59e7"><circle fill="currentColor" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M55.9,38.2c-9.9,0-17.9,8-17.9,17.9C38,66,46,74,55.9,74c9.9,0,17.9-8,17.9-17.9C73.8,46.2,65.8,38.2,55.9,38.2
            z M55.9,66.4c-5.7,0-10.3-4.6-10.3-10.3c-0.1-5.7,4.6-10.3,10.3-10.3c5.7,0,10.3,4.6,10.3,10.3C66.2,61.8,61.6,66.4,55.9,66.4z"></path><path fill="#FFFFFF" d="M74.3,33.5c-2.3,0-4.2,1.9-4.2,4.2s1.9,4.2,4.2,4.2s4.2-1.9,4.2-4.2S76.6,33.5,74.3,33.5z"></path><path fill="#FFFFFF" d="M73.1,21.3H38.6c-9.7,0-17.5,7.9-17.5,17.5v34.5c0,9.7,7.9,17.6,17.5,17.6h34.5c9.7,0,17.5-7.9,17.5-17.5V38.8
            C90.6,29.1,82.7,21.3,73.1,21.3z M83,73.3c0,5.5-4.5,9.9-9.9,9.9H38.6c-5.5,0-9.9-4.5-9.9-9.9V38.8c0-5.5,4.5-9.9,9.9-9.9h34.5
            c5.5,0,9.9,4.5,9.9,9.9V73.3z"></path></svg></span>
              </a>
              <a class="u-social-url" target="_blank" data-type="Custom" title="CBNU" href="https://www.chungbuk.ac.kr/site/www/main.do"><span class="u-file-icon u-icon u-social-custom u-social-icon u-icon-3"><img src="images/cbnu.png" alt=""></span>
              </a>
            </div>
            <form action="#" method="get" class="u-border-1 u-border-grey-30 u-expanded-width-xs u-search u-search-right u-search-1">
              <button class="u-search-button" type="submit">
                <span class="u-search-icon u-spacing-10 u-text-grey-40">
                  <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 56.966 56.966" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-9dab"></use></svg>
                  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="svg-9dab" x="0px" y="0px" viewBox="0 0 56.966 56.966" style="enable-background:new 0 0 56.966 56.966;" xml:space="preserve" class="u-svg-content"><path d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z"></path><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
                </span>
              </button>
              <input class="u-search-input" type="search" name="search" value="" placeholder="Search">
            </form>
          </div>
          
          
          
          
          
        </div>
        <div class="u-image u-section-row u-image-1" id="sec-37e8" data-image-width="1980" data-image-height="1200">
          <div class="u-clearfix u-sheet u-sheet-2">
            <h1 class="u-text u-text-default u-text-1">
              <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-white u-btn-1" href="home.jsp">Caps<br>
              </a>
            </h1>
            <a href="login.jsp" class="u-border-none u-btn u-btn-round u-button-style u-hover-palette-2-base u-palette-3-base u-radius-50 u-btn-2">LOGIN</a>
            <p class="u-text u-text-default u-text-white u-text-2">당신의 직무를 찾아드립니다~<br>
            </p>
          </div>
          
          
          
          
          
        </div>
      </div></header>
    <div class="ce">
    <section class="u-align-center u-clearfix u-gradient u-section-1" id="carousel_5f81">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1"></div>
        </div>
        <div class="u-list u-list-2">
          <div class="u-repeater u-repeater-2">
            <div class="u-border-2 u-border-grey-75 u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white u-list-item-1">
              <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-1">
                <div alt="" class="u-image u-image-circle u-image-1" data-image-width="1280" data-image-height="774"></div>
                <%

                  pstmt=conn.prepareStatement("select * from users");
                  ResultSet rs=pstmt.executeQuery();
                  rs.next();
                %>
                <h4 class="u-align-center u-text u-text-default u-text-1"><%= rs.getString("userName") %></h4>
                <p class="u-align-left u-text u-text-2">email :&nbsp;<%= rs.getString("userID") %></p>
                <p class="u-align-left u-text u-text-3">select job :&nbsp;&nbsp;</p>
                <div class="u-social-icons u-spacing-10 u-social-icons-1">
                  <a class="u-social-url" title="facebook" target="_blank" href="https://facebook.com/name"><span class="u-icon u-social-facebook u-social-icon u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-7f6e"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-7f6e"><circle fill="currentColor" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M73.5,31.6h-9.1c-1.4,0-3.6,0.8-3.6,3.9v8.5h12.6L72,58.3H60.8v40.8H43.9V58.3h-8V43.9h8v-9.2
c0-6.7,3.1-17,17-17h12.5v13.9H73.5z"></path></svg></span>
                  </a>
                  <a class="u-social-url" title="twitter" target="_blank" href="https://twitter.com/name"><span class="u-icon u-social-icon u-social-twitter u-icon-2"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-1e09"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-1e09"><circle fill="currentColor" class="st0" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M83.8,47.3c0,0.6,0,1.2,0,1.7c0,17.7-13.5,38.2-38.2,38.2C38,87.2,31,85,25,81.2c1,0.1,2.1,0.2,3.2,0.2
c6.3,0,12.1-2.1,16.7-5.7c-5.9-0.1-10.8-4-12.5-9.3c0.8,0.2,1.7,0.2,2.5,0.2c1.2,0,2.4-0.2,3.5-0.5c-6.1-1.2-10.8-6.7-10.8-13.1
c0-0.1,0-0.1,0-0.2c1.8,1,3.9,1.6,6.1,1.7c-3.6-2.4-6-6.5-6-11.2c0-2.5,0.7-4.8,1.8-6.7c6.6,8.1,16.5,13.5,27.6,14
c-0.2-1-0.3-2-0.3-3.1c0-7.4,6-13.4,13.4-13.4c3.9,0,7.3,1.6,9.8,4.2c3.1-0.6,5.9-1.7,8.5-3.3c-1,3.1-3.1,5.8-5.9,7.4
c2.7-0.3,5.3-1,7.7-2.1C88.7,43,86.4,45.4,83.8,47.3z"></path></svg></span>
                  </a>
                  <a class="u-social-url" title="instagram" target="_blank" href="https://instagram.com/name"><span class="u-icon u-social-icon u-social-instagram u-icon-3"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 112 112" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-59dd"></use></svg><svg class="u-svg-content" viewBox="0 0 112 112" x="0" y="0" id="svg-59dd"><circle fill="currentColor" cx="56.1" cy="56.1" r="55"></circle><path fill="#FFFFFF" d="M55.9,38.2c-9.9,0-17.9,8-17.9,17.9C38,66,46,74,55.9,74c9.9,0,17.9-8,17.9-17.9C73.8,46.2,65.8,38.2,55.9,38.2
z M55.9,66.4c-5.7,0-10.3-4.6-10.3-10.3c-0.1-5.7,4.6-10.3,10.3-10.3c5.7,0,10.3,4.6,10.3,10.3C66.2,61.8,61.6,66.4,55.9,66.4z"></path><path fill="#FFFFFF" d="M74.3,33.5c-2.3,0-4.2,1.9-4.2,4.2s1.9,4.2,4.2,4.2s4.2-1.9,4.2-4.2S76.6,33.5,74.3,33.5z"></path><path fill="#FFFFFF" d="M73.1,21.3H38.6c-9.7,0-17.5,7.9-17.5,17.5v34.5c0,9.7,7.9,17.6,17.5,17.6h34.5c9.7,0,17.5-7.9,17.5-17.5V38.8
C90.6,29.1,82.7,21.3,73.1,21.3z M83,73.3c0,5.5-4.5,9.9-9.9,9.9H38.6c-5.5,0-9.9-4.5-9.9-9.9V38.8c0-5.5,4.5-9.9,9.9-9.9h34.5
c5.5,0,9.9,4.5,9.9,9.9V73.3z"></path></svg></span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <h2 class="u-custom-font u-font-playfair-display u-text u-text-body-alt-color u-text-4">Best Jobs of 2022</h2>
        <div class="u-table u-table-responsive u-table-1">
          <table class="u-table-entity">
            <colgroup>
              <col width="22.8%">
              <col width="77.2%">
            </colgroup>
            <thead class="u-align-center u-custom-color-3 u-table-header u-table-header-1">
              <tr style="height: 26px;">
                <th class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-1">jobs</th>
                <th class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-2">recommend work &amp; certificate</th>
              </tr>
            </thead>
            <%
              Map<String,Integer> ranking=new HashMap<>();
              while(rs.next()) {
                String work1=rs.getString("work1");
                String work2=rs.getString("work2");
                ranking.put(work1,ranking.containsKey(work1)?ranking.get(work1)+1:1);
                ranking.put(work2,ranking.containsKey(work2)?ranking.get(work2)+1:1);
              }
              List<Map.Entry<String, Integer>> rank = new ArrayList<>(ranking.entrySet());
              Collections.sort(rank, new Comparator<Map.Entry<String, Integer>>() {
                @Override
                public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                  return o2.getValue().compareTo(o1.getValue());
                }
              });

            %>
            <tbody class="u-table-alt-grey-15 u-table-body u-white u-table-body-1">

              <tr style="height: 46px;">
                <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-first-column u-table-cell u-table-cell-3">1. <%= rank.get(0).getKey() %></td>
                <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-4"> <%= session.getAttribute("user_id") %> </td>
              </tr>
              <tr style="height: 44px;">
                <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-first-column u-table-cell u-table-cell-5">2. <%= rank.get(1).getKey() %></td>
                <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-6"></td>
              </tr>
              <tr style="height: 44px;">
                <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-first-column u-table-cell u-table-cell-7">3. <%= rank.get(2).getKey() %></td>
                <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-8"></td>
              </tr>
              <tr style="height: 44px;">
                <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-first-column u-table-cell u-table-cell-9">4. <%= rank.get(3).getKey() %></td>
                <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-10"></td>
              </tr>
              <tr style="height: 44px;">
                <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-table-cell u-table-cell-11">5.&nbsp;<%= rank.get(4).getKey() %></td>
                <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-12"></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-2" id="sec-33fe">
      <div class="u-clearfix u-sheet u-sheet-1">
        <%
          pstmt=conn.prepareStatement("select * from jobs ");
          rs= pstmt.executeQuery();
          rs.next();
        %>
        <h1 class="u-custom-font u-font-playfair-display u-text u-text-body-alt-color u-text-1"><%=rs.getString("work")%></h1>
        <div class="u-expanded-width u-layout-grid u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white u-list-item-1">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <h4 class="u-align-center u-text u-text-2">
                  <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-1" href="#"><%= rs.getString("cp_name") %><br>
                  </a>
                </h4>

                <img class="u-align-center u-image u-image-default u-image-1" alt="" data-image-width="900" data-image-height="900" src="<%= rs.getString("cp_logo") %>">
                <p class="u-align-left u-text u-text-3">Sample text. Click to select the text box. Click again or double click to start editing the text.&nbsp;Sample text. Click to select the text box. Click again or&nbsp;<br>
                </p>
              </div>
            </div>
            <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
              <div class="u-container-layout u-similar-container u-container-layout-2">
                <h4 class="u-align-center u-text u-text-4">
                  <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-2" href="#"><%= rs.getString(("cp_name")) %></a>
                </h4>
                <% rs.next(); %>
                <img class="u-align-center u-image u-image-default u-image-2" alt="" data-image-width="2836" data-image-height="1875" src="<%= rs.getString("cp_logo") %>">
                <p class="u-align-left u-text u-text-5"> Sample text. Click to select the text box. Click again or double click to start editing the text.&nbsp;Sample text. Click to select the text box. Click again or</p>
              </div>
            </div>
            <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
              <div class="u-container-layout u-similar-container u-container-layout-3">
                <h4 class="u-align-center u-text u-text-6">
                  <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-3" href="#"><%= rs.getString(("cp_name")) %></a>
                </h4>
                <% rs.next(); %>
                <img class="u-align-center u-image u-image-default u-image-3" alt="" data-image-width="2836" data-image-height="1875" src="<%= rs.getString("cp_logo") %>">
                <p class="u-align-left u-text u-text-7"> Sample text. Click to select the text box. Click again or double click to start editing the text.&nbsp;Sample text. Click to select the text box. Click again or</p>
              </div>
            </div>
            <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
              <div class="u-container-layout u-similar-container u-container-layout-4">
                <h4 class="u-align-center u-text u-text-8">
                  <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-palette-1-base u-btn-4" href="#"><%= rs.getString(("cp_name")) %></a>
                </h4>
                <% rs.next(); %>
                <img class="u-align-center u-image u-image-default u-image-4" alt="" data-image-width="2836" data-image-height="1875" src="<%= rs.getString("cp_logo") %>">
                <p class="u-align-left u-text u-text-9"> Sample text. Click to select the text box. Click again or double click to start editing the text.&nbsp;Sample text. Click to select the text box. Click again or</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-3" id="sec-fe66">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h1 class="u-custom-font u-font-playfair-display u-text u-text-body-alt-color u-text-1">JOB2</h1>
        <div class="u-expanded-width u-layout-grid u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white u-list-item-1">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <h4 class="u-align-center u-text u-text-2">
                  <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-1" href="#">GOOGLE<br>
                  </a>
                </h4>
                <img class="u-align-center u-image u-image-default u-image-1" alt="" data-image-width="900" data-image-height="900" src="images/50320128-0.jpeg">
                <p class="u-align-left u-text u-text-3">Sample text. Click to select the text box. Click again or double click to start editing the text.&nbsp;Sample text. Click to select the text box. Click again or&nbsp;<br>
                </p>
              </div>
            </div>
            <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
              <div class="u-container-layout u-similar-container u-container-layout-2">
                <h4 class="u-align-center u-text u-text-4">
                  <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-2" href="#">Sample Headline</a>
                </h4>
                <img class="u-align-center u-image u-image-default u-image-2" alt="" data-image-width="2836" data-image-height="1875" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJkZWZhdWx0LWltYWdlLXNvbGlkIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgNDAwIDI2NSIgc3R5bGU9IndpZHRoOiA0MDBweDsgaGVpZ2h0OiAyNjVweDsiPg0KPHJlY3QgZmlsbD0iI0M2RDhFMSIgd2lkdGg9IjQwMCIgaGVpZ2h0PSIyNjUiLz4NCjxwYXRoIGZpbGw9IiNEOUUzRTgiIGQ9Ik0zOTUuMyw5Ni4yYy01LTAuOC02LjEsMS4xLTguNSwyLjljLTEtMi4zLTIuNi02LjItNy43LTVjMS41LTUuMy0yLjYtOC40LTcuNy04LjRjLTAuNiwwLTEuMiwwLjEtMS44LDAuMg0KCWMtMS44LTQuMS02LTYuOS0xMC43LTYuOWMtNi41LDAtMTEuOCw1LjMtMTEuOCwxMS44YzAsMC40LDAsMC45LDAuMSwxLjNjLTEuMi0wLjgtMi41LTEuMy0zLjktMS4zYy00LjMsMC03LjksNC4yLTcuOSw5LjQNCgljMCwxLjIsMC4yLDIuNCwwLjYsMy41Yy0wLjUtMC4xLTEtMC4xLTEuNi0wLjFjLTYuOSwwLTEyLjUsNS41LTEyLjcsMTIuNGMtMC45LTAuMi0xLjktMC40LTIuOS0wLjRjLTYuNCwwLTExLjcsNS4yLTEyLjUsMTEuOA0KCWMtMS4yLTAuNC0yLjUtMC42LTMuOS0wLjZjLTUuOSwwLTEwLjgsMy44LTEyLjEsOC45Yy0yLjQtMi01LjUtMy4yLTguOS0zLjJjLTYsMC0xMS4xLDMuNy0xMi44LDguOGMtMS41LTEuNC0zLjgtMi4zLTYuMy0yLjMNCgljLTIuMSwwLTQuMSwwLjYtNS41LDEuN2gtMC4xYy0xLjMtNS41LTYuMi05LjUtMTIuMS05LjVjLTIuNCwwLTQuNywwLjctNi42LDEuOWMtMS40LTAuNy0zLTEuMi00LjgtMS4yYy0wLjMsMC0wLjUsMC0wLjgsMA0KCWMtMS41LTQuMS01LjItNy05LjUtN2MtMy4xLDAtNS45LDEuNS03LjgsMy45Yy0yLjItNC44LTYuOC04LjItMTIuMi04LjJjLTUuNiwwLTEwLjUsMy43LTEyLjUsOC44Yy0yLjEtMC45LTQuNC0xLjUtNi45LTEuNQ0KCWMtNi44LDAtMTIuNSwzLjktMTQuNSw5LjNjLTAuMiwwLTAuNSwwLTAuNywwYy01LjIsMC05LjYsMy4yLTExLjQsNy44Yy0yLjctMi44LTctNC41LTExLjgtNC41Yy0zLjMsMC02LjQsMC45LTguOSwyLjMNCgljLTIuMS02LjUtOC0xMi4yLTE4LjEtOS45Yy0yLjctMi4zLTYuMy0zLjctMTAuMS0zLjdjLTIuNSwwLTQuOCwwLjYtNi45LDEuNmMtMi4yLTUuOS03LjktMTAuMS0xNC42LTEwLjFjLTguNiwwLTE1LjYsNy0xNS42LDE1LjYNCgljMCwwLjksMC4xLDEuNywwLjIsMi41Yy0yLjYtNS03LjgtOC40LTEzLjgtOC40Yy04LjMsMC0xNS4xLDYuNS0xNS42LDE0LjZjLTIuOS0zLjItNy01LjMtMTEuNy01LjNjLTcuNCwwLTEzLjUsNS4xLTE1LjIsMTINCgljLTIuOS0zLjUtOS44LTYtMTQuNy02djExOS4yaDQwMFYxMDJDNDAwLDEwMiw0MDAsOTcsMzk1LjMsOTYuMnoiLz4NCjxwYXRoIGZpbGw9IiM4RUE4QkIiIGQ9Ik00MDAsMjA2LjJjMCwwLTI1LjMtMTkuMi0zMy42LTI1LjdjLTEzLjQtMTAuNi0yMy4xLTEyLjktMzEuNy03cy0yMy45LDE5LjctMjMuOSwxOS43cy01OC45LTYzLjktNjEuNS02Ni40DQoJYy0xLjUtMS40LTMuNi0xLjctNS41LTAuOWMtNS4yLDIuNC0xNy42LDkuNy0yNC41LDEyLjdjLTYuOSwyLjktNDEtNTAuNy00OS42LTUzcy04NC4zLDgzLjMtMTAxLjQsNzUuMXMtMjYuOS0yLjMtMzUuNCwzLjUNCgljLTguNiw1LjktMTEsNS45LTE1LjksOC4ycy0xNy4xLTUuOS0xNy4xLTUuOVYyNjVjMCwwLDQwMCwwLjIsNDAwLDB2LTU4LjhINDAweiIvPg0KPHBhdGggZmlsbD0iIzdFOTZBNiIgZD0iTTMzMy40LDE3OWMtMTMuMS05LjMtNDAsNC42LTU1LjEsMTAuN2MtMjMuNiw5LjYtOTQtNTQuNC0xMDcuMi01OS43YzAsMC00LjIsMy43LTkuNiw3LjYNCgljLTMuNS0wLjQtOC40LTUuNy05LjktNC43Yy00LjYsMy4xLTE3LjgsMTUuNC0yOC4zLDI2LjZjLTEwLjUsMTEuMy0xMS43LDAtMTUuOC0wLjZjLTIuNS0wLjQtNTQuMSw0Mi41LTU4LjcsNDMuMQ0KCUMyMi4zLDIwNS4zLDAsMTk3LjUsMCwxOTcuNVYyNjVsNDAwLTAuMXYtNTMuM0M0MDAsMjExLjYsMzQ0LjgsMTg3LjEsMzMzLjQsMTc5eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTAsMjY0Ljl2LTU4LjZjMCwwLDguMiwxLjgsMTEuMyw1LjNjMy4xLDMuNiwyNi4xLTQuMiwyNi4xLDQuN3MwLjUsNC4yLDAuNSwxNC44YzAsMTAuNywyMy00LjIsMzguMS0xOC40DQoJczM0LjktNDkuMiwzNi0zNWMxLDE0LjItMTUuMSwzOS4yLTI0LDU2LjRDNzkuMSwyNTEuNCw1MS43LDI2NSw1MS43LDI2NUwwLDI2NC45eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTEwMCwyNjVjMCwwLDY2LjctMTI1LjEsNjguMy0xMTYuOHMtNi44LDI5LjcsMi4xLDI2LjFjOC45LTMuNiwxNC42LTE2LDE4LjgtOS41czE2LjIsMzguNiwyMS45LDMzLjgNCgljNS43LTQuNywyMS40LTEzLjEsMjIuNC02LjVjMSw2LjUtMSw1LjMtNS43LDIwLjJDMjIzLjEsMjI3LjEsMjAwLDI2NSwyMDAsMjY1aC0xMGMwLDAsNi0yNC44LDguNi0zNC45YzIuNi0xMC4xLTMuNy0xOS0xMi04LjMNCglzLTIzLDIyLTI0LDE3LjhzLTUuNy0zMC4zLTE4LjgtMTQuMmMtMTMsMTYtMzMuOCwzOS43LTMzLjgsMzkuN2gtMTBWMjY1eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTI0NSwyNjVjMCwwLDE5LjgtNTQuNywzMy40LTY0LjJzNTMuNy0yNy45LDQ2LjktMTMuNmMtNi44LDE0LjItMTEsMzQuNC0yMC4zLDQ5LjgNCgljLTkuNCwxNS40LTE4LjgsMjYuMS0xNC4xLDEzLjZjNC43LTEyLjUsNi40LTIzLjMsMy43LTIzLjFDMjcxLjMsMjI5LjEsMjYwLDI2NSwyNjAsMjY1SDI0NXoiLz4NCjwvc3ZnPg0K">
                <p class="u-align-left u-text u-text-5"> Sample text. Click to select the text box. Click again or double click to start editing the text.&nbsp;Sample text. Click to select the text box. Click again or</p>
              </div>
            </div>
            <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
              <div class="u-container-layout u-similar-container u-container-layout-3">
                <h4 class="u-align-center u-text u-text-6">
                  <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-3" href="#">Sample Headline</a>
                </h4>
                <img class="u-align-center u-image u-image-default u-image-3" alt="" data-image-width="2836" data-image-height="1875" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJkZWZhdWx0LWltYWdlLXNvbGlkIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgNDAwIDI2NSIgc3R5bGU9IndpZHRoOiA0MDBweDsgaGVpZ2h0OiAyNjVweDsiPg0KPHJlY3QgZmlsbD0iI0M2RDhFMSIgd2lkdGg9IjQwMCIgaGVpZ2h0PSIyNjUiLz4NCjxwYXRoIGZpbGw9IiNEOUUzRTgiIGQ9Ik0zOTUuMyw5Ni4yYy01LTAuOC02LjEsMS4xLTguNSwyLjljLTEtMi4zLTIuNi02LjItNy43LTVjMS41LTUuMy0yLjYtOC40LTcuNy04LjRjLTAuNiwwLTEuMiwwLjEtMS44LDAuMg0KCWMtMS44LTQuMS02LTYuOS0xMC43LTYuOWMtNi41LDAtMTEuOCw1LjMtMTEuOCwxMS44YzAsMC40LDAsMC45LDAuMSwxLjNjLTEuMi0wLjgtMi41LTEuMy0zLjktMS4zYy00LjMsMC03LjksNC4yLTcuOSw5LjQNCgljMCwxLjIsMC4yLDIuNCwwLjYsMy41Yy0wLjUtMC4xLTEtMC4xLTEuNi0wLjFjLTYuOSwwLTEyLjUsNS41LTEyLjcsMTIuNGMtMC45LTAuMi0xLjktMC40LTIuOS0wLjRjLTYuNCwwLTExLjcsNS4yLTEyLjUsMTEuOA0KCWMtMS4yLTAuNC0yLjUtMC42LTMuOS0wLjZjLTUuOSwwLTEwLjgsMy44LTEyLjEsOC45Yy0yLjQtMi01LjUtMy4yLTguOS0zLjJjLTYsMC0xMS4xLDMuNy0xMi44LDguOGMtMS41LTEuNC0zLjgtMi4zLTYuMy0yLjMNCgljLTIuMSwwLTQuMSwwLjYtNS41LDEuN2gtMC4xYy0xLjMtNS41LTYuMi05LjUtMTIuMS05LjVjLTIuNCwwLTQuNywwLjctNi42LDEuOWMtMS40LTAuNy0zLTEuMi00LjgtMS4yYy0wLjMsMC0wLjUsMC0wLjgsMA0KCWMtMS41LTQuMS01LjItNy05LjUtN2MtMy4xLDAtNS45LDEuNS03LjgsMy45Yy0yLjItNC44LTYuOC04LjItMTIuMi04LjJjLTUuNiwwLTEwLjUsMy43LTEyLjUsOC44Yy0yLjEtMC45LTQuNC0xLjUtNi45LTEuNQ0KCWMtNi44LDAtMTIuNSwzLjktMTQuNSw5LjNjLTAuMiwwLTAuNSwwLTAuNywwYy01LjIsMC05LjYsMy4yLTExLjQsNy44Yy0yLjctMi44LTctNC41LTExLjgtNC41Yy0zLjMsMC02LjQsMC45LTguOSwyLjMNCgljLTIuMS02LjUtOC0xMi4yLTE4LjEtOS45Yy0yLjctMi4zLTYuMy0zLjctMTAuMS0zLjdjLTIuNSwwLTQuOCwwLjYtNi45LDEuNmMtMi4yLTUuOS03LjktMTAuMS0xNC42LTEwLjFjLTguNiwwLTE1LjYsNy0xNS42LDE1LjYNCgljMCwwLjksMC4xLDEuNywwLjIsMi41Yy0yLjYtNS03LjgtOC40LTEzLjgtOC40Yy04LjMsMC0xNS4xLDYuNS0xNS42LDE0LjZjLTIuOS0zLjItNy01LjMtMTEuNy01LjNjLTcuNCwwLTEzLjUsNS4xLTE1LjIsMTINCgljLTIuOS0zLjUtOS44LTYtMTQuNy02djExOS4yaDQwMFYxMDJDNDAwLDEwMiw0MDAsOTcsMzk1LjMsOTYuMnoiLz4NCjxwYXRoIGZpbGw9IiM4RUE4QkIiIGQ9Ik00MDAsMjA2LjJjMCwwLTI1LjMtMTkuMi0zMy42LTI1LjdjLTEzLjQtMTAuNi0yMy4xLTEyLjktMzEuNy03cy0yMy45LDE5LjctMjMuOSwxOS43cy01OC45LTYzLjktNjEuNS02Ni40DQoJYy0xLjUtMS40LTMuNi0xLjctNS41LTAuOWMtNS4yLDIuNC0xNy42LDkuNy0yNC41LDEyLjdjLTYuOSwyLjktNDEtNTAuNy00OS42LTUzcy04NC4zLDgzLjMtMTAxLjQsNzUuMXMtMjYuOS0yLjMtMzUuNCwzLjUNCgljLTguNiw1LjktMTEsNS45LTE1LjksOC4ycy0xNy4xLTUuOS0xNy4xLTUuOVYyNjVjMCwwLDQwMCwwLjIsNDAwLDB2LTU4LjhINDAweiIvPg0KPHBhdGggZmlsbD0iIzdFOTZBNiIgZD0iTTMzMy40LDE3OWMtMTMuMS05LjMtNDAsNC42LTU1LjEsMTAuN2MtMjMuNiw5LjYtOTQtNTQuNC0xMDcuMi01OS43YzAsMC00LjIsMy43LTkuNiw3LjYNCgljLTMuNS0wLjQtOC40LTUuNy05LjktNC43Yy00LjYsMy4xLTE3LjgsMTUuNC0yOC4zLDI2LjZjLTEwLjUsMTEuMy0xMS43LDAtMTUuOC0wLjZjLTIuNS0wLjQtNTQuMSw0Mi41LTU4LjcsNDMuMQ0KCUMyMi4zLDIwNS4zLDAsMTk3LjUsMCwxOTcuNVYyNjVsNDAwLTAuMXYtNTMuM0M0MDAsMjExLjYsMzQ0LjgsMTg3LjEsMzMzLjQsMTc5eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTAsMjY0Ljl2LTU4LjZjMCwwLDguMiwxLjgsMTEuMyw1LjNjMy4xLDMuNiwyNi4xLTQuMiwyNi4xLDQuN3MwLjUsNC4yLDAuNSwxNC44YzAsMTAuNywyMy00LjIsMzguMS0xOC40DQoJczM0LjktNDkuMiwzNi0zNWMxLDE0LjItMTUuMSwzOS4yLTI0LDU2LjRDNzkuMSwyNTEuNCw1MS43LDI2NSw1MS43LDI2NUwwLDI2NC45eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTEwMCwyNjVjMCwwLDY2LjctMTI1LjEsNjguMy0xMTYuOHMtNi44LDI5LjcsMi4xLDI2LjFjOC45LTMuNiwxNC42LTE2LDE4LjgtOS41czE2LjIsMzguNiwyMS45LDMzLjgNCgljNS43LTQuNywyMS40LTEzLjEsMjIuNC02LjVjMSw2LjUtMSw1LjMtNS43LDIwLjJDMjIzLjEsMjI3LjEsMjAwLDI2NSwyMDAsMjY1aC0xMGMwLDAsNi0yNC44LDguNi0zNC45YzIuNi0xMC4xLTMuNy0xOS0xMi04LjMNCglzLTIzLDIyLTI0LDE3LjhzLTUuNy0zMC4zLTE4LjgtMTQuMmMtMTMsMTYtMzMuOCwzOS43LTMzLjgsMzkuN2gtMTBWMjY1eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTI0NSwyNjVjMCwwLDE5LjgtNTQuNywzMy40LTY0LjJzNTMuNy0yNy45LDQ2LjktMTMuNmMtNi44LDE0LjItMTEsMzQuNC0yMC4zLDQ5LjgNCgljLTkuNCwxNS40LTE4LjgsMjYuMS0xNC4xLDEzLjZjNC43LTEyLjUsNi40LTIzLjMsMy43LTIzLjFDMjcxLjMsMjI5LjEsMjYwLDI2NSwyNjAsMjY1SDI0NXoiLz4NCjwvc3ZnPg0K">
                <p class="u-align-left u-text u-text-7"> Sample text. Click to select the text box. Click again or double click to start editing the text.&nbsp;Sample text. Click to select the text box. Click again or</p>
              </div>
            </div>
            <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
              <div class="u-container-layout u-similar-container u-container-layout-4">
                <h4 class="u-align-center u-text u-text-8">
                  <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-palette-1-base u-btn-4" href="#">Sample Headline</a>
                </h4>
                <img class="u-align-center u-image u-image-default u-image-4" alt="" data-image-width="2836" data-image-height="1875" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJkZWZhdWx0LWltYWdlLXNvbGlkIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgNDAwIDI2NSIgc3R5bGU9IndpZHRoOiA0MDBweDsgaGVpZ2h0OiAyNjVweDsiPg0KPHJlY3QgZmlsbD0iI0M2RDhFMSIgd2lkdGg9IjQwMCIgaGVpZ2h0PSIyNjUiLz4NCjxwYXRoIGZpbGw9IiNEOUUzRTgiIGQ9Ik0zOTUuMyw5Ni4yYy01LTAuOC02LjEsMS4xLTguNSwyLjljLTEtMi4zLTIuNi02LjItNy43LTVjMS41LTUuMy0yLjYtOC40LTcuNy04LjRjLTAuNiwwLTEuMiwwLjEtMS44LDAuMg0KCWMtMS44LTQuMS02LTYuOS0xMC43LTYuOWMtNi41LDAtMTEuOCw1LjMtMTEuOCwxMS44YzAsMC40LDAsMC45LDAuMSwxLjNjLTEuMi0wLjgtMi41LTEuMy0zLjktMS4zYy00LjMsMC03LjksNC4yLTcuOSw5LjQNCgljMCwxLjIsMC4yLDIuNCwwLjYsMy41Yy0wLjUtMC4xLTEtMC4xLTEuNi0wLjFjLTYuOSwwLTEyLjUsNS41LTEyLjcsMTIuNGMtMC45LTAuMi0xLjktMC40LTIuOS0wLjRjLTYuNCwwLTExLjcsNS4yLTEyLjUsMTEuOA0KCWMtMS4yLTAuNC0yLjUtMC42LTMuOS0wLjZjLTUuOSwwLTEwLjgsMy44LTEyLjEsOC45Yy0yLjQtMi01LjUtMy4yLTguOS0zLjJjLTYsMC0xMS4xLDMuNy0xMi44LDguOGMtMS41LTEuNC0zLjgtMi4zLTYuMy0yLjMNCgljLTIuMSwwLTQuMSwwLjYtNS41LDEuN2gtMC4xYy0xLjMtNS41LTYuMi05LjUtMTIuMS05LjVjLTIuNCwwLTQuNywwLjctNi42LDEuOWMtMS40LTAuNy0zLTEuMi00LjgtMS4yYy0wLjMsMC0wLjUsMC0wLjgsMA0KCWMtMS41LTQuMS01LjItNy05LjUtN2MtMy4xLDAtNS45LDEuNS03LjgsMy45Yy0yLjItNC44LTYuOC04LjItMTIuMi04LjJjLTUuNiwwLTEwLjUsMy43LTEyLjUsOC44Yy0yLjEtMC45LTQuNC0xLjUtNi45LTEuNQ0KCWMtNi44LDAtMTIuNSwzLjktMTQuNSw5LjNjLTAuMiwwLTAuNSwwLTAuNywwYy01LjIsMC05LjYsMy4yLTExLjQsNy44Yy0yLjctMi44LTctNC41LTExLjgtNC41Yy0zLjMsMC02LjQsMC45LTguOSwyLjMNCgljLTIuMS02LjUtOC0xMi4yLTE4LjEtOS45Yy0yLjctMi4zLTYuMy0zLjctMTAuMS0zLjdjLTIuNSwwLTQuOCwwLjYtNi45LDEuNmMtMi4yLTUuOS03LjktMTAuMS0xNC42LTEwLjFjLTguNiwwLTE1LjYsNy0xNS42LDE1LjYNCgljMCwwLjksMC4xLDEuNywwLjIsMi41Yy0yLjYtNS03LjgtOC40LTEzLjgtOC40Yy04LjMsMC0xNS4xLDYuNS0xNS42LDE0LjZjLTIuOS0zLjItNy01LjMtMTEuNy01LjNjLTcuNCwwLTEzLjUsNS4xLTE1LjIsMTINCgljLTIuOS0zLjUtOS44LTYtMTQuNy02djExOS4yaDQwMFYxMDJDNDAwLDEwMiw0MDAsOTcsMzk1LjMsOTYuMnoiLz4NCjxwYXRoIGZpbGw9IiM4RUE4QkIiIGQ9Ik00MDAsMjA2LjJjMCwwLTI1LjMtMTkuMi0zMy42LTI1LjdjLTEzLjQtMTAuNi0yMy4xLTEyLjktMzEuNy03cy0yMy45LDE5LjctMjMuOSwxOS43cy01OC45LTYzLjktNjEuNS02Ni40DQoJYy0xLjUtMS40LTMuNi0xLjctNS41LTAuOWMtNS4yLDIuNC0xNy42LDkuNy0yNC41LDEyLjdjLTYuOSwyLjktNDEtNTAuNy00OS42LTUzcy04NC4zLDgzLjMtMTAxLjQsNzUuMXMtMjYuOS0yLjMtMzUuNCwzLjUNCgljLTguNiw1LjktMTEsNS45LTE1LjksOC4ycy0xNy4xLTUuOS0xNy4xLTUuOVYyNjVjMCwwLDQwMCwwLjIsNDAwLDB2LTU4LjhINDAweiIvPg0KPHBhdGggZmlsbD0iIzdFOTZBNiIgZD0iTTMzMy40LDE3OWMtMTMuMS05LjMtNDAsNC42LTU1LjEsMTAuN2MtMjMuNiw5LjYtOTQtNTQuNC0xMDcuMi01OS43YzAsMC00LjIsMy43LTkuNiw3LjYNCgljLTMuNS0wLjQtOC40LTUuNy05LjktNC43Yy00LjYsMy4xLTE3LjgsMTUuNC0yOC4zLDI2LjZjLTEwLjUsMTEuMy0xMS43LDAtMTUuOC0wLjZjLTIuNS0wLjQtNTQuMSw0Mi41LTU4LjcsNDMuMQ0KCUMyMi4zLDIwNS4zLDAsMTk3LjUsMCwxOTcuNVYyNjVsNDAwLTAuMXYtNTMuM0M0MDAsMjExLjYsMzQ0LjgsMTg3LjEsMzMzLjQsMTc5eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTAsMjY0Ljl2LTU4LjZjMCwwLDguMiwxLjgsMTEuMyw1LjNjMy4xLDMuNiwyNi4xLTQuMiwyNi4xLDQuN3MwLjUsNC4yLDAuNSwxNC44YzAsMTAuNywyMy00LjIsMzguMS0xOC40DQoJczM0LjktNDkuMiwzNi0zNWMxLDE0LjItMTUuMSwzOS4yLTI0LDU2LjRDNzkuMSwyNTEuNCw1MS43LDI2NSw1MS43LDI2NUwwLDI2NC45eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTEwMCwyNjVjMCwwLDY2LjctMTI1LjEsNjguMy0xMTYuOHMtNi44LDI5LjcsMi4xLDI2LjFjOC45LTMuNiwxNC42LTE2LDE4LjgtOS41czE2LjIsMzguNiwyMS45LDMzLjgNCgljNS43LTQuNywyMS40LTEzLjEsMjIuNC02LjVjMSw2LjUtMSw1LjMtNS43LDIwLjJDMjIzLjEsMjI3LjEsMjAwLDI2NSwyMDAsMjY1aC0xMGMwLDAsNi0yNC44LDguNi0zNC45YzIuNi0xMC4xLTMuNy0xOS0xMi04LjMNCglzLTIzLDIyLTI0LDE3LjhzLTUuNy0zMC4zLTE4LjgtMTQuMmMtMTMsMTYtMzMuOCwzOS43LTMzLjgsMzkuN2gtMTBWMjY1eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTI0NSwyNjVjMCwwLDE5LjgtNTQuNywzMy40LTY0LjJzNTMuNy0yNy45LDQ2LjktMTMuNmMtNi44LDE0LjItMTEsMzQuNC0yMC4zLDQ5LjgNCgljLTkuNCwxNS40LTE4LjgsMjYuMS0xNC4xLDEzLjZjNC43LTEyLjUsNi40LTIzLjMsMy43LTIzLjFDMjcxLjMsMjI5LjEsMjYwLDI2NSwyNjAsMjY1SDI0NXoiLz4NCjwvc3ZnPg0K">
                <p class="u-align-left u-text u-text-9"> Sample text. Click to select the text box. Click again or double click to start editing the text.&nbsp;Sample text. Click to select the text box. Click again or</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-4" id="sec-da97">
      <%
        //  where work not in()
        pstmt=conn.prepareStatement("select distinct work,work_link from jobs ");
        rs= pstmt.executeQuery();
        rs.next();
      %>
      <div class="u-clearfix u-sheet u-sheet-1">
        <h1 class="u-custom-font u-font-playfair-display u-text u-text-body-alt-color u-text-1">DB Jobs List</h1><!--blog--><!--blog_options_json--><!--{"type":"Recent","source":"","tags":"","count":"10"}--><!--/blog_options_json-->
        <div class="u-blog u-expanded-width u-layout-horizontal u-blog-1" data-max-items="10">
          <div class="u-repeater u-repeater-1"><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-white u-repeater-item-1">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <a class="u-post-header-link" href="blog/cex.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-1" src="images/cbnu.png?rand=bf8f"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-2">
                  <a class="u-post-header-link" href="<%=rs.getString("work_link")%>"><!--blog_post_header_content--><%= rs.getString(("work")) %><!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-3"><!--blog_post_content_content-->집에 가고 싶어요나는 바보다<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/cex.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-1"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-2">
                <a class="u-post-header-link" href="blog/2.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-2" src="images/0fd3416c.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-4">
                  <a class="u-post-header-link" href="blog/2.html"><!--blog_post_header_content-->2<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-5"><!--blog_post_content_content-->Sample small text. Lorem ipsum dolor sit amet.<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/2.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-2"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-3">
                <a class="u-post-header-link" href="blog/3.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-3" src="images/0fd3416c.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-6">
                  <a class="u-post-header-link" href="blog/3.html"><!--blog_post_header_content-->3<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-7"><!--blog_post_content_content-->Sample small text. Lorem ipsum dolor sit amet.<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/3.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-3"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-4">
                <a class="u-post-header-link" href="blog/4.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-4" src="images/0fd3416c.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-8">
                  <a class="u-post-header-link" href="blog/4.html"><!--blog_post_header_content-->4<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-9"><!--blog_post_content_content-->Sample small text. Lorem ipsum dolor sit amet.<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/4.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-4"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-5">
                <a class="u-post-header-link" href="blog/5.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-5" src="images/0fd3416c.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-10">
                  <a class="u-post-header-link" href="blog/5.html"><!--blog_post_header_content-->5<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-11"><!--blog_post_content_content-->Tlqkf<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/5.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-5"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-6">
                <a class="u-post-header-link" href="blog/6.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-6" src="images/8ad73f3c.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-12">
                  <a class="u-post-header-link" href="blog/6.html"><!--blog_post_header_content-->6<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-13"><!--blog_post_content_content-->Sample small text. Lorem ipsum dolor sit amet.<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/6.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-6"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-7">
                <a class="u-post-header-link" href="blog/7.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-7" src="images/68f64b9d.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-14">
                  <a class="u-post-header-link" href="blog/7.html"><!--blog_post_header_content-->7<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-15"><!--blog_post_content_content-->Sample small text. Lorem ipsum dolor sit amet.<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/7.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-7"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-8">
                <a class="u-post-header-link" href="blog/8.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-8" src="images/0fd3416c.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-16">
                  <a class="u-post-header-link" href="blog/8.html"><!--blog_post_header_content-->8<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-17"><!--blog_post_content_content-->Sample small text. Lorem ipsum dolor sit amet.<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/8.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-8"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-9">
                <a class="u-post-header-link" href="blog/9.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-9" src="images/8ad73f3c.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-18">
                  <a class="u-post-header-link" href="blog/9.html"><!--blog_post_header_content-->9<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-19"><!--blog_post_content_content-->Sample small text. Lorem ipsum dolor sit amet.<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/9.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-9"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post--><!--blog_post-->
            <div class="u-blog-post u-container-style u-repeater-item u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-10">
                <a class="u-post-header-link" href="blog/10.html"><!--blog_post_image-->
                  <img alt="" class="u-blog-control u-expanded-width u-image u-image-default u-image-10" src="images/68f64b9d.jpeg"><!--/blog_post_image-->
                </a><!--blog_post_header-->
                <h4 class="u-blog-control u-text u-text-20">
                  <a class="u-post-header-link" href="blog/10.html"><!--blog_post_header_content-->10<!--/blog_post_header_content--></a>
                </h4><!--/blog_post_header--><!--blog_post_content-->
                <div class="u-blog-control u-post-content u-text u-text-21"><!--blog_post_content_content-->Sample small text. Lorem ipsum dolor sit amet.<!--/blog_post_content_content--></div><!--/blog_post_content--><!--blog_post_readmore-->
                <a href="blog/10.html" class="u-blog-control u-btn u-btn-round u-button-style u-hover-palette-1-dark-1 u-palette-1-base u-radius-50 u-btn-10"><!--blog_post_readmore_content--><!--options_json--><!--{"content":"GO TO","defaultValue":"Read More"}--><!--/options_json-->GO TO<!--/blog_post_readmore_content--></a><!--/blog_post_readmore-->
              </div>
            </div><!--/blog_post-->
          </div>
          <a class="u-absolute-vcenter u-gallery-nav u-gallery-nav-prev u-grey-70 u-icon-circle u-opacity u-opacity-70 u-spacing-10 u-text-white u-gallery-nav-1" href="#" role="button">
            <span aria-hidden="true">
              <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
            </span>
            <span class="sr-only">
              <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
            </span>
          </a>
          <a class="u-absolute-vcenter u-gallery-nav u-gallery-nav-next u-grey-70 u-icon-circle u-opacity u-opacity-70 u-spacing-10 u-text-white u-gallery-nav-2" href="#" role="button">
            <span aria-hidden="true">
              <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
            </span>
            <span class="sr-only">
              <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
            </span>
          </a>
        </div><!--/blog-->
      </div>
    </section>
    <section class="u-clearfix u-section-5" id="carousel_0f54">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h1 class="u-align-center u-custom-font u-font-playfair-display u-text u-text-body-alt-color u-text-1">Site</h1>
        <div class="u-expanded-width u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-border-2 u-border-grey-75 u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <h3 class="u-align-center u-text u-text-palette-1-base u-text-2">워크넷</h3>
                <img alt="" class="u-expanded-width u-image u-image-contain u-image-default u-image-1" data-image-width="512" data-image-height="512" src="images/worknet.png" data-href="https://www.work.go.kr/seekWantedMain.do">
                <p class="u-text u-text-default u-text-3">1998년서비스를 개시하였으며, 고용노동부와 한국고용정보원이 운영하는 믿고 신뢰할 수 있는 구직·구인정보와 직업·진로정보를 제공하는 대한민국 취업정보 사이트입니다.</p>
              </div>
            </div>
            <div class="u-border-2 u-border-grey-75 u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-2">
                <h3 class="u-align-center u-text u-text-palette-1-base u-text-4">잡코리아</h3>
                <img alt="" class="u-expanded-width u-image u-image-contain u-image-default u-image-2" data-image-width="200" data-image-height="200" src="images/jobkorea.png" data-href="https://www.jobkorea.co.kr/">
                <p class="u-text u-text-default u-text-5">Sample text. Click to select the text box. Click again or double click to start editing the text.</p>
              </div>
            </div>
            <div class="u-border-2 u-border-grey-75 u-container-align-center u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-video-cover u-white">
              <div class="u-container-layout u-similar-container u-container-layout-3">
                <h3 class="u-align-center u-text u-text-palette-1-base u-text-6"> 잡것들</h3>
                <img alt="" class="u-expanded-width u-image u-image-contain u-image-default u-image-3" data-image-width="394" data-image-height="501" src="images/5.png" data-href="https://nicepage.com">
                <p class="u-text u-text-default u-text-7">Sample text. Click to select the text box. Click again or double click to start editing the text.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
    
    <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-c678"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-small-text u-text u-text-variant u-text-1">Copyright © Caps2022</p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/website-design" target="_blank">
        <span>Website Design Template</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="" target="_blank">
        <span>Website Builder Software</span>
      </a>. 
    </section>
  
</body></html>