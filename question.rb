class Question

  attr_accessor :number_1, :number_2, :question, :answer

  def initialize
    @number_1 = rand(1-20)
    @number_2 = rand(1-20)
    @question = @number_1 + @number_2
    @answer = @question
  end

end
