require './character'


class Monster < Character

    POWER_UP_RATE = 1.5
    CALC_HALF_HP = 0.5
  
    def initialize(**params)
      
      super(
        name: params[:name],
        hp: params[:hp],
        offense: params[:offense],
        defense: params[:defense]
      )
  
      
      @transform_flag = false
      @trigger_of_transform = params[:hp] * CALC_HALF_HP
    end

    def attack(brave)
        if @hp <= @trigger_of_transform && @transform_flag == false
            @transform_flag = true
            transform
        end

        attack_message
    
        damage = calculate_damage(brave)

        # ダメージ反映処理の呼び出し
        cause_damage(target: brave, damage: damage)

        damage_message(target: brave, damage: damage)
    end

    
    private

      # ダメージ計算処理
      def calculate_damage(target)
        @offense - target.defense
      end

      # ダメージ反映処理
      def cause_damage(**params)
        
        damage = params[:damage]
        target = params[:target]
  
        target.hp -= damage

        # もしターゲットのHPがマイナスになるなら0を代入
        target.hp = 0 if target.hp < 0

      end
  

      def transform
        transform_name = "ドラゴン"

        transform_message(origin_name: @name, transform_name: transform_name)
      
        @offense *= POWER_UP_RATE
        @name = transform_name
      end
  
end