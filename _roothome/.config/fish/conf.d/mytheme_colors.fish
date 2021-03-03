# 使いたい色を登録しておく
set -l blue             00bcc6
set -l light_blue       8ed0ff
set -l green            00c694
set -l dark_green       287480
set -l red              ff6161
set -l pink             c600c0
set -l light_pink       f8bbf6
set -l orange           c66400
set -l yellow           fff92f
 
# 白と黒は誰が見ても同じなので、グローバルに登録
set -g white            ffffff
set -g black            000000
  
# 抽象的な名前でグローバルに登録
set -g color_dark       333333
set -g color_discreet   757575
   
set -g color_main       $blue
set -g color_main_light $light_blue
set -g color_warning    $red
    
# git color
set -g color_git_main   $green
set -g color_git_dirty  $yellow
     
# fish color
set -g fish_color_normal            $white                          # デフォルトの色
set -g fish_color_autosuggestion    $color_discreet                 # コマンドの提案の色
set -g fish_color_cancel            --background=$color_main        # 「^c」の色
set -g fish_color_command           $color_main_light               # コマンドの色
set -g fish_color_comment           $color_discreet                 # コメントの色
set -g fish_color_end               $color_main_light               # ; や & などの色
set -g fish_color_error             $red                            # エラーの色
set -g fish_color_escape            $color_discreet                 # \n や \x70 などのエスケープ文字の色
set -g fish_color_match             --background=$color_main_light  # 検索した文字とマッチした時の背景色
set -g fish_color_operator          $light_pink                     # パラメータ演算子の色
set -g fish_color_param             $light_pink                     # 変数
set -g fish_color_search_match      --background=$color_main        # Tab候補の選択などでの背景色
set -g fish_color_selection         --background=$dark_green        # vi、選択モードで選択された部分の背景色
set -g fish_color_quote             $light_pink                     # echo ''など
      
set -g fish_pager_color_progress    $color_main_light               # Tabキーで表示される補完一覧の、左下に表示される文字の色
set -g fish_pager_color_completion  $white                          # Tabキーで表示される補完一覧の文字色
set -g fish_pager_color_prefix      $color_main_light               # Tabキーで表示される補完一覧の、一致した文字の色
