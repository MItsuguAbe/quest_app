module MessageDialog
    # 攻撃時のメッセージ
    def attack_message
        puts <<~EOS
  
        #{@name}の攻撃
    
        EOS
    end
  
    # ダメージを受けた時のメッセージ
    def damage_message(**params)
        target = params[:target]
        damage = params[:damage]
    
        puts <<~EOS
    
        #{target.name}は#{damage}のダメージを受けた

        #{target.name}の残りHPは#{target.hp}だ
        -------------------------------------------------------------------
        EOS
    end
  
    # バトルが終了した時のメッセージ
    def end_message(result)
        if result[:brave_win_flag]
          puts <<~EOS
    
          勇者は勝った
          #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れた
    
          EOS
        else
          puts <<~EOS
    
          勇者はまけた
          目の前が真っ暗になった
    
          EOS
        end
    end
end