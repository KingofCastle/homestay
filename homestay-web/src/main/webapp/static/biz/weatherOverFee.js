/**
 * 初始化省市区下拉选
 * @param pcdJsonList -- json对象  省市区（code,parent,child）
 * @param _province -- select的ID省
 * @param _city -- select的ID 地级市
 * @param _area -- select的ID 区县
 * @param defaultProvince -- 默认值 省
 * @param defaultCity -- 默认值 地级市
 * @param defaultArea -- 默认值 区县
 */
function provinceCityAddressInit(pcdJsonList, _province, _city, defaultProvince, defaultCity)
{
    var domProvince = document.getElementById(_province);
    var domCity = document.getElementById(_city);
    // var domArea = document.getElementById(_area);

    var emptyOption = new Object();
    emptyOption.parent="-请选择-";
    emptyOption.code="";
    emptyOption.child=[];

    //添加下拉选项
    function addOption(dom, data)
    {
        var option = document.createElement("OPTION");
        dom.options.add(option);
        option.innerHTML = data.parent;
        option.value = data.code;
        option.obj = data;
    }

    //默认值选择
    function defaultSelect(dom, code)
    {
        if(code != ""){
            for(var i=0; i<dom.options.length; i++)
            {
                if(dom.options[i].value == code || dom.options[i].innerHTML == code )
                {
                    dom.selectedIndex = i;
                    return;
                }
            }
        }
        dom.selectedIndex = 0;
    }

    function changeProvince()
    {
        if(domProvince.selectedIndex == -1)return;
        if(!domCity){return;}
        domCity.options.length = 0;
//        domCity.onchange = null;
        addOption(domCity,emptyOption);
        var item = domProvince.options[domProvince.selectedIndex].obj;
        for(var i=0; i<item.child.length; i++)
        {
            addOption(domCity, item.child[i]);
        }
        changeCity();
        // defaultSelect(domCity, defaultCity);
        domCity.onchange = changeCity;
    }
    function changeCity()
    {
        if(domCity.selectedIndex == -1)return;
        // if(!domArea){return;}
        // domArea.options.length = 0;
        // addOption(domArea,emptyOption);
        // var item = domCity.options[domCity.selectedIndex].obj;
        // for(var i=0; i<item.child.length; i++)
        // {
        //     addOption(domArea, item.child[i]);
        // }
        // defaultSelect(domArea, defaultArea);
    }

    addOption(domProvince,emptyOption);
    for(var i=0; i<pcdJsonList.length; i++)
    {
        addOption(domProvince, pcdJsonList[i]);
    }
    changeProvince();
    // defaultSelect(domProvince, defaultProvince);
    domProvince.onchange = changeProvince;
}