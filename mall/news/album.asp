<!--#include virtual ="/common/include/header.asp" -->
<!--#include virtual ="/common/include/left_bar.asp" -->
<!--#include virtual ="/common/include/top.asp" -->
 <%	lt = "04"	%>

		<div class="msub"><!--msub-->
			<div class="msub_inner"><!--msub_inner-->

				<div class="minner_Lt"><!--본문내용-->

					<div class="title">
						<div class="title_inner01">
							<img src="/images/btn/contitle3_4.gif" alt="포토갤러리" />
						</div>
						<div class="title_inner02">
							<span style="padding-right:4px;"><img src="/images/icon/home.gif" alt="home" /></span>
							<span style="padding-right:4px;"><img src="/images/icon/root.gif" alt="root" /></span>
							<span style="padding-right:4px;">센터소식</span>
							<span style="padding-right:4px;"><img src="/images/icon/root.gif" alt="root" /></span>
							<span>포토갤러리</span>
						</div>
					</div>


					<!--게시판-->
					<div class="contents">

						<%
							EXEC = UCase(request("exec"))
							If Trim(EXEC) = "" Then EXEC = "LIST"
							strBoardID = "Photo_gallery1"
						%>
						<!--#include virtual = "/cnrboard/mboard_new.asp"-->


						<!--IFRAME src='/bbs/gallery/list.html' onLoad="Resize_Frame('me');" scrolling=0 frameborder=0 marginwidth=0 marginheight=0 width='724px' height='100%' name='me'></IFRAME!-->


					</div>
					<!--//게시판-->

				</div><!--//본문내용-->

				<!--#include virtual ="/common/include/lnb03.asp" -->

			</div><!--//msub_inner-->
		</div><!--//msub-->

<!--#include virtual ="/common/include/footer.asp" -->
