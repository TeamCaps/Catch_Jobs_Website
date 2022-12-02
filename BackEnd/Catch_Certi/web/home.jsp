<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.xml.transform.Result" %>
<%@page import="java.util.*"%>
<%@page import="home.homeDAO"%>
<%@page import="home.homeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <meta name="generator" content="Nicepage 5.0.7, nicepage.com">
  <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
  <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
  <%!
    int current;
    int current2;
    int i=0;
    int j=0;
  %>
</head>
<script>
  function reload_cp(){
    $("#work1").load(window.location.href +" #work1");
  }
  function reload_cp2(){
    $("#work2").load(window.location.href +" #work2");
  }
</script>
<body data-home-page="Home.jsp" data-home-page-title="Home" class="u-body u-xl-mode" data-lang="en"><header class="u-align-left u-clearfix u-header u-section-row-container" id="sec-ba49"><div class="u-section-rows">
  <%
    request.setCharacterEncoding("utf-8");
    Connection conn = null;
    String jdbcUrl = "jdbc:mysql://15.164.192.100:52817/caps";
    String dbId = "caps";
    String dbPass = "1234";
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
    PreparedStatement pstmt =null;
    ResultSet rs=null;
    String sql;
    session=request.getSession();
  %>

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
      <a href="logout.jsp" class="u-border-none u-btn u-btn-round u-button-style u-hover-palette-2-base u-palette-3-base u-radius-50 u-btn-2">LOGOUT</a>
      <p class="u-text u-text-default u-text-white u-text-2">당신의 직무를 찾아드립니다~<br>
      </p>
    </div>





  </div>
</div></header>
<%
  PreparedStatement Pwork1=null;
%>
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
                pstmt=conn.prepareStatement("select * from users where userID=?");
                String name=String.valueOf(session.getAttribute("user_id"));
                pstmt.setString(1,name);
                rs=pstmt.executeQuery();
                rs.next();
                String Work1=rs.getString("work1");
                String Work2=rs.getString("work2");
              %>

              <h4 class="u-align-center u-text u-text-default u-text-1"><%= rs.getString("userName")%></h4>
              <p class="u-align-left u-text u-text-2">email :&nbsp;&nbsp;<%= rs.getString("userID") %></p>
              <p class="u-align-left u-text u-text-3">select job :&nbsp;&nbsp;<%= rs.getString("work1") %>, <%= rs.getString("work2") %></p>
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
          <%
            pstmt=conn.prepareStatement("select * from users");
            rs=pstmt.executeQuery();
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

            homeDAO HomeDAO=new homeDAO();
          %>

          <tr style="height: 26px;">
            <th class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-1">jobs</th>
            <th class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-2">recommend work &amp; certificate</th>
          </tr>
          </thead>
          <tbody class="u-table-alt-grey-15 u-table-body u-white u-table-body-1">
          <tr style="height: 46px;">
            <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-first-column u-table-cell u-table-cell-3">1. <%=rank.get(0).getKey()%></td>
            <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-4"><%= HomeDAO.rankSkill(rank.get(0).getKey()) %> </td>
          </tr>
          <tr style="height: 44px;">
            <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-first-column u-table-cell u-table-cell-5">2. <%=rank.get(1).getKey()%></td>
            <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-6"><%= HomeDAO.rankSkill(rank.get(1).getKey()) %></td>
          </tr>
          <tr style="height: 44px;">
            <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-first-column u-table-cell u-table-cell-7">3. <%=rank.get(2).getKey()%></td>
            <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-8"><%= HomeDAO.rankSkill(rank.get(2).getKey()) %></td>
          </tr>
          <tr style="height: 44px;">
            <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-first-column u-table-cell u-table-cell-9">4. <%=rank.get(3).getKey()%></td>
            <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-10"><%= HomeDAO.rankSkill(rank.get(3).getKey()) %></td>
          </tr>
          <tr style="height: 44px;">
            <td class="u-align-center u-border-2 u-border-grey-75 u-custom-color-3 u-table-cell u-table-cell-11">5.&nbsp;<%=rank.get(4).getKey()%></td>
            <td class="u-border-2 u-border-grey-75 u-table-cell u-table-cell-12"><%= HomeDAO.rankSkill(rank.get(4).getKey()) %></td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </section>
  <%
    PreparedStatement pstmt2=conn.prepareStatement("select count(*),Num from jobs where work_name=? order by Num");
    pstmt2.setString(1,Work1);
    ResultSet rs2=pstmt2.executeQuery();
    rs2.next();
    int first_cp_num=rs2.getInt("Num");
    int last_cp_num=rs2.getInt(1);
    current=first_cp_num;
  %>
  <section class="u-align-center u-clearfix u-section-2" id="sec-33fe">
    <div class="u-clearfix u-sheet u-sheet-1" id="work1">
      <%
        Pwork1=conn.prepareStatement("select * from jobs where work_name=? and Num between ? and ?");
        Pwork1.setString(1,Work1);
        Pwork1.setInt(2,current+4*i);
        Pwork1.setInt(3,current+4*i+3);
        ResultSet Rwork1=Pwork1.executeQuery();
        Rwork1.next();
        i++;
        if(i>=5) i=first_cp_num-1;
        StringTokenizer st=new StringTokenizer(Rwork1.getString("cp_preview"),"\n");
      %>
      <h1 class="u-custom-font u-font-playfair-display u-text u-text-body-alt-color u-text-1">

        <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-palette-1-base u-btn-1" href="job.jsp?work=<%=Work1%>"><%=Work1%></a>

      </h1>
      <div class="u-expanded-width u-layout-grid u-list u-list-1">
        <div class="u-repeater u-repeater-1">
          <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white u-list-item-1">
            <div class="u-container-layout u-similar-container u-container-layout-1">
              <h4 class="u-align-center u-text u-text-2">

                <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-2" href="<%=Rwork1.getString("work_link")%>"><%=Rwork1.getString("cp_name")%><br>
                </a>
              </h4>
              <img class="u-align-center u-image u-image-default u-image-1" alt="" data-image-width="900" data-image-height="900" src=<%=Rwork1.getString("cp_logo")%>>
              <p class="u-align-left u-text u-text-3">
                <%
                  while(st.hasMoreTokens()){
                %>
                <%=st.nextToken()%><br>
                <%}%>


                &nbsp;<br>
              </p>
            </div>
          </div>
          <%
            Rwork1.next();
          %>
          <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
            <div class="u-container-layout u-similar-container u-container-layout-2">
              <h4 class="u-align-center u-text u-text-4">

                <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-3" href="<%=Rwork1.getString("work_link")%>"><%=Rwork1.getString("cp_name")%></a>
              </h4>
              <img class="u-align-center u-image u-image-default u-image-2" alt="" data-image-width="2836" data-image-height="1875" src=<%=Rwork1.getString("cp_logo")%>>
              <p class="u-align-left u-text u-text-3">
                <%
                  st=new StringTokenizer(Rwork1.getString("cp_preview"),"\n");
                  while(st.hasMoreTokens()){
                %>
                <%=st.nextToken()%><br>
                <%}%><br>


                &nbsp;<br>
              </p>
            </div>
          </div>
          <%
            Rwork1.next();
          %>
          <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
            <div class="u-container-layout u-similar-container u-container-layout-3">
              <h4 class="u-align-center u-text u-text-6">

                <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-4" href="<%=Rwork1.getString("work_link")%>"><%=Rwork1.getString("cp_name")%></a>
              </h4>
              <img class="u-align-center u-image u-image-default u-image-3" alt="" data-image-width="2836" data-image-height="1875" src=<%=Rwork1.getString("cp_logo")%>>
              <p class="u-align-left u-text u-text-3">
                <%
                  st=new StringTokenizer(Rwork1.getString("cp_preview"),"\n");
                  while(st.hasMoreTokens()){
                %>
                <%=st.nextToken()%><br>
                <%}%><br>


                &nbsp;<br>
              </p>
            </div>
          </div>
          <%
            Rwork1.next();
          %>
          <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
            <div class="u-container-layout u-similar-container u-container-layout-4">
              <h4 class="u-align-center u-text u-text-8">

                <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-palette-1-base u-btn-5" href="<%=Rwork1.getString("work_link")%>"><%=Rwork1.getString("cp_name")%></a>
              </h4>
              <img class="u-align-center u-image u-image-default u-image-4" alt="" data-image-width="2836" data-image-height="1875" src=<%=Rwork1.getString("cp_logo")%>>
              <p class="u-align-left u-text u-text-3">
                <%
                  st=new StringTokenizer(Rwork1.getString("cp_preview"),"\n");
                  while(st.hasMoreTokens()){
                %>
                <%=st.nextToken()%><br>
                <%}%><br>


                &nbsp;<br>
              </p>
            </div>
          </div>
        </div>
      </div>
      <button class="btn btn-primary btn-lg" type="button" onclick="reload_cp()">Change</button>
    </div>

  </section>
  <%
    PreparedStatement Pwork2=null;
    ResultSet Rwork2=null;
    pstmt2=conn.prepareStatement("select count(*),Num from jobs where work_name=? order by Num");
    pstmt2.setString(1,Work2);
    rs2=pstmt2.executeQuery();
    rs2.next();
    int first_cp2_num=rs2.getInt("Num");
    int last_cp2_num=rs2.getInt(1);
    current2=first_cp2_num;
  %>
  <section class="u-align-center u-clearfix u-section-3" id="sec-fe66">
    <div class="u-clearfix u-sheet u-sheet-1" id="work2">
      <%
        Pwork2=conn.prepareStatement("select * from jobs where work_name=? and Num between ? and ?");
        Pwork2.setString(1,Work2);
        Pwork2.setInt(2,current2+4*j);
        Pwork2.setInt(3,current2+4*j+3);
        Rwork2=Pwork2.executeQuery();
        Rwork2.next();
        j++;
        if(j>=5) j=first_cp2_num-1;
        st=new StringTokenizer(Rwork2.getString("cp_preview"),"\n");
      %>
      <h1 class="u-custom-font u-font-playfair-display u-text u-text-body-alt-color u-text-1">

        <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-palette-1-base u-btn-1" href="job.jsp?work=<%=Work2%>"><%=Work2%></a>

      </h1>
      <div class="u-expanded-width u-layout-grid u-list u-list-1">
        <div class="u-repeater u-repeater-1">
          <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white u-list-item-1">
            <div class="u-container-layout u-similar-container u-container-layout-1">
              <h4 class="u-align-center u-text u-text-2">

                <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-2" href="<%=Rwork2.getString("work_link")%>"><%=Rwork2.getString("cp_name")%><br>
                </a>
              </h4>
              <img class="u-align-center u-image u-image-default u-image-1" alt="" data-image-width="900" data-image-height="900" src=<%=Rwork2.getString("cp_logo")%>>
              <p class="u-align-left u-text u-text-3">
                <%
                  st=new StringTokenizer(Rwork2.getString("cp_preview"),"\n");
                  while(st.hasMoreTokens()){
                %>
                <%=st.nextToken()%><br>
                <%}%><br>


                &nbsp;<br>
              </p>
            </div>
          </div>
          <%Rwork2.next();%>
          <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
            <div class="u-container-layout u-similar-container u-container-layout-2">
              <h4 class="u-align-center u-text u-text-4">

                <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-3" href="<%=Rwork2.getString("work_link")%>"><%=Rwork2.getString("cp_name")%></a>
              </h4>
              <img class="u-align-center u-image u-image-default u-image-2" alt="" data-image-width="2836" data-image-height="1875" src=<%=Rwork2.getString("cp_logo")%>>
              <p class="u-align-left u-text u-text-3">
                <%
                  st=new StringTokenizer(Rwork2.getString("cp_preview"),"\n");
                  while(st.hasMoreTokens()){
                %>
                <%=st.nextToken()%><br>
                <%}%><br>


                &nbsp;<br>
              </p>
            </div>
          </div>
          <%Rwork2.next();%>
          <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
            <div class="u-container-layout u-similar-container u-container-layout-3">
              <h4 class="u-align-center u-text u-text-6">

                <a class="u-border-1 u-border-active-palette-2-base u-border-hover-palette-1-base u-border-no-left u-border-no-right u-border-no-top u-btn u-button-link u-button-style u-none u-text-palette-1-base u-btn-4" href="<%=Rwork2.getString("work_link")%>"><%=Rwork2.getString("cp_name")%></a>
              </h4>
              <img class="u-align-center u-image u-image-default u-image-3" alt="" data-image-width="2836" data-image-height="1875" src=<%=Rwork2.getString("cp_logo")%>>
              <p class="u-align-left u-text u-text-3">
                <%
                  st=new StringTokenizer(Rwork2.getString("cp_preview"),"\n");
                  while(st.hasMoreTokens()){
                %>
                <%=st.nextToken()%><br>
                <%}%><br>


                &nbsp;<br>
              </p>
            </div>
          </div>
          <%Rwork2.next();%>
          <div class="u-align-left u-border-2 u-border-black u-container-style u-list-item u-radius-15 u-repeater-item u-shape-round u-white">
            <div class="u-container-layout u-similar-container u-container-layout-4">
              <h4 class="u-align-center u-text u-text-8">
                <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-hover-none u-none u-text-palette-1-base u-btn-5" href="<%=Rwork2.getString("work_link")%>"><%=Rwork2.getString("cp_name")%></a>
              </h4>
              <img class="u-align-center u-image u-image-default u-image-4" alt="" data-image-width="2836" data-image-height="1875" src=<%=Rwork2.getString("cp_logo")%>>
              <p class="u-align-left u-text u-text-3">
                <%
                  st=new StringTokenizer(Rwork2.getString("cp_preview"),"\n");
                  while(st.hasMoreTokens()){
                %>
                <%=st.nextToken()%><br>
                <%}%><br>


                &nbsp;<br>
              </p>
            </div>
          </div>
        </div>
      </div>
      <button class="btn btn-primary btn-lg" type="button" onclick="reload_cp2()">Change</button>
    </div>
  </section>
  <section class="u-clearfix u-section-4" id="carousel_0f54">
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
</body></html>