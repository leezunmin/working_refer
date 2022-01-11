# working_refer
실무에서 작성한 코드 레퍼런스입니다. 하나의 프로젝트가 아니라 참조용이라 부분적으로만 존재합니다.
당연히 api가 작동하지않는 코드이며, 허락하에 실무에서 발췌한 코드라 협업자의 코드가 섞여있는 부분은 전부 뺐습니다.

참조용으로 봐주시면 감사하겠습니다.

/lib/blocs 와
/lib/views/
경로 내역이 주 코딩 내역이며
관련 db 핸들링은 
lib/apis/firestore/firestore_api.dart 에 기재되어있습니다.
이부분의 파일들이 주로 기여도 95퍼센트 이상의 코드들입니다.






사용 기술 및 라이브러리

상태관리 flutter_bloc 8.0.0
상태관리 RxDart: 0.27.0


데이터 모델링)
- 커뮤니티 모델 객체는 AppPost이며
그안에 달리는 일반댓글은 AppReply, 그 댓글에 달린 대댓글은 AppReReply임.
커뮤니티 내부적으로 투표기능이 있으며,
AppVote 모델은 1개의 투표 단위에 대한 모델링이며 투표 개별 항목에 대한 모델은 AppVoteItem 임.
사진 첨부와 좋아요 기능 등이 있지만 따로 데이터 모델링은 없음.


파이어스토어) 
- 클라우드 파이어스토어 상에서 posts 콜렉션이 커뮤니티 일반 게시글에 해당함.
reply 콜렉션이 댓글에 해당함. reply의 하위 콜렉션인 rereply 가 대댓글에 해당한다.
- posts콜렉션의 하위 콜렉션인 likeUser는 해당 게시글을 좋아요한 사용자 데이터가 들어있음. posts의 프로퍼티중 likeUsers는 신경쓰지 않아도됨. 이외에 초기개발시 불필요하거나 잘못입력된 프로퍼티가 몇개 있을수는 있음.
- votes 콜렉션은 투표 엔티티에 해당함. 
votes 콜렉션의 하위콜렉션인 voteItem 은 투표 엔티티의 세부 투표 답변 항목의 요소들임.
voteUsers는 해당 투표에 참여한 사용자들의 데이터임.



Flutter 클라이언트 상의 구조 및 기술(블록 구조)
- main.dart에서는 PostBloc 블록을 MyApp 전체에 주입. 전체 구조가 짜여진 상태에서 블록을 끼워넣었기 때문에 세부 위젯에 주입한게아니라 MyApp 전체에 주입되었음.
- 커뮤니티 내부적으로 사용하는 데이터들에 대한 상태관리는 
ImageBloc, CommentBloc, TagCommentBloc, LikePostBloc, VoteBloc, CommentImageBloc 들이 있음.

CommunityMainScreen.dart가 바텀네비게이터에서 커뮤니티를 눌렀을때 초기 메인화면이며,
_rootNavi로 커뮤니티 내부적으로 화면이동을 위해 라우트를 push할때 블록파이더로 블록을 주입. bloc객체가 위젯에서 사용되다 해당 위젯이 위젯트리에서 제거되면 자동으로
해당 bloc의 Future<void> close()가 수행되어 메모리 해제가 됨.


- 바텀네비게이터에서 커뮤니티에 진입하는 경우도 있지만, 마이페이지의 커뮤니티버튼으로 진입하는 경우나, 다이나믹 링크를 받아 진입하는 경우도 있는데,
이때의 블록 인스턴스 주입은 app_view_mixin.dart, community_reader.mixin.dart,
home_screen.dart 등에서 수행함. 커뮤니티에서만 bloc을 사용하기 때문에 MultiBlocProvider 로 검색하면 주입위치를 알 수 있음.

- mixin BlocInterface (bloc_interface.dart) 는 글쓰기나 수정 등에서 사용되는 기능들의 집합해 놓음. 블록 이벤트 클래스의 값들을 정의해주거나, 댓글 태깅하는 기능들을 수행함. 첨부사진을 삭제하거나 할때의 이미지 경로를 지정해주기도 함.

- mixin ValidatorMixin(validate_mixin.dart) 는 글쓰기나 수정 등에서 사용되는 검증 로직이 구현되어 있음. 글쓰기 시 공란을 모두 채웠는지, 글자수가 초과되지 않았는지, 투표시에 항목이 비진않는지 등을 검증하는 역할.

- 비즈니스 로직은 Bloc으로 처리되며 세부적인 기능은 mixin 클래스에서 수행됨.
bloc.add(이벤트클래스)로 bloc에 이벤트를 add 하면 블록의 생성자 바디의 on<이벤트> 가 해당 이벤트를 감지하고 비즈니스 로직을 수행후 emit으로 상태 클래스를 내보냄.
이벤트 객채에 대한 핸들링은 EventTransformer가 수행함.(주석 참조)
실시간으로 작성중인 텍스트나 기타 타입들은 BehaviorSubject 를 이용해서 구독함.


- 주요 View Class

* class CommunityMainScreen 	- 커뮤니티 메인화면
* class CommunityModifyScreen - 커뮤니티 글 수정 화면
* class CommunityNavigator 	- 커뮤니티 네비게이터
* class CommunityReaderScreen	- 커뮤니티 글 읽기 화면
* class CommunityReaderMixin 	- view는 아니고 글 읽기 화면의 버튼 동작 코드를 분리해놓음
* class CommunitySearchScreen	- 초창기 개발시부터 존재한 불필요한 위젯임. 사용안함
* class CommunityWriteScreen	- 커뮤니티 글쓰기 화면
* class VoteChartScreen		- 사용자가 투표 첨부글 읽을시의 투표 내용에 대한 UI
* class VoteBlocEditor		- 글쓰기 시에 투표 항목을 첨부할때 작동하는 투표UI
* class PostFloatingButton	- 사용자가 글 읽기 시에 하단에 고정된 댓글입력 UI
* class ProfileCommunityScreen- 마이페이지의 커뮤니티 화면 






감사합니다.
(devjunmin@gmail.com)

문자) 공일공_이구이육_공일팔일
