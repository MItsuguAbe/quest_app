class GamesController
    EXP_CONSTANT = 2
    GOLD_CONSTANT = 3
  
    def battle(**params)
      build_characters(params)
  
      loop do
        # インスタンス変数に変更
        @brave.attack(@monster)
        break if buttle_end? # 引数が必要なくなる
        # インスタンス変数に変更
        @monster.attack(@brave)
        break if buttle_end? # 引数が必要なくなる
      end
  
      if battle_result # 引数が必要なくなる
        result = calculate_of_exp_and_gold # 引数が必要なくなる
        # インスタンス変数に変更
        puts "#{@brave.name}はたたかいに勝った"
        puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
      else
        # インスタンス変数に変更
        puts "#{@brave.name}はたたかいに負けた"
        puts "目の前が真っ暗になった"
      end
    end
  
    private
  
      def build_characters(**params)
        # 勇者クラス、モンスタークラスそれぞれのインスタンスをインスタンス変数に代入
        @brave = params[:brave]
        @monster = params[:monster]
      end
  
      # 引数が必要なくなる
      def buttle_end?
        @brave.hp <= 0 || @monster.hp <= 0
      end
  
      # 引数が必要なくなる
      def battle_result
        # インスタンス変数に変更
        @brave.hp > 0
      end
  
      # 引数が必要なくなる
      def calculate_of_exp_and_gold
        exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
        gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
        result = {exp: exp, gold: gold}
  
        result
      end
  
end