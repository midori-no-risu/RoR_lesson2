require_relative 'string'

class Ball
  def answers
    {
      :pstv => [
        'It is certain',
        'It is decidedly so',
        'Without a doubt',
        'Yes — definitely',
        'You may rely on it'
      ],
      :ngtv => [
        'Don’t count on it',
        'My reply is no',
        'My sources say no',
        'Outlook not so good',
        'Very doubtful'
      ],
      :ntrl => [
        'Reply hazy, try again',
        'Ask again later',
        'Better not tell you now',
        'Cannot predict now',
        'Concentrate and ask again'
      ],
      :ncrtn => [
        'As I see it, yes',
        'Most likely',
        'Outlook good',
        'Signs point to yes',
        'Yes'
      ]
    }
  end


  def shake
    hash_values = answers.values
    array_values = hash_values[rand(hash_values.size)]
    rndm_answer = array_values.sample
    answer_type = answers.key(array_values)

    case answer_type
      when :pstv
        puts rndm_answer.colorize(34)
      when :ntrl
        puts rndm_answer.colorize(33)
      when :ncrtn
        puts rndm_answer.colorize(32)
      when :ngtv
        puts rndm_answer.colorize(31)
      else
       puts rndm_answer
    end
  end
end

ball = Ball.new

ball.shake
