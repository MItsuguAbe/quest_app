# message_dialog.rbの読み込み
require './message_dialog'


class GamesController
  # MessageDialogモジュールのinclude
  include MessageDialog

    EXP_CONSTANT = 2
    GOLD_CONSTANT = 3
  
    def battle(**params)
      build_characters(params)
  
      loop do

        puts "#{@brave.name}はどうする？"
        puts '[0]戦う'
        puts '[1]逃げる'
      
        input = gets.to_i
      
        if input == 0
          @brave.attack(@monster)
          break if buttle_end?
        elsif input == 1
          puts "#{@brave.name}は逃げ出した"
          exit
        else
          puts '無効な値です'
        end


        puts "#{@monster.name}の攻撃！"
        puts "[0]を押してください"

        input = gets.to_i
      
        if input == 0
          @monster.attack(@brave)
          break if buttle_end?
        else
          puts '無効な値です'
        end

      end
  
      battle_judgment
    end
  
    private
  
      def build_characters(**params)
        @brave = params[:brave]
        @monster = params[:monster]
      end
  
      def buttle_end?
        @brave.hp <= 0 || @monster.hp <= 0
      end
  
      def brave_win?
        @brave.hp > 0
      end
  
      def battle_judgment
        result = calculate_of_exp_and_gold

        end_message(result)
      end
  
      def calculate_of_exp_and_gold
        if brave_win?
          brave_win_flag = true
          exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
          gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
        else
          brave_win_flag = false
          exp = 0
          gold = 0
        end
  
        {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
      end
  
end