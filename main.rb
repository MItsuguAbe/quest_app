class Brave
    attr_accessor :name, :hp, :offense, :defense

    SPECIAL_ATTACK_CONSTANT = 1.5
  
    def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]
    end

    def attack(monster)
        puts "#{@name}の攻撃"
    
        attack_num = rand(4)
  
        if attack_num == 0
            puts "必殺攻撃"
            damage = calculate_special_attack - monster.defense
        else
            puts "通常攻撃"
            damage = @offense - monster.defense
        end
    
        damage = @offense - monster.defense
    
        # 自己代入：monster.hpからdamageを引いた値をmonster.hpに代入
        monster.hp -= damage
    
        puts "#{monster.name}は#{damage}のダメージを受けた"
        puts "#{monster.name}の残りHPは#{monster.hp}だ"
    end


    def calculate_special_attack
        @offense * SPECIAL_ATTACK_CONSTANT
    end
  
end
  


class Monster
    attr_accessor :name, :hp, :offense, :defense

    POWER_UP_RATE = 1.5
    CALC_HALF_HP = 0.5
  
    def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]

      # モンスターが変身したかどうかを判定するフラグ
      @transform_flag = false

      # 変身する際の閾値（トリガー）を計算
      @trigger_of_transform = params[:hp] * CALC_HALF_HP
    end

    def attack(brave)
        if @hp <= @trigger_of_transform && @transform_flag == false
            # モンスター変身判定フラグにtrueを代入
            @transform_flag = true
            # 変身メソッドを実行
            transform
        end

        puts "#{@name}の攻撃"
    
        damage = @offense - brave.defense

        brave.hp -= damage
    
        puts "#{brave.name}は#{damage}のダメージを受けた"
        puts "#{brave.name}の残りHPは#{brave.hp}だ"
    end

    
    private

      def transform
       transform_name = "ドラゴン"

        puts <<~EOS
        #{@name}は怒っている
        #{@name}は#{transform_name}に変身した
        EOS

        # モンスターの攻撃力を1.5倍にする
        @offense *= POWER_UP_RATE
        # モンスターの名前を変更
        @name = transform_name
      end
  
end