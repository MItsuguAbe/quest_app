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
  
end
  


class Monster
    attr_accessor :name, :hp, :offense, :defense
  
    def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]
    end
  
end