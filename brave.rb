require './character'

class Brave < Character
    SPECIAL_ATTACK_CONSTANT = 1.5

    def attack(monster)

      attack_message
    
      attack_type = decision_attack_type

       # calculate_damageメソッドの呼び出し
      damage = calculate_damage(target: monster, attack_type: attack_type)

      # ダメージをHPに反映させるcause_damageメソッドの呼び出し
      cause_damage(target: monster, damage: damage)

      damage_message(target: monster, damage: damage)
      
    end
    
    
    private
    
      def decision_attack_type
        attack_num = rand(4)
        
        if attack_num == 0
            puts "会心の一撃！"
            "special_attack"
        else
            puts "通常攻撃"
            "normal_attack"
        end
      end
    
       # 変数に格納することによって将来ハッシュのキーに変更があった場合でも変更箇所が少なくて済む
      def calculate_damage(**params)
        target = params[:target]
        attack_type = params[:attack_type]
    
        if attack_type == "special_attack"
            calculate_special_attack - target.defense
        else
            @offense - target.defense
        end
      end
    
      def cause_damage(**params)
        damage = params[:damage]
        target = params[:target]
    
        target.hp -= damage

        # もしターゲットのHPがマイナスになるなら0を代入
        target.hp = 0 if target.hp < 0

      end
    
      def calculate_special_attack
        @offense * SPECIAL_ATTACK_CONSTANT
      end
  
end