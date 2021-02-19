
--1
SELECT
    
    
    t1.PLAYERNAME,
    t3.player_id

    
    

FROM

    player t1 join 
     team t2 on t1.teamid=t2.teamid
     JOIN previewsTeam t3 on t3.player_id=t1.playerid
                          
WHERE
    t3.POSTEAMIDD = 'GSW' OR t3.POSTEAMIDD ='CHO' OR t2.teamName='Golden State Warriors' OR t2.teamName=' Charlotte Hornet'
    

--2
SELECT AVG(PTS) "MESOS OROS"
FROM PLAYERSTATS P join PLAYER PL ON P.PERPLAYERID=PL.PLAYERID
WHERE PL.PLAYERNAME='Stephen Curry'


--3
SELECT AVG(TEAM2POINTS),M.home_awawy,T.teamAcro
FROM TEAM  T JOIN MATCH M ON T.teamID=M.TEAM1
WHERE T.teamname='Milwaukee Bucks' AND M.home_awawy='home'
GROUP BY M.home_awawy,T.teamAcro

--4
SELECT

    m.team1,
    m.team2,
    t.teamname,
    me.X3POINTSSHOOTS

FROM
    match               m
    INNER JOIN matchperomance_id   me ON m.matchperomanceid = me.matchperomanceid
    INNER JOIN team                t ON t.teamid = m.team2 or t.teamid = m.team1
   
WHERE
  ME.X3POINTSSHOOTS = (SELECT MAX (X3POINTSSHOOTS) FROM MATCHPEROMANCE_ID ) AND t.teamname='Dallas Mavericks '
    
GROUP BY
   me.X3POINTSSHOOTS,
    m.team1,
    m.team2,t.teamname
 


--5
SELECT T.teamID,m.game_id,t.teamname,m.team1points,m.team2points
FROM
MATCH M JOIN TEAM T ON  t.teamid = M.team2 or t.teamid = M.team1
WHERE team1points= (SELECT MAX(team2Points-team1Points) FROM MATCH) OR  team2points= (SELECT MAX(team1Points-team2Points) FROM MATCH)



