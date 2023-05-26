@isTest
public class RVWeightDeterminationTest
{
	@testSetup
    public static void dataSetup() {
        
        Map<String, String> mapWithRVValues = new Map<String, String>();
        mapWithRVValues.put('BRAND','Groth');
        mapWithRVValues.put('PRODUCT_CODE','RLFVLV');
        mapWithRVValues.put('PRODUCT_NAME','ReliefValves');
        
        SBQQ__QuoteLine__c quoteLine = TestDataBaseUtility.createQLAndAssociatedRecords(mapWithRVValues);
        List<RV_Master_Blaster__c> RVMasterBlasterTable = Test.loadData(RV_Master_Blaster__c.sObjectType, 'RV_MasterBlaster_data');
        
        Test.loadData(RV_CFactor__c.sObjectType, 'RV_CFactor');
        Test.loadData(RV_VacSettingLimits__c.sObjectType, 'RV_VacSettingLimits_Data2');
        Test.loadData(RV_PosSettingLimits__c.sObjectType, 'RV_PosSettingLimits_Data2');

        Test.startTest();
        TestDataRVUtility.createRVWeightData(quoteLine);
        TestDataRVUtility.createRVWeightData5(quoteLine);
        TestDataRVUtility.createRVWeightData6(quoteLine);
        TestDataRVUtility.createRVWeightData7(quoteLine);
        Test.stopTest();
    }

    @isTest
    public static void RVProductNarrowingMethods() {        
        Test.startTest();
        List<Relief_Valve__c> reliefValveList = new List<Relief_Valve__c>();

        reliefValveList = [SELECT Id,ASSYPARTNO__c,Atex_bkend__c,Atex_Certificate__c,Atmospheric_Pressure_Units__c,Atmospheric_Pressure__c,Back_Pressure_Units__c,Back_Pressure__c,Body_Coating_Material__c,Body_Design__c,Body_Material__c,Brand__c,Brinell_hardness_examination_Backend__c,Brinell_hardness_examination__c,Build_Cost_Override__c,Bypass__c,Charpy_Impact_Testing_Backend__c,Charpy_Impact_Testing__c,Compressibility_Factor__c,Constraint_Product_Selection_By_Flow__c,Converted_Atmospheric_Pressure__c,Converted_Back_Pressure__c,Converted_Max_Process_Pressure__c,Converted_Pressure_Relief_Req_Flow__c,Converted_Pressure_Relieving_Temperature__c,Converted_Pressure_Setting__c,Converted_Relieving_Pressure_Value__c,Converted_Vacuum_Relief_Req_Flow__c,Converted_Vacuum_Setting__c,Customer_Specified_Media_Name__c,CUTR_bkend__c,CU_TR__c,Diaphragm_Material__c,Discountable_Price__c,Document_IDs__c,Drilling__c,Dummy_Atex__c,Dummy_CUTR__c,Dummy_Flowing_Pressure_Units__c,Dummy_Flowing_Pressure__c,Dummy_PED__c,Dummy_Vacuum_Flowing_Pressure_Units__c,Dummy_Vacuum_Flowing_Pressure__c,EffMBP__c,EFFMop__c,Element_Material_Flag__c,Element_Material__c,Engineering_Notes__c,Engineering_Specials__c,Enter_Relieving_Pressure_Units__c,Enter_Relieving_Pressure_Value__c,Facing__c,Fastener_Material__c,Field_Test_Connection_Backend__c,Field_Test_Connection__c,Fillet_Weld_Liquid_Dye_Penetrant_Backend__c,Fillet_Weld_Liquid_Dye_Penetrant__c,Final_Assembly_Location_Requirements__c,Finish_Configuration_Flag__c,Flame_Arrester_Flag__c,Flame_Arrester_Option__c,Flow_Rate_Units__c,Gas_Group__c,Gas_List__c,Hydrotest__c,Intergranular_Corossion_Test_Backend__c,Intergranular_Corossion_Test__c,Is_flame_arrester_needed_with_your_valve__c,Lead_Time_Override__c,Lead_Time_Site_10__c,Lead_Time_Site_20__c,Lead_Time_Site_30__c,Lead_Time_Site_40__c,Liquid_Dye_Penetrant__c,List_Price_Each__c,Magnetic_Particle_Examination_Backend__c,Magnetic_Particle_Examination__c,Manual_Blowdown_Backend__c,Manual_Blowdown__c,Material_Sourcing_Requirements__c,Max_Process_Pressure_Unit__c,Max_Process_Pressure__c,Media_Name__c,Media_Type__c,Media__c,Method21_Leak_Detection_Backend__c,Method21_Leak_Detection__c,Model_name__c,Model_Size__c,Molecular_Weight__c,Nace_Backend__c,NACE__c,Non_Discountable_Price__c,OA01__c,OA02__c,OA03__c,OA04__c,OA05__c,OA06__c,OA__c,OB010__c,OB0100__c,OB0110__c,OB020__c,OB030__c,OB040__c,OB050__c,OB060__c,OB070__c,OB080__c,OB090__c,OB100__c,OB110__c,OB130__c,OB140__c,OB150__c,OB160__c,OB170__c,OB180__c,OB190__c,OB200__c,OB210__c,OB220__c,OB240__c,OB245__c,OB250__c,OB300__c,OB320__c,OB365__c,OB370__c,OB400__c,OB420__c,OB470__c,OB471__c,OB480__c,OB490__c,OB500__c,OB502__c,OB503__c,OB510__c,OB515__c,OB520__c,OB525__c,OB527__c,OB530__c,OB540__c,OB550__c,OB560__c,OB570__c,OB580__c,OB590__c,OB610__c,OB620__c,OB630__c,OB640__c,OB650__c,OB660__c,OB670__c,OB680__c,OB690__c,OB695__c,OB700__c,OB710__c,OB720__c,OB730__c,OB740__c,OB__c,Overpressure__c,OW050__c,OW060__c,OW070__c,OW071__c,OW072__c,OW110__c,OW111__c,OW130__c,OW910__c,OW920__c,OW__c,Painting_Coating_Option__c,Pallet_Fastener_Coating_Material__c,Pallet_Type__c,PARTREV__c,Part_Number_Base__c,Part_Number__c,PC020__c,PC025__c,PC040__c,PC045__c,PC050__c,PC055__c,PC080__c,PC081__c,PC__c,PED_2014_68_EU_CE_mark__c,PED_bkend__c,Pilot_Action_Flag__c,Pilot_Action__c,Pilot_Exhaust_Discharge_Header_Backend__c,Pilot_Exhaust_Piped_to_Discharge_Header__c,Pilot_Soft_Goods_Material__c,Pilot_Supply_Filter_Backend__c,Pilot_Supply_Filter__c,Pilot_Valves_option__c,Positive_Material_Identification__c,PosKDHigh__c,PosKDLow__c,PosKD__c,PosPresRatioHigh__c,PosPresRatioLow__c,PosSetPresOSIG__c,Pressure_Direction__c,Pressure_Pallet_Material__c,Pressure_Port_Proximity_Sensor_Backend__c,Pressure_Port_Proximity_Sensor__c,Pressure_Relief_Req_Flow_Rate__c,Pressure_Relief_Req_Flow_Units__c,Pressure_Relieving_Temperature_Units__c,Pressure_Relieving_Temperature__c,Pressure_Setting_Units__c,Pressure_Setting__c,Pressure_Units__c,Price_Engineer_Override__c,Quantity__c,Quote_Description_Engineer_Override__c,Quote_Line__c,Radiography__c,Ratio_of_Specific_Heats__c,Relief_Type__c,Remote_Sense_Backend__c,Remote_Sense__c,Schedule_BaseLead__c,Seat_Material__c,Section_A_Flag__c,Section_B_Flag__c,Section_C_Flag__c,Section_D_Flag__c,Section_E_Flag__c,Section_F_Flag__c,Section_G_Flag__c,Section_H_Flag__c,Section_I_Flag__c,Shell_Test_Valve_Body__c,Size_Preference__c,Size__c,Smallest__c,Split_Overpressure__c,Spring_Material__c,StdPosAirFlowSCFH__c,StdPosKd__c,StdPosPresRatio__c,StdVacAirFlowSCFH__c,StdVacKd__c,StdVacPresRatio__c,SteamJacket_Display_Flag__c,Steam_Jacket_Material__c,Temperature_Units__c,Type_of_model__c,Type_of_overpressure_valve__c,Ultrasonic_Examination_Backend__c,Ultrasonic_Examination__c,VacKDHigh__c,VacKDLow__c,VacPresRatioHigh__c,VacPresRatioLow__c,VacSetPresOSIG__c,Vacuum_Media__c,Vacuum_Pallet_Material__c,Vacuum_Port_Option__c,Vacuum_Port_Proximity_Sensor_Backend__c,Vacuum_Port_Proximity_Sensor__c,Vacuum_Relief_Required_Flow_Units__c,Vacuum_Relief_Req_Flow__c,Vacuum_Relief__c,Vacuum_Setting_Units__c,Vacuum_Setting__c,Visual_Casting_Examination_Backend__c,Visual_Casting_Examination__c,V_Compressibility_Factor__c,V_Converted_Relieving_Vacuum_Value__c,V_Converted_Vacuum_Relieving_Temperature__c,V_Customer_Specified_Media_Name__c,V_Enter_Relieving_Vacuum_units__c,V_Enter_Relieving_Vacuum_Value__c,V_Gas_List__c,V_Media_Name__c,V_Media__c,V_Molecular_Weight__c,V_Overpressure_Vacuum_Value__c,V_Ratio_of_Specific_Heats__c,V_Vacuum_Relieving_Temperature_Units__c,V_Vacuum_Relieving_Temperature__c,Weight_Material__c,Working_days_CDC__c,Working_days_GCI__c,Working_days_GP__c,Zone__c
        FROM Relief_Valve__c 
        WHERE ASSYPARTNO__c = 'V146000006355VTA00003' limit 1];

        Relief_Valve__c conRV;
        if(!reliefValveList.isEmpty()){
            conRV = reliefValveList[0];
        }
        
        RVWeightDetermination WeightDetermination = new RVWeightDetermination(conRV);
        
        RV_Cavity__c cav = new RV_Cavity__c();
        cav.CavityDiameter1__c = 8.5;
        cav.CavityDiameter2__c = 7.56;
        cav.CavityHeight1__c = 3.437;
        cav.CavityHeight2__c = 0.875;
        cav.Direction__c = 'Pos';
        cav.EffSealingDiameter__c = 7.9375;
        cav.PTC__c = '1460';
        cav.SpacerYN__c = 'N';
        cav.StemDiameter__c = 0.5;
        cav.SZC__c = '06';
        insert cav;

        RV_Valve_Attributes_Details__c rvdetail = new RV_Valve_Attributes_Details__c();
        rvdetail.Attribute__c = 'ASYTYP';
        rvdetail.Text1Val__c = '1460';
        rvdetail.Text__c = 'ERV';
        insert rvdetail;

        

        TestDataRVUtility.createRVMapData();
        
        map<string,string> WeightMethod = WeightDetermination.getInitialWeightDetermination(conRV, TestDataRVUtility.mapWithRVValues4);
        WeightDetermination.cleanRVrecord(conRV);
        Test.stopTest();
    }

    @istest
    public static void RVProductNarrowingMethods2(){
        Test.startTest();
        List<Relief_Valve__c> reliefValveList = new List<Relief_Valve__c>();

        reliefValveList = [SELECT Id,ASSYPARTNO__c,Atex_bkend__c,Atex_Certificate__c,Atmospheric_Pressure_Units__c,Atmospheric_Pressure__c,Back_Pressure_Units__c,Back_Pressure__c,Body_Coating_Material__c,Body_Design__c,Body_Material__c,Brand__c,Brinell_hardness_examination_Backend__c,Brinell_hardness_examination__c,Build_Cost_Override__c,Bypass__c,Charpy_Impact_Testing_Backend__c,Charpy_Impact_Testing__c,Compressibility_Factor__c,Constraint_Product_Selection_By_Flow__c,Converted_Atmospheric_Pressure__c,Converted_Back_Pressure__c,Converted_Max_Process_Pressure__c,Converted_Pressure_Relief_Req_Flow__c,Converted_Pressure_Relieving_Temperature__c,Converted_Pressure_Setting__c,Converted_Relieving_Pressure_Value__c,Converted_Vacuum_Relief_Req_Flow__c,Converted_Vacuum_Setting__c,Customer_Specified_Media_Name__c,CUTR_bkend__c,CU_TR__c,Diaphragm_Material__c,Discountable_Price__c,Document_IDs__c,Drilling__c,Dummy_Atex__c,Dummy_CUTR__c,Dummy_Flowing_Pressure_Units__c,Dummy_Flowing_Pressure__c,Dummy_PED__c,Dummy_Vacuum_Flowing_Pressure_Units__c,Dummy_Vacuum_Flowing_Pressure__c,EffMBP__c,EFFMop__c,Element_Material_Flag__c,Element_Material__c,Engineering_Notes__c,Engineering_Specials__c,Enter_Relieving_Pressure_Units__c,Enter_Relieving_Pressure_Value__c,Facing__c,Fastener_Material__c,Field_Test_Connection_Backend__c,Field_Test_Connection__c,Fillet_Weld_Liquid_Dye_Penetrant_Backend__c,Fillet_Weld_Liquid_Dye_Penetrant__c,Final_Assembly_Location_Requirements__c,Finish_Configuration_Flag__c,Flame_Arrester_Flag__c,Flame_Arrester_Option__c,Flow_Rate_Units__c,Gas_Group__c,Gas_List__c,Hydrotest__c,Intergranular_Corossion_Test_Backend__c,Intergranular_Corossion_Test__c,Is_flame_arrester_needed_with_your_valve__c,Lead_Time_Override__c,Lead_Time_Site_10__c,Lead_Time_Site_20__c,Lead_Time_Site_30__c,Lead_Time_Site_40__c,Liquid_Dye_Penetrant__c,List_Price_Each__c,Magnetic_Particle_Examination_Backend__c,Magnetic_Particle_Examination__c,Manual_Blowdown_Backend__c,Manual_Blowdown__c,Material_Sourcing_Requirements__c,Max_Process_Pressure_Unit__c,Max_Process_Pressure__c,Media_Name__c,Media_Type__c,Media__c,Method21_Leak_Detection_Backend__c,Method21_Leak_Detection__c,Model_name__c,Model_Size__c,Molecular_Weight__c,Nace_Backend__c,NACE__c,Non_Discountable_Price__c,OA01__c,OA02__c,OA03__c,OA04__c,OA05__c,OA06__c,OA__c,OB010__c,OB0100__c,OB0110__c,OB020__c,OB030__c,OB040__c,OB050__c,OB060__c,OB070__c,OB080__c,OB090__c,OB100__c,OB110__c,OB130__c,OB140__c,OB150__c,OB160__c,OB170__c,OB180__c,OB190__c,OB200__c,OB210__c,OB220__c,OB240__c,OB245__c,OB250__c,OB300__c,OB320__c,OB365__c,OB370__c,OB400__c,OB420__c,OB470__c,OB471__c,OB480__c,OB490__c,OB500__c,OB502__c,OB503__c,OB510__c,OB515__c,OB520__c,OB525__c,OB527__c,OB530__c,OB540__c,OB550__c,OB560__c,OB570__c,OB580__c,OB590__c,OB610__c,OB620__c,OB630__c,OB640__c,OB650__c,OB660__c,OB670__c,OB680__c,OB690__c,OB695__c,OB700__c,OB710__c,OB720__c,OB730__c,OB740__c,OB__c,Overpressure__c,OW050__c,OW060__c,OW070__c,OW071__c,OW072__c,OW110__c,OW111__c,OW130__c,OW910__c,OW920__c,OW__c,Painting_Coating_Option__c,Pallet_Fastener_Coating_Material__c,Pallet_Type__c,PARTREV__c,Part_Number_Base__c,Part_Number__c,PC020__c,PC025__c,PC040__c,PC045__c,PC050__c,PC055__c,PC080__c,PC081__c,PC__c,PED_2014_68_EU_CE_mark__c,PED_bkend__c,Pilot_Action_Flag__c,Pilot_Action__c,Pilot_Exhaust_Discharge_Header_Backend__c,Pilot_Exhaust_Piped_to_Discharge_Header__c,Pilot_Soft_Goods_Material__c,Pilot_Supply_Filter_Backend__c,Pilot_Supply_Filter__c,Pilot_Valves_option__c,Positive_Material_Identification__c,PosKDHigh__c,PosKDLow__c,PosKD__c,PosPresRatioHigh__c,PosPresRatioLow__c,PosSetPresOSIG__c,Pressure_Direction__c,Pressure_Pallet_Material__c,Pressure_Port_Proximity_Sensor_Backend__c,Pressure_Port_Proximity_Sensor__c,Pressure_Relief_Req_Flow_Rate__c,Pressure_Relief_Req_Flow_Units__c,Pressure_Relieving_Temperature_Units__c,Pressure_Relieving_Temperature__c,Pressure_Setting_Units__c,Pressure_Setting__c,Pressure_Units__c,Price_Engineer_Override__c,Quantity__c,Quote_Description_Engineer_Override__c,Quote_Line__c,Radiography__c,Ratio_of_Specific_Heats__c,Relief_Type__c,Remote_Sense_Backend__c,Remote_Sense__c,Schedule_BaseLead__c,Seat_Material__c,Section_A_Flag__c,Section_B_Flag__c,Section_C_Flag__c,Section_D_Flag__c,Section_E_Flag__c,Section_F_Flag__c,Section_G_Flag__c,Section_H_Flag__c,Section_I_Flag__c,Shell_Test_Valve_Body__c,Size_Preference__c,Size__c,Smallest__c,Split_Overpressure__c,Spring_Material__c,StdPosAirFlowSCFH__c,StdPosKd__c,StdPosPresRatio__c,StdVacAirFlowSCFH__c,StdVacKd__c,StdVacPresRatio__c,SteamJacket_Display_Flag__c,Steam_Jacket_Material__c,Temperature_Units__c,Type_of_model__c,Type_of_overpressure_valve__c,Ultrasonic_Examination_Backend__c,Ultrasonic_Examination__c,VacKDHigh__c,VacKDLow__c,VacPresRatioHigh__c,VacPresRatioLow__c,VacSetPresOSIG__c,Vacuum_Media__c,Vacuum_Pallet_Material__c,Vacuum_Port_Option__c,Vacuum_Port_Proximity_Sensor_Backend__c,Vacuum_Port_Proximity_Sensor__c,Vacuum_Relief_Required_Flow_Units__c,Vacuum_Relief_Req_Flow__c,Vacuum_Relief__c,Vacuum_Setting_Units__c,Vacuum_Setting__c,Visual_Casting_Examination_Backend__c,Visual_Casting_Examination__c,V_Compressibility_Factor__c,V_Converted_Relieving_Vacuum_Value__c,V_Converted_Vacuum_Relieving_Temperature__c,V_Customer_Specified_Media_Name__c,V_Enter_Relieving_Vacuum_units__c,V_Enter_Relieving_Vacuum_Value__c,V_Gas_List__c,V_Media_Name__c,V_Media__c,V_Molecular_Weight__c,V_Overpressure_Vacuum_Value__c,V_Ratio_of_Specific_Heats__c,V_Vacuum_Relieving_Temperature_Units__c,V_Vacuum_Relieving_Temperature__c,Weight_Material__c,Working_days_CDC__c,Working_days_GCI__c,Working_days_GP__c,Zone__c
        FROM Relief_Valve__c 
        WHERE ASSYPARTNO__c = 'V1220A0006355BTA00001' limit 1];

        Relief_Valve__c conRV;
        if(!reliefValveList.isEmpty()){
            conRV = reliefValveList[0];
        }

        RV_PosSettingLimits__c posTestRecord = new RV_PosSettingLimits__c(BackpressureLL__c=-14.696,BackpressureUL__c=12,PalletDesign__c='Spun',PalletMatlCode__c='5',
        PalletType__c='N',PosProxSensorAvailable__c='N',PTC__c='1220A',SettingLL__c=0.6,SettingUL__c=5,
        SpacerYN__c='N',SZC__c='06',WeightMatlCode__c='S');
        insert posTestRecord;

        
        RV_Cavity__c cav = new RV_Cavity__c();
        cav.CavityDiameter1__c = 8.5;
        cav.CavityDiameter2__c = 7.56;
        cav.CavityHeight1__c = 3.437;
        cav.CavityHeight2__c = 0.875;
        cav.Direction__c = 'Pos';
        cav.EffSealingDiameter__c = 7.9375;
        cav.PTC__c = '1220A';
        cav.SpacerYN__c = 'N';
        cav.StemDiameter__c = 0.5;
        cav.SZC__c = '06';
        insert cav;
        
        RV_Valve_Attributes_Details__c rvdetail = new RV_Valve_Attributes_Details__c();
        rvdetail.Attribute__c = 'ASYTYP';
        rvdetail.Text1Val__c = '1220A';
        rvdetail.Text__c = 'PVRV';
        insert rvdetail;

        RVWeightDetermination WeightDetermination = new RVWeightDetermination(conRV);
        
        

        TestDataRVUtility.createRVMapData5();
        
        map<string,string> WeightMethod = WeightDetermination.getInitialWeightDetermination(conRV, TestDataRVUtility.mapWithRVValues5);
        WeightDetermination.cleanRVrecord(conRV);
        Test.stopTest();
    }

    @istest
    public static void RVProductNarrowingMethods3(){
        Test.startTest();
        List<Relief_Valve__c> reliefValveList = new List<Relief_Valve__c>();

        reliefValveList = [SELECT Id,ASSYPARTNO__c,Atex_bkend__c,Atex_Certificate__c,Atmospheric_Pressure_Units__c,Atmospheric_Pressure__c,Back_Pressure_Units__c,Back_Pressure__c,Body_Coating_Material__c,Body_Design__c,Body_Material__c,Brand__c,Brinell_hardness_examination_Backend__c,Brinell_hardness_examination__c,Build_Cost_Override__c,Bypass__c,Charpy_Impact_Testing_Backend__c,Charpy_Impact_Testing__c,Compressibility_Factor__c,Constraint_Product_Selection_By_Flow__c,Converted_Atmospheric_Pressure__c,Converted_Back_Pressure__c,Converted_Max_Process_Pressure__c,Converted_Pressure_Relief_Req_Flow__c,Converted_Pressure_Relieving_Temperature__c,Converted_Pressure_Setting__c,Converted_Relieving_Pressure_Value__c,Converted_Vacuum_Relief_Req_Flow__c,Converted_Vacuum_Setting__c,Customer_Specified_Media_Name__c,CUTR_bkend__c,CU_TR__c,Diaphragm_Material__c,Discountable_Price__c,Document_IDs__c,Drilling__c,Dummy_Atex__c,Dummy_CUTR__c,Dummy_Flowing_Pressure_Units__c,Dummy_Flowing_Pressure__c,Dummy_PED__c,Dummy_Vacuum_Flowing_Pressure_Units__c,Dummy_Vacuum_Flowing_Pressure__c,EffMBP__c,EFFMop__c,Element_Material_Flag__c,Element_Material__c,Engineering_Notes__c,Engineering_Specials__c,Enter_Relieving_Pressure_Units__c,Enter_Relieving_Pressure_Value__c,Facing__c,Fastener_Material__c,Field_Test_Connection_Backend__c,Field_Test_Connection__c,Fillet_Weld_Liquid_Dye_Penetrant_Backend__c,Fillet_Weld_Liquid_Dye_Penetrant__c,Final_Assembly_Location_Requirements__c,Finish_Configuration_Flag__c,Flame_Arrester_Flag__c,Flame_Arrester_Option__c,Flow_Rate_Units__c,Gas_Group__c,Gas_List__c,Hydrotest__c,Intergranular_Corossion_Test_Backend__c,Intergranular_Corossion_Test__c,Is_flame_arrester_needed_with_your_valve__c,Lead_Time_Override__c,Lead_Time_Site_10__c,Lead_Time_Site_20__c,Lead_Time_Site_30__c,Lead_Time_Site_40__c,Liquid_Dye_Penetrant__c,List_Price_Each__c,Magnetic_Particle_Examination_Backend__c,Magnetic_Particle_Examination__c,Manual_Blowdown_Backend__c,Manual_Blowdown__c,Material_Sourcing_Requirements__c,Max_Process_Pressure_Unit__c,Max_Process_Pressure__c,Media_Name__c,Media_Type__c,Media__c,Method21_Leak_Detection_Backend__c,Method21_Leak_Detection__c,Model_name__c,Model_Size__c,Molecular_Weight__c,Nace_Backend__c,NACE__c,Non_Discountable_Price__c,OA01__c,OA02__c,OA03__c,OA04__c,OA05__c,OA06__c,OA__c,OB010__c,OB0100__c,OB0110__c,OB020__c,OB030__c,OB040__c,OB050__c,OB060__c,OB070__c,OB080__c,OB090__c,OB100__c,OB110__c,OB130__c,OB140__c,OB150__c,OB160__c,OB170__c,OB180__c,OB190__c,OB200__c,OB210__c,OB220__c,OB240__c,OB245__c,OB250__c,OB300__c,OB320__c,OB365__c,OB370__c,OB400__c,OB420__c,OB470__c,OB471__c,OB480__c,OB490__c,OB500__c,OB502__c,OB503__c,OB510__c,OB515__c,OB520__c,OB525__c,OB527__c,OB530__c,OB540__c,OB550__c,OB560__c,OB570__c,OB580__c,OB590__c,OB610__c,OB620__c,OB630__c,OB640__c,OB650__c,OB660__c,OB670__c,OB680__c,OB690__c,OB695__c,OB700__c,OB710__c,OB720__c,OB730__c,OB740__c,OB__c,Overpressure__c,OW050__c,OW060__c,OW070__c,OW071__c,OW072__c,OW110__c,OW111__c,OW130__c,OW910__c,OW920__c,OW__c,Painting_Coating_Option__c,Pallet_Fastener_Coating_Material__c,Pallet_Type__c,PARTREV__c,Part_Number_Base__c,Part_Number__c,PC020__c,PC025__c,PC040__c,PC045__c,PC050__c,PC055__c,PC080__c,PC081__c,PC__c,PED_2014_68_EU_CE_mark__c,PED_bkend__c,Pilot_Action_Flag__c,Pilot_Action__c,Pilot_Exhaust_Discharge_Header_Backend__c,Pilot_Exhaust_Piped_to_Discharge_Header__c,Pilot_Soft_Goods_Material__c,Pilot_Supply_Filter_Backend__c,Pilot_Supply_Filter__c,Pilot_Valves_option__c,Positive_Material_Identification__c,PosKDHigh__c,PosKDLow__c,PosKD__c,PosPresRatioHigh__c,PosPresRatioLow__c,PosSetPresOSIG__c,Pressure_Direction__c,Pressure_Pallet_Material__c,Pressure_Port_Proximity_Sensor_Backend__c,Pressure_Port_Proximity_Sensor__c,Pressure_Relief_Req_Flow_Rate__c,Pressure_Relief_Req_Flow_Units__c,Pressure_Relieving_Temperature_Units__c,Pressure_Relieving_Temperature__c,Pressure_Setting_Units__c,Pressure_Setting__c,Pressure_Units__c,Price_Engineer_Override__c,Quantity__c,Quote_Description_Engineer_Override__c,Quote_Line__c,Radiography__c,Ratio_of_Specific_Heats__c,Relief_Type__c,Remote_Sense_Backend__c,Remote_Sense__c,Schedule_BaseLead__c,Seat_Material__c,Section_A_Flag__c,Section_B_Flag__c,Section_C_Flag__c,Section_D_Flag__c,Section_E_Flag__c,Section_F_Flag__c,Section_G_Flag__c,Section_H_Flag__c,Section_I_Flag__c,Shell_Test_Valve_Body__c,Size_Preference__c,Size__c,Smallest__c,Split_Overpressure__c,Spring_Material__c,StdPosAirFlowSCFH__c,StdPosKd__c,StdPosPresRatio__c,StdVacAirFlowSCFH__c,StdVacKd__c,StdVacPresRatio__c,SteamJacket_Display_Flag__c,Steam_Jacket_Material__c,Temperature_Units__c,Type_of_model__c,Type_of_overpressure_valve__c,Ultrasonic_Examination_Backend__c,Ultrasonic_Examination__c,VacKDHigh__c,VacKDLow__c,VacPresRatioHigh__c,VacPresRatioLow__c,VacSetPresOSIG__c,Vacuum_Media__c,Vacuum_Pallet_Material__c,Vacuum_Port_Option__c,Vacuum_Port_Proximity_Sensor_Backend__c,Vacuum_Port_Proximity_Sensor__c,Vacuum_Relief_Required_Flow_Units__c,Vacuum_Relief_Req_Flow__c,Vacuum_Relief__c,Vacuum_Setting_Units__c,Vacuum_Setting__c,Visual_Casting_Examination_Backend__c,Visual_Casting_Examination__c,V_Compressibility_Factor__c,V_Converted_Relieving_Vacuum_Value__c,V_Converted_Vacuum_Relieving_Temperature__c,V_Customer_Specified_Media_Name__c,V_Enter_Relieving_Vacuum_units__c,V_Enter_Relieving_Vacuum_Value__c,V_Gas_List__c,V_Media_Name__c,V_Media__c,V_Molecular_Weight__c,V_Overpressure_Vacuum_Value__c,V_Ratio_of_Specific_Heats__c,V_Vacuum_Relieving_Temperature_Units__c,V_Vacuum_Relieving_Temperature__c,Weight_Material__c,Working_days_CDC__c,Working_days_GCI__c,Working_days_GP__c,Zone__c
        FROM Relief_Valve__c 
        WHERE ASSYPARTNO__c = 'V2000A0020355T0A00037' limit 1];

        Relief_Valve__c conRV;
        if(!reliefValveList.isEmpty()){
            conRV = reliefValveList[0];
        }

        RV_PosSettingLimits__c posTestRecord = new RV_PosSettingLimits__c();
        posTestRecord.BackpressureLL__c = -14.696;
        posTestRecord.BackpressureUL__c = 100;
        posTestRecord.PalletDesign__c = 'Free Lift High';
        posTestRecord.PalletMatlCode__c = '5';
        posTestRecord.PalletType__c = 'N';
        posTestRecord.PosProxSensorAvailable__c = 'N';
        posTestRecord.PTC__c = '2000A';
        posTestRecord.SettingLL__c = 1.7;
        posTestRecord.SettingUL__c = 16;
        posTestRecord.SpacerYN__c = 'N';
        posTestRecord.SZC__c = '20';
        posTestRecord.WeightMatlCode__c = 'S';
        insert posTestRecord;
        
        RV_Cavity__c cav = new RV_Cavity__c();
        cav.CavityDiameter1__c = 24;
        cav.CavityDiameter2__c = 0;
        cav.CavityHeight1__c = 99;
        cav.CavityHeight2__c = 0;
        cav.Direction__c = 'Pos';
        cav.EffSealingDiameter__c = 19.75;
        cav.PTC__c = '2000A';
        cav.SpacerYN__c = 'N';
        cav.StemDiameter__c = 0.75;
        cav.SZC__c = '20';
        insert cav;
        
        RV_Valve_Attributes_Details__c rvdetail = new RV_Valve_Attributes_Details__c();
        rvdetail.Attribute__c = 'ASYTYP';
        rvdetail.NumVal1__c = 0;
        rvdetail.NumVal2__c = 0;
        rvdetail.NumVal3__c = 0;
        rvdetail.NumVal4__c = 0;
        rvdetail.Text1Val__c = '2000A';
        rvdetail.Text__c = 'ERV';
        insert rvdetail;

        RVWeightDetermination WeightDetermination = new RVWeightDetermination(conRV);
        TestDataRVUtility.createRVMapData6();
        map<string,string> WeightMethod = WeightDetermination.getInitialWeightDetermination(conRV, TestDataRVUtility.mapWithRVValues6);
        WeightDetermination.cleanRVrecord(conRV);
        Test.stopTest();
    }

    @istest
    public static void RVProductNarrowingMethods4(){
        Test.startTest();
        List<Relief_Valve__c> reliefValveList = new List<Relief_Valve__c>();

        reliefValveList = [SELECT Id,ASSYPARTNO__c,Atex_bkend__c,Atex_Certificate__c,Atmospheric_Pressure_Units__c,Atmospheric_Pressure__c,Back_Pressure_Units__c,Back_Pressure__c,Body_Coating_Material__c,Body_Design__c,Body_Material__c,Brand__c,Brinell_hardness_examination_Backend__c,Brinell_hardness_examination__c,Build_Cost_Override__c,Bypass__c,Charpy_Impact_Testing_Backend__c,Charpy_Impact_Testing__c,Compressibility_Factor__c,Constraint_Product_Selection_By_Flow__c,Converted_Atmospheric_Pressure__c,Converted_Back_Pressure__c,Converted_Max_Process_Pressure__c,Converted_Pressure_Relief_Req_Flow__c,Converted_Pressure_Relieving_Temperature__c,Converted_Pressure_Setting__c,Converted_Relieving_Pressure_Value__c,Converted_Vacuum_Relief_Req_Flow__c,Converted_Vacuum_Setting__c,Customer_Specified_Media_Name__c,CUTR_bkend__c,CU_TR__c,Diaphragm_Material__c,Discountable_Price__c,Document_IDs__c,Drilling__c,Dummy_Atex__c,Dummy_CUTR__c,Dummy_Flowing_Pressure_Units__c,Dummy_Flowing_Pressure__c,Dummy_PED__c,Dummy_Vacuum_Flowing_Pressure_Units__c,Dummy_Vacuum_Flowing_Pressure__c,EffMBP__c,EFFMop__c,Element_Material_Flag__c,Element_Material__c,Engineering_Notes__c,Engineering_Specials__c,Enter_Relieving_Pressure_Units__c,Enter_Relieving_Pressure_Value__c,Facing__c,Fastener_Material__c,Field_Test_Connection_Backend__c,Field_Test_Connection__c,Fillet_Weld_Liquid_Dye_Penetrant_Backend__c,Fillet_Weld_Liquid_Dye_Penetrant__c,Final_Assembly_Location_Requirements__c,Finish_Configuration_Flag__c,Flame_Arrester_Flag__c,Flame_Arrester_Option__c,Flow_Rate_Units__c,Gas_Group__c,Gas_List__c,Hydrotest__c,Intergranular_Corossion_Test_Backend__c,Intergranular_Corossion_Test__c,Is_flame_arrester_needed_with_your_valve__c,Lead_Time_Override__c,Lead_Time_Site_10__c,Lead_Time_Site_20__c,Lead_Time_Site_30__c,Lead_Time_Site_40__c,Liquid_Dye_Penetrant__c,List_Price_Each__c,Magnetic_Particle_Examination_Backend__c,Magnetic_Particle_Examination__c,Manual_Blowdown_Backend__c,Manual_Blowdown__c,Material_Sourcing_Requirements__c,Max_Process_Pressure_Unit__c,Max_Process_Pressure__c,Media_Name__c,Media_Type__c,Media__c,Method21_Leak_Detection_Backend__c,Method21_Leak_Detection__c,Model_name__c,Model_Size__c,Molecular_Weight__c,Nace_Backend__c,NACE__c,Non_Discountable_Price__c,OA01__c,OA02__c,OA03__c,OA04__c,OA05__c,OA06__c,OA__c,OB010__c,OB0100__c,OB0110__c,OB020__c,OB030__c,OB040__c,OB050__c,OB060__c,OB070__c,OB080__c,OB090__c,OB100__c,OB110__c,OB130__c,OB140__c,OB150__c,OB160__c,OB170__c,OB180__c,OB190__c,OB200__c,OB210__c,OB220__c,OB240__c,OB245__c,OB250__c,OB300__c,OB320__c,OB365__c,OB370__c,OB400__c,OB420__c,OB470__c,OB471__c,OB480__c,OB490__c,OB500__c,OB502__c,OB503__c,OB510__c,OB515__c,OB520__c,OB525__c,OB527__c,OB530__c,OB540__c,OB550__c,OB560__c,OB570__c,OB580__c,OB590__c,OB610__c,OB620__c,OB630__c,OB640__c,OB650__c,OB660__c,OB670__c,OB680__c,OB690__c,OB695__c,OB700__c,OB710__c,OB720__c,OB730__c,OB740__c,OB__c,Overpressure__c,OW050__c,OW060__c,OW070__c,OW071__c,OW072__c,OW110__c,OW111__c,OW130__c,OW910__c,OW920__c,OW__c,Painting_Coating_Option__c,Pallet_Fastener_Coating_Material__c,Pallet_Type__c,PARTREV__c,Part_Number_Base__c,Part_Number__c,PC020__c,PC025__c,PC040__c,PC045__c,PC050__c,PC055__c,PC080__c,PC081__c,PC__c,PED_2014_68_EU_CE_mark__c,PED_bkend__c,Pilot_Action_Flag__c,Pilot_Action__c,Pilot_Exhaust_Discharge_Header_Backend__c,Pilot_Exhaust_Piped_to_Discharge_Header__c,Pilot_Soft_Goods_Material__c,Pilot_Supply_Filter_Backend__c,Pilot_Supply_Filter__c,Pilot_Valves_option__c,Positive_Material_Identification__c,PosKDHigh__c,PosKDLow__c,PosKD__c,PosPresRatioHigh__c,PosPresRatioLow__c,PosSetPresOSIG__c,Pressure_Direction__c,Pressure_Pallet_Material__c,Pressure_Port_Proximity_Sensor_Backend__c,Pressure_Port_Proximity_Sensor__c,Pressure_Relief_Req_Flow_Rate__c,Pressure_Relief_Req_Flow_Units__c,Pressure_Relieving_Temperature_Units__c,Pressure_Relieving_Temperature__c,Pressure_Setting_Units__c,Pressure_Setting__c,Pressure_Units__c,Price_Engineer_Override__c,Quantity__c,Quote_Description_Engineer_Override__c,Quote_Line__c,Radiography__c,Ratio_of_Specific_Heats__c,Relief_Type__c,Remote_Sense_Backend__c,Remote_Sense__c,Schedule_BaseLead__c,Seat_Material__c,Section_A_Flag__c,Section_B_Flag__c,Section_C_Flag__c,Section_D_Flag__c,Section_E_Flag__c,Section_F_Flag__c,Section_G_Flag__c,Section_H_Flag__c,Section_I_Flag__c,Shell_Test_Valve_Body__c,Size_Preference__c,Size__c,Smallest__c,Split_Overpressure__c,Spring_Material__c,StdPosAirFlowSCFH__c,StdPosKd__c,StdPosPresRatio__c,StdVacAirFlowSCFH__c,StdVacKd__c,StdVacPresRatio__c,SteamJacket_Display_Flag__c,Steam_Jacket_Material__c,Temperature_Units__c,Type_of_model__c,Type_of_overpressure_valve__c,Ultrasonic_Examination_Backend__c,Ultrasonic_Examination__c,VacKDHigh__c,VacKDLow__c,VacPresRatioHigh__c,VacPresRatioLow__c,VacSetPresOSIG__c,Vacuum_Media__c,Vacuum_Pallet_Material__c,Vacuum_Port_Option__c,Vacuum_Port_Proximity_Sensor_Backend__c,Vacuum_Port_Proximity_Sensor__c,Vacuum_Relief_Required_Flow_Units__c,Vacuum_Relief_Req_Flow__c,Vacuum_Relief__c,Vacuum_Setting_Units__c,Vacuum_Setting__c,Visual_Casting_Examination_Backend__c,Visual_Casting_Examination__c,V_Compressibility_Factor__c,V_Converted_Relieving_Vacuum_Value__c,V_Converted_Vacuum_Relieving_Temperature__c,V_Customer_Specified_Media_Name__c,V_Enter_Relieving_Vacuum_units__c,V_Enter_Relieving_Vacuum_Value__c,V_Gas_List__c,V_Media_Name__c,V_Media__c,V_Molecular_Weight__c,V_Overpressure_Vacuum_Value__c,V_Ratio_of_Specific_Heats__c,V_Vacuum_Relieving_Temperature_Units__c,V_Vacuum_Relieving_Temperature__c,Weight_Material__c,Working_days_CDC__c,Working_days_GCI__c,Working_days_GP__c,Zone__c
        FROM Relief_Valve__c 
        WHERE ASSYPARTNO__c = 'V1220AFG06999T0A00001' limit 1];

        Relief_Valve__c conRV;
        if(!reliefValveList.isEmpty()){
            conRV = reliefValveList[0];
        }

        RV_PosSettingLimits__c posTestRecord = new RV_PosSettingLimits__c();
        posTestRecord.BackpressureLL__c = -5;
        posTestRecord.BackpressureUL__c = 5;
        posTestRecord.PalletDesign__c = 'FBGHastLow';
        posTestRecord.PalletMatlCode__c = '9';
        posTestRecord.PalletType__c = 'N';
        posTestRecord.PosProxSensorAvailable__c = 'N';
        posTestRecord.PTC__c = '1220A Fiberglass';
        posTestRecord.SettingLL__c = 1;
        posTestRecord.SettingUL__c = 4;
        posTestRecord.SpacerYN__c = 'N';
        posTestRecord.SZC__c = '06';
        posTestRecord.WeightMatlCode__c = 'RL';
        insert posTestRecord;
        
        RV_Cavity__c cav = new RV_Cavity__c();
        cav.CavityDiameter1__c = 0;
        cav.CavityDiameter2__c = 0;
        cav.CavityHeight1__c = 4.102;
        cav.CavityHeight2__c = 0;
        cav.Direction__c = 'Pos';
        cav.EffSealingDiameter__c = 6.095;
        cav.PTC__c = '1220A Fiberglass';
        cav.SpacerYN__c = 'N';
        cav.StemDiameter__c = 0;
        cav.SZC__c = '06';
        insert cav;
        
        RV_Valve_Attributes_Details__c rvdetail = new RV_Valve_Attributes_Details__c();
        rvdetail.Attribute__c = 'ASYTYP';
        rvdetail.NumVal1__c = 0;
        rvdetail.NumVal2__c = 0;
        rvdetail.NumVal3__c = 0;
        rvdetail.NumVal4__c = 0;
        rvdetail.Text1Val__c = '1220A Fiberglass';
        rvdetail.Text__c = 'PVRV';
        insert rvdetail;

        RVWeightDetermination WeightDetermination = new RVWeightDetermination(conRV);
        TestDataRVUtility.createRVMapData7();
        map<string,string> WeightMethod = WeightDetermination.getInitialWeightDetermination(conRV, TestDataRVUtility.mapWithRVValues7);
        WeightDetermination.cleanRVrecord(conRV);
        WeightDetermination.coverageBooster();
        Test.stopTest();
    }


}