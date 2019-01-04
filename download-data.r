con = gzcon(url('https://github.com/systematicinvestor/SIT/raw/master/sit.gz', 'rb'))
source(con)
close(con)

load.packages('quantmod')   

con = gzcon(url('https://github.com/systematicinvestor/SIT/raw/master/sit.gz', 'rb'))
source(con)
close(con)

load.packages('quantmod')   

# SPY,QQQ,IWM,VGK,EWJ,VWO,GSG,GLD,VNQ,HYG, LQD,TLT + C2:SHY,IEF

tickers = '
SPY = SPY + ^GSPC, #S&P500 (VOO)
EFA = EFA + VTMGX, #Developed markets
#QQQ = QQQ + ^NDX, #Nasdaq
#IWM = IWM + ^RUT, #Russell 2000
#VGK = VGK + FIEUX, #FTSE Europe
#EWJ = EWJ + FJPNX, #MSCI Japan
AGG = AGG + VBMFX, #Total bonds
VWO = VWO + VEIEX, #FTSE Emerging Markets
#GSG = GSG + , #Commodities
#GLD = GLD + , #Gold
#VNQ = VNQ + VGSIX, #Real Estate
#HYG = HYG + , #High Yield Corporate
#LQD = LQD + , #Investment Grade Corporate
TLT = TLT + VUSTX, #20+ Year Treasury
SHY = SHY + VFISX, #1 to 3 Year Treasury
IEF = IEF + VFITX, #7 to 10 Year Treasury
'
#             TLT = TLT + VUSTX,
# #              TLT = BLV + VBLTX,
#              BLV = BLV + VBLTX,
#               GLD = GLD + GOLD,
# #              GLD = GLD,
# 
# #              SHY = SHY + VFISX,
#               SHY = VFISX,
#               VEU = VEU + FDIVX,
# COM = DBC;GSG + CRB
# 
# RExUS = [RWX] + VNQ + VGSIX
# RE = [RWX] + VNQ + VGSIX
# RE.US = [ICF] + VGSIX
# 
# EMER.EQ = [EEM] + VEIEX
# EMER.FI = [EMB] + PREMX
# 
# GOLD = [GLD] + GOLD,
# US.CASH = [BIL] + TB3M,
# SHY + TB3Y,
# 
# US.HY = [HYG] + VWEHX
# 
# # Bonds
# US.BOND = [AGG] + VBMFX
# INTL.BOND = [BWX] + BEGBX
# 
# JAPAN.EQ = [EWJ] + FJPNX
# EUROPE.EQ = [IEV] + FIEUX
# US.SMCAP = IWM;VB + NAESX
# TECH.EQ = [QQQ] + ^NDX
# US.EQ = [VTI] + VTSMX + VFINX
# US.MID = [VO] + VIMSX
# EAFE = [EFA] + VDMIX + VGTSX
# 
# MID.TR = [IEF] + VFITX
# CORP.FI = [LQD] + VWESX
# TIPS = [TIP] + VIPSX + LSGSX
# LONG.TR = [TLT] + VUSTX
# '

raw <- new.env()

getSymbols.extra(tickers, src='yahoo', from = '1970-01-01', env = raw, set.symbolnames = T, auto.assign = T)

saveRDS(raw, file="./data/raw-prices.RData")