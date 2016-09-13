class AnswersController<ApplicationController
  before_filter :autorize, only: [:new, :create, :edit, :update]

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    render 'new'
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Thank you. The answer has been successfully saved!"
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = "Thank you. The answer has been updated."
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Answer has been successfully deleted"
    redirect_to question_path(@question)
  end

private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
