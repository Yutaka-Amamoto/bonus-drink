class BonusDrink
  def self.total_count_for(amount)
    # 入力型チェック 整数以外はNG（仕様明確化の為のチェック処理。timesで例外が発生してくれるのでダックプログラミング的には不要）
    unless amount.is_a?(Integer)
      raise ArgumentError,"整数以外が渡された"
    end
    # 入力値チェック 負数はNG（仕様外チェック処理。「負数を許容するがその場合は0を返却する」ならば当該チェック処理自体を省略できる）
    if amount < 0
      raise ArgumentError,"負数が渡された"
    end
    # ボトルカウンタを初期化する
    bottle_count = 0
    amount.times do
      bottle_count += 1
      # 3本ボトルが貯まるごとにボーナスとして1追加する
      if ((bottle_count+1) % 3) == 0
        bottle_count += 1
      end
    end
    # ボトルカウンタを返却する
    bottle_count
  end
end
