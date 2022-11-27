<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.xml.transform.Result" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Caps, ​Sweets">
    <meta name="description" content="">
    <title>job</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="job.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="graph.js" defer=""></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    <meta name="generator" content="Nicepage 5.0.7, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">


    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        PreparedStatement pstmt1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;

        Class.forName("com.mysql.cj.jdbc.Driver");

        String jdbcDriver = "jdbc:mysql://15.164.192.100:52817/caps";
        String dbUser = "caps";
        String dbPass = "1234";


        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

        pstmt = conn.prepareStatement("select * from learn where work_name=?");
        System.out.println(request.getParameter("work"));
        pstmt.setString(1,request.getParameter("work"));

        rs = pstmt.executeQuery();

    %>



    
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
    <meta property="og:title" content="job">
    <meta property="og:type" content="website">
  </head>
  <body class="u-body u-xl-mode" data-lang="en"><header class="u-align-left u-clearfix u-header u-section-row-container" id="sec-ba49"><div class="u-section-rows">
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
            <a href="login.jsp" class="u-border-none u-btn u-btn-round u-button-style u-hover-palette-2-base u-palette-3-base u-radius-50 u-btn-2">LOGOUT</a>

            <p class="u-text u-text-default u-text-white u-text-2">당신의 직무를 찾아드립니다~<br>
            </p>
          </div>
          
          
          
          
          
        </div>
      </div></header>
    <section class="u-clearfix u-gradient u-section-1" id="carousel_43ab">
      <div class="u-clearfix u-sheet u-sheet-1">

        <h1 class="u-align-center u-text u-text-body-alt-color u-text-1"><%=request.getParameter("work")%> </h1>

        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-align-left u-container-style u-list-item u-repeater-item u-shape-rectangle u-list-item-1">
              <div class="u-container-layout u-similar-container u-container-layout-1">
                <h2 style="color:black; text-align:center; font-family: Roboto,sans-serif; font-weight: bolder; margin: 10px 0 0 0;">ㅇㅅㅇ</h2>
                <canvas id="myChart" width="400" height="400"></canvas>
              </div>  
            </div>
          </div>
        </div>
        <div class="u-list u-list-2">
          <div class="u-repeater u-repeater-2">
            <div class="u-align-left u-container-style u-list-item u-radius-20 u-repeater-item u-shape-round u-white u-list-item-2">
              <div class="u-container-layout u-similar-container u-valign-top u-container-layout-2">
                <div>
                  <fieldset class="cho1" data-role="controlgroup" data-type="horizontal">
                    <legend class="cho2">Choose your Specifications</legend>
                    <div class ="firstc">

                        <script>
                            var i1=0;
                        </script>
                        <%
                            rs.next();
                            StringTokenizer sec_tok = new StringTokenizer(rs.getString("section"),"\n");
                            while (sec_tok.hasMoreTokens()) {%>
                        <script>
                            i1++
                        </script>
                        <div class="cho3">
                       <input type="checkbox" input onclick="CountChecked(this)" id="coding" name="interest[]" value="server"/>
                       <label for="coding"><%=sec_tok.nextToken()%></label>
                      </div>
                        <%}%>
                    </div>
                  </fieldset>
                </div>
                <div class="zt-span6 last">
                  <p>&nbsp;</p>
                  <h3><strong>진행율</strong></h3>
                  <div class="zt-skill-bar">
                  <div data-width="0" id = "widths">cex<span id = "result">0%</span></div>
                  </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        <div class="u-list u-list-3">
          <div class="u-repeater u-repeater-3">
            <div class="u-align-left u-container-style u-list-item u-radius-20 u-repeater-item u-shape-round u-white u-list-item-3">
              <div class="u-container-layout u-similar-container u-valign-top u-container-layout-3">
                <div>
                  <fieldset class="cho1" data-role="controlgroup" data-type="horizontal">
                    <legend class="cho2">Choose your Specifications</legend>

                      <div class ="firstc">
                          <script>
                              var i2=0;
                          </script>
                          <%
                              rs.next();
                              StringTokenizer sec_tok1 = new StringTokenizer(rs.getString("section"),"\n");
                              while (sec_tok1.hasMoreTokens()) {%>
                          <script>
                              i2++
                          </script>
                          <div class="cho3">
                              <input type="checkbox" input onclick="CountChecked1(this)"  name="interest[]" value="server"/>
                              <label for="coding"><%=sec_tok1.nextToken()%></label>
                          </div>
                          <%}%>
                      </div>

                  </fieldset>
                </div>
                <div class="zt-span6 last">
                  <p>&nbsp;</p>
                  <h3><strong>진행율</strong></h3>
                  <div class="zt-skill-bar1">
                  <div data-width="0" id = "widths1">cex<span id = "result1">0%</span></div>
                  </div>
              </div>
            </div>
          </div>
        </div>
        </div>
        <div class="u-list u-list-4">
          <div class="u-repeater u-repeater-4">
            <div class="u-align-left u-container-style u-list-item u-radius-20 u-repeater-item u-shape-round u-white u-list-item-4">
              <div class="u-container-layout u-similar-container u-valign-top u-container-layout-4">
                <div>
                  <fieldset class="cho1" data-role="controlgroup" data-type="horizontal">
                    <legend class="cho2">Choose your Specifications</legend>

                      <div class ="firstc">
                          <script>
                              var i3=0;
                          </script>
                          <%
                              rs.next();
                              StringTokenizer sec_tok2 = new StringTokenizer(rs.getString("section"),"\n");
                              while (sec_tok2.hasMoreTokens()) {%>
                          <script>
                              i3++
                          </script>

                          <div class="cho3">
                              <input type="checkbox" input onclick="CountChecked2(this)"  name="interest[]" value="server"/>
                              <label for="coding"><%=sec_tok2.nextToken()%></label>
                          </div>
                          <%}%>
                      </div>

                  </fieldset>
                </div>
                <div class="zt-span6 last">
                  <p>&nbsp;</p>
                  <h3><strong>진행율</strong></h3>
                  <div class="zt-skill-bar2">
                  <div data-width="0" id = "widths2">cex<span id = "result2">0%</span></div>
                  </div>
              </div>
            </div>
          </div>
        </div>
        </div>
      </div>
    </section>


  <footer class="u-align-center u-clearfix u-footer u-grey-80 u-footer" id="sec-c678"><div class="u-clearfix u-sheet u-sheet-1">

        <p class="u-small-text u-text u-text-variant u-text-1">Copyright © Caps2022</p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/website-templates" target="_blank">
        <span>Website Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="" target="_blank">
        <span>Website Builder Software</span>
      </a>. 
    </section>
  
</body></html>