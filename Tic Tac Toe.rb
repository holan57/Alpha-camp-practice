    def board_disp(board)
      puts "|#{board[7]}|#{board[8]}|#{board[9]}|"
      puts "-------"
      puts "|#{board[4]}|#{board[5]}|#{board[6]}|"
      puts "-------"
      puts "|#{board[1]}|#{board[2]}|#{board[3]}|"
    end

    def inputxo(board, pos, marker)
      board[pos] = marker
    end

    def win_check(board, inputxo)
      return (board[1] == inputxo and board[2] == inputxo and board[3] == inputxo) ||(board[4] == inputxo and board[5] == inputxo and board[6] == inputxo) || (board[7] == inputxo and board[8] == inputxo and board[9] == inputxo) || (board[1] == inputxo and board[4] == inputxo and board[7] == inputxo) || (board[2] == inputxo and board[5] == inputxo and board[8] == inputxo) || (board[3] == inputxo and board[6] == inputxo and board[9] == inputxo) || (board[1] == inputxo and board[5] == inputxo and board[9] == inputxo) || (board[3] == inputxo and board[5] == inputxo and board[7] == inputxo)
    end

    def who_first(turn)
      if rand(0..1) == 0
        return turn = "Player1"  
      else
        return turn = "Player2"
      end
    end 

    def chose_xo()
      while true
        print "Do you want to be X or O?"
        marker = gets.chomp
        if marker.upcase == "X" || marker.upcase == "O"
          if marker.upcase == "X"
            return "X","O"
          else
            return "O","X"
          end
        end
      end
    end

    def space_check(board, position)
       return board[position] == " "
    end 

    def full_board_check(board)
       count = 0
       for i in 1..10
          if space_check(board, i) == false
            count += 1 
          end
       end
       if count >= 10
         return true
       else
        return false
       end
    end

    def yourchoice(board)
      while true
       print "Chose your next position: (1-9)"
       position = gets.chomp
       i = position.to_i
       checknumber = ["1","2","3","4","5","6","7","8","9"]
       if checknumber.include? position and space_check(board, i)
           return i
       else
           redo
       end
      end
    end
    
    def play_again()
      print "Play again? (Y/N)"
      youranswer = gets.chomp
    end

print "Input your name please: "
playername = gets.chomp
print "Hi #{playername} !!!"
print "Play the game? (Y/N) "
playgame = gets.chomp
  if playgame.upcase == "Y"
    game_start = true
  elsif playgame.upcase == "N"
    print "See you #{playername}~~"
    game_start = false
  end
    
while game_start ==true
   playboard = [" "]*10
   p1marker, p2marker = chose_xo()
   print "#{playername} is #{p1marker} , COM is #{p2marker}\n"
   turn = who_first(turn)
   print "#{turn} first\n"
   game_on = true
      while game_on
       if turn == "Player1"
         print "#{playername} turn\n"
         board_disp(playboard)
         p1chose = yourchoice(playboard)
         inputxo(playboard, p1chose, p1marker)
         if win_check(playboard, p1marker)
           board_disp(playboard)
           print "#{playername} Win!!!\n"
           game_on = false
         else
           if full_board_check(playboard)
             board_disp(playboard)
             print "Draw\n"
             game_on = false
           else
             turn = "Player2"
           end
         end

       else
         print "COM turn\n"
         board_disp(playboard)
         p2chose = yourchoice(playboard)
         inputxo(playboard, p2chose, p2marker)
         if win_check(playboard, p2marker)
           board_disp(playboard)
           print "COM Win!!!\n"
           game_on = false
         else
           if full_board_check(playboard)
             board_disp(playboard)
             print "Draw\n"
             game_on = false
           else
             turn = "Player1"
           end
         end

       end  
     end
     if play_again().upcase == "Y"
       redo
     else
       print "Bye~"
       break
     end
end