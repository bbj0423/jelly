class HomeController < ApplicationController
    
    before_action :log_impression, :only=>[:show]

    helper_method :sort_column, :sort_direction
    
    # 프론트 합칩니다/ 0816 / 이태규
    
#### 메인페이지 ####
    def home
        @notices = Post.where(notice: true).where(major_id: current_user.major1_id).last(5).reverse
        @asks = Post.where(notice: false).last(5).reverse
    end
    
    #유저페이지
    def user_page
        @posts= Post.where(user_id: current_user.id).search(params[:category_id], params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    end
    
    #글
    def write
    end
    #메시지
    def message
    end
    # CRUD 기능/0728/장윤서
    
#### 글 작성 ####
    def new 
    # 사용자가 데이터를 입력하는 화면
        @category= Category.all # 0817 / 추가 / 김단아
    end
    
    def create 
    # 입력한 데이터를 실제 DB에 저장할 액션
        @post= Post.new
        @post.title= params[:input_title]
        @post.content= params[:input_content]
        @post.category_id= params[:cate_id] # 0817 / 추가 / 김단아 
        @post.user_id= params[:user_id]
        @post.notice= params[:notice] # 공지 여부, 질문글일시 false
        @post.major_id= params[:major_id] # 공지사항일 경우 과를 받아오기 위해서! >> 그래야 누구네 과 공지인지 알 수 있음
        @post.image= params[:input_image]
        @post.save
        
        redirect_to "/home/show/#{@post.id}"
    end
    
    #질의응답 글쓰기
    def form_ask
        @category= Category.all
    end
    
    #공지사항 글쓰기
    def form_notice
        @category= Category.all
    end
    
# CRUD 기능/0801/장윤서
#### 글 보기 ####
    def ask
    #질의응답 전체를 보여주는 view 
        @category= Category.all # 추가
        @posts= Post.where(notice: false).search(params[:category_id], params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 7, :page => params[:page])
    end
    
    def notice
    #공지사항 전체를 보여주는 view
        @category= Category.all # 추가
        @posts= Post.where(notice: true).where(major_id: current_user.major1_id).search(params[:category_id], params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 7, :page => params[:page])
    end
    
    def show 
    # 글 1개를 보여주는 view 
        @post= Post.find(params[:post_id])
        @comments= Comment.where(post_id: params[:post_id])
        @recomments= Recomment.all
    end
    
    # CRUD 기능/0803/장윤서
    
    #Update
    
    def edit
    # 사용자가 데이터를 입력하는 화면
        @post= Post.find(params[:post_id])
    end
    
    def update
    # 입력한 데이터를 실제 DB에 저장할 액션
        @post= Post.find(params[:post_id])
    # 수정할 코드
        @post.title= params[:input_title]
        @post.content= params[:input_content]
        @post.save 
        
        redirect_to "/home/show/#{@post.id}"
    end
    
    #delete
    def destroy
    # 한개의 post를 삭제하는 액션
        @post= Post.find(params[:post_id])
        @post.destroy
        redirect_to "/home/index"
    end
    
    private
  
  def sort_column
    Post.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
  
  def log_impression
    @hit_post = Post.find(params[:post_id])
    # this assumes you have a current_user method in your authentication system
    @hit_post.impressions.create(ip_address: request.remote_ip,user_id:current_user.id)
  end
    
end
