select * from Stations
select * from Hosts
select * from Shows
select * from Partnerships
select * from ShowPartnerships
select * from Awards
select * from OnlinePresence

--Questions

--1)Retrieve all stations in the "East" region?

select StationID,StationName,Location from Stations
where Location = 'East'

--2)List all shows hosted by "Vrajesh Hirjee"?

select H.HostName,S.ShowName from Hosts H
join Shows S
on H.HostID = S.HostID
where H.HostName = 'Vrajesh Hirjee'


--3)Count the number of awards each show has won?

select S.ShowName,count(A.AwardName) as No_of_Awards from Awards A
Join Shows S
on A.ShowID = S.ShowID
Group by S.ShowName


--4)Find shows that have partnerships with "Spotify"?

select S.ShowName,P.PartnerName from Shows S
join ShowPartnerships SP
on S.ShowID = SP.ShowID
join Partnerships P
on p.PartnershipID = SP.PartnershipID
where p.PartnerName = 'Spotify'

--5)Retrieve hosts who joined before 2010?

select HostID,HostName,JoinDate from Hosts
where YEAR(JoinDate) < 2010

--6)List the shows and their launch dates in descending order of launch date?

Select ShowID,ShowName,LaunchDate from Shows
order by LaunchDate Desc

--7)Find the total count of shows for each host?

select HostID,HostName,sum(ShowCount) as Total_Shows from Hosts
group by HostID,HostName

--8)Show the online presence platforms with their links?

select PlatformName,Link from OnlinePresence

--9)Retrieve the stations in the "South" region launched after 2010?

select * from Stations
where Location = 'South' and YEAR(LaunchDate) > 2010

--10)Rank hosts based on the number of shows they have hosted?
select HostID,HostName,ShowCount,
	DENSE_RANK() over(order by ShowCount desc) as Show_Ranks
from Hosts
