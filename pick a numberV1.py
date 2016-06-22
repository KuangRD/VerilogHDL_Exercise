Score_Dict = {'player1':0, 'player2':0}
Choose_Log =  {'player1':[], 'player2':[]}


def check_win(Choose_Log):
    print Choose_Log['player1']
    if sum(Choose_Log['player1']) > sum(Choose_Log['player2']):
        return 'player1'
    elif sum(Choose_Log['player1']) < sum(Choose_Log['player2']):
        return 'player2'
    else:
        return 'tie'


def switch_player(current_player):
    if current_player == 'player1':
        return 'player2'
    elif current_player == 'player2':
        return 'player1'
    else:
        print "invalid current_player input"


def list_clone(number_list):
    
    clone_list = []
    
    for number in number_list:
        clone_list.append(number)
    
    return clone_list

def mm_choose(number_list,Choose_Log,player):
    optimal_choose = -3
    winner = 'Unknown'
    if len(number_list) <= 1:
        
        if len(number_list)==1 :
            Choose_Log[player].append(number_list.pop())
        winner = check_win(Choose_Log)
        """
        if winner == player:
            choose_score = 1       
        elif  winner == another_player:
            choose_score = -1
        else:
            choose_score = 0
        """    
        return winner,optimal_choose

    else:
        another_player = switch_player(player)

        #print Dummy_Choose_Log
        Choose_Dict = {0:0,-1:0}

    
        for dummy_choose in [0,-1]:
            Dummy_list = list_clone(number_list)
            Dummy_Choose_Log = {}
            Dummy_Choose_Log['player1'] = Choose_Log['player1']
            Dummy_Choose_Log['player2'] = Choose_Log['player2']
            
            while len(Dummy_list) > 0 : 
                Dummer_pop_number = Dummy_list.pop(dummy_choose)
                print "Dummy_List Status",Dummy_list
                Dummy_Choose_Log[player].append(Dummer_pop_number)
                
                
                predict = mm_choose( Dummy_list,Dummy_Choose_Log,another_player)
            
            if  predict[0] == player:
                Choose_Dict[dummy_choose] += 1       
            elif predict[0] == another_player:
                Choose_Dict[dummy_choose] -= 1
           
            
        #print "Log",Dummy_Choose_Log
        #print player,Choose_Dict
        
        if Choose_Dict[-1] >  Choose_Dict[0]:
            optimal_choose = number_list.pop(-1)
        else:
            optimal_choose = number_list.pop(0)

        return winner,optimal_choose



  

def pick_a_number(the_list):
    player = 'player1'
    while len(the_list)> 0:
        print "List Status",the_list
        number_picked = mm_choose(the_list,Choose_Log,player)[1]
        
        Choose_Log[player].append(number_picked)
        print player ,"pick" , number_picked
        print 
        
        player = switch_player(player)

    return (Score_Dict)

pick_board = [3,5,2,1]
print pick_a_number(pick_board)
