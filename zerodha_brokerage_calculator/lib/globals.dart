Map<String, dynamic> commodityOptMultiplier = {
  "COPPER": '2500n',
  "CRUDEOIL": '100n',
  "GOLD": '100n',
  "SILVER": '30n',
  "ZINC": '5000n'
};

Map<String, dynamic> commodityStrikeMap = {
  "COPPER": '400,5',
  "CRUDEOIL": '3000,50',
  "GOLD": '30000,100',
  "SILVER": '40000,250',
  "ZINC": '190,2.5'
};

/// Used in Future commodities.
Map<String, dynamic> commodityMultiplierMap = {
  // "ALUMINI": '1000a',
  "ALUMINIUM": '5000a',
  "CARDAMOM": '100a',
  "CASTORSEED": '100b',
  "COPPER": '2500a',
  // "COPPERM": '250a',
  "COTTON": '25a',
  "CPO": '1000a',
  "CRUDEOIL": '100a',
  "GOLD": '100a',
  "GOLDGUINEA": '1a',
  "GOLDM": '10a',
  "GOLDPETAL": '1a',
  "KAPAS": '200b',
  "LEAD": '5000a',
  // "LEADMINI": '1000a',
  "MCXBULLDEX": '50a',
  "MCXMETLDEX": '50a',
  "MENTHOIL": '1080a',
  "NATURALGAS": '1250a',
  "NICKEL": '1500a',
  "PEPPER": '10b',
  "RBDPMOLEIN": '1000b',
  "RUBBER": '10a',
  "SILVER": '30a',
  "SILVERM": '5a',
  "SILVERMIC": '1a',
  "ZINC": '5000a',
  // "ZINCMINI": '1000a'
};

Map<String, dynamic> commodityGroupMap = {
  // "ALUMINI": '1000n',
  "ALUMINIUM": '5000n',
  "CARDAMOM": '100a',
  "CASTORSEED": '100a',
  "COPPER": '2500n',
  // "COPPERM": '250n',
  "COTTON": '25a',
  "CPO": '1000a',
  "CRUDEOIL": '100n',
  "GOLD": '100n',
  "GOLDGUINEA": '1n',
  "GOLDM": '10n',
  "GOLDPETAL": '1n',
  "KAPAS": '4000a',
  "LEAD": '5000n',
  // "LEADMINI": '1000n',
  "MCXBULLDEX": '50n',
  "MCXMETLDEX": '50n',
  "MENTHOIL": '1080a',
  "NATURALGAS": '1250n',
  "NICKEL": '1500n',
  "PEPPER": '10a',
  "RBDPMOLEIN": '1000a',
  "RUBBER": '10a',
  "SILVER": '30n',
  "SILVERM": '5n',
  "SILVERMIC": '1n',
  "ZINC": '5000n',
  // "ZINCMINI": '1000n'
};

Map<String, dynamic> commodityOptionBuySellMap = {
  "COPPER": '310,315',
  "CRUDEOIL": '3170,3190',
  "GOLD": '30950,30980',
  "SILVER": '43750,43800',
  "ZINC": '156,159'
};

Map<String, dynamic> commodityBuySellMap = {
  // "ALUMINI": '110,112',
  "ALUMINIUM": '110,112',
  "CARDAMOM": '1160,1165',
  "CASTORSEED": '3880,3884',
  "COPPER": '310,315',
  // "COPPERM": '310,315',
  "COTTON": '20100,20150',
  "CPO": '560,562',
  "CRUDEOIL": '3170,3190',
  "GOLD": '30950,30980',
  "GOLDGUINEA": '24650,24700',
  "GOLDM": '30950,30980',
  "GOLDPETAL": '3060,3090',
  "KAPAS": '20100,20150',
  "LEAD": '125,128',
  // "LEADMINI": '125,128',
  "MCXBULLDEX": '50,55',
  "MCXMETLDEX": '50,55',
  "MENTHOIL": '950,960',
  "NATURALGAS": '195,198',
  "NICKEL": '660,665',
  "PEPPER": '40000,40100',
  "RBDPMOLEIN": '520,525',
  "RUBBER": '15000,15100',
  "SILVER": '43750,43800',
  "SILVERM": '43750,43800',
  "SILVERMIC": '43750,43800',
  "ZINC": '156,159',
  // "ZINCMINI": '156,159'
};

Map<String, dynamic> commodityOptionsUnit = {
  "COPPER": 'per Kg,2.5 MT',
  "CRUDEOIL": 'per Barrel,100 BBL(Barrel)',
  "GOLD": 'per 10 Grams,1 Kg',
  "SILVER": 'per Kg,30 Kg',
  "ZINC": 'per Kg,5 MT'
};

Map<String, dynamic> commodityUnit = {
  // "ALUMINI": 'per Kg,1 MT',
  "ALUMINIUM": 'per Kg,5 MT',
  "CARDAMOM": 'per Kg,100 Kg',
  "CASTORSEED": 'per Quintal,10 MT',
  "COPPER": 'per Kg,2.5 MT',
  // "COPPERM": 'per Kg,250 Kg',
  "COTTON": 'per Bale,25 Bales',
  "CPO": 'per Kg,10 MT',
  "CRUDEOIL": 'per Barrel,100 BBL(Barrel)',
  "GOLD": 'per 10 Grams,1 Kg',
  "GOLDGUINEA": 'per 8 Grams,8 Grams',
  "GOLDM": 'per 10 Grams,100 Grams',
  "GOLDPETAL": 'per Gram,1 Gram',
  "KAPAS": 'per 20 Kg,4 MT',
  "LEAD": 'per Kg,5 MT',
  // "LEADMINI": 'per Kg,1 MT',
  "MCXBULLDEX": 'MCX iCOMDEX Bullion Index,50',
  "MCXMETLDEX": 'MCX iCOMDEX Base Metal Index,50',
  "MENTHOIL": 'per Kg,1080 Kg',
  "NATURALGAS": 'per MMBTU,1250 MMBTU',
  "NICKEL": 'per Kg,1500 Kg',
  "PEPPER": 'per Quintal,1 MT',
  "RBDPMOLEIN": 'per 10Kg,10MT',
  "RUBBER": 'per 100Kg,1MT',
  "SILVER": 'per Kg,30 Kg',
  "SILVERM": 'per Kg,5 Kg',
  "SILVERMIC": 'per Kg,1 Kg',
  "ZINC": 'per Kg,5 MT',
  // "ZINCMINI": 'per Kg,1 MT'
};

Map<String, dynamic> commoditiesStamp = {
  "COTTON": '0.30',
  "KAPAS": '0.30',
  "GOLD": '0.50',
  "SILVER": '0.10',
  "CASTORSEED": '0.50'
};

