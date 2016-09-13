class QuestionsController<ApplicationController
  before_filter :autorize, only: [:show]
  before_filter :is_admin, [:index]

  def index
    @questions = Question.all
    @answers = Answer.all
    # temporarily displays all answers on index page of  questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Thank you. The question has been successfully updated!"
      redirect_to questions_path
    else
      render "edit"
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question successfully deleted!"
    redirect_to questions_path
  end

private
  def question_params
    params.require(:question).permit(:content)
  end
end
