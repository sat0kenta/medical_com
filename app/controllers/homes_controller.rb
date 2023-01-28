class HomesController < ApplicationController
  def top
    
    #@clinicals = Clinical.all
    #@clinicals = Clinical.order('id DESC').limit(3)
    @user=current_user
    
    
    #いいね数のランキング機能
    to  = Time.current.at_end_of_day #現在時刻を取得。at_end_of_dayは1日の終わりを23:59に設定している。
    from  = (to - 6.day).at_beginning_of_day #at_beginning_of_day　は1日の始まりの時刻を0:00に設定している。
    @clinicals = Clinical.all.limit(3).sort {|a,b|
      b.favorites.where(created_at: from...to).size <=>
      a.favorites.where(created_at: from...to).size
    }
    #bを先に記述してるので降順（多い順）に並び変えができる
    
  end
end
