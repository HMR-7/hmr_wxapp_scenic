var mysql  = require('mysql');
var express = require('express')
var app = express()  
var fs = require('fs') 
var router = express.Router()
var conn = mysql.createConnection({
    multipleStatements: true
});

var conn = mysql.createConnection({     
  host     : 'localhost',       
  user     : 'root',              
  password : '123456',       
  port: '3306',                   
  database: 'tour' 
}); 
//连接数据库
conn.connect();


//查首页页面数据 start    
app.get('/', (req, res) => {
var  sql = 'SELECT * FROM detail';
conn.query(sql,function (err, result) {
if(err){console.log('[SELECT ERROR] - ',err.message);return;}
var dbPath = result;
//   console.log(result);
// console.log(req.query);
var page =req.query.page;
var limit = req.query.limit;
var qs=(page-1)*limit;
var hs=page*limit-1;
var allu=[];
for(var i=qs;i<=hs;i++){
    if(dbPath[i]==null){break;}
allu.push(dbPath[i]);}
res.send(allu); 
    });
});
//查首页页面数据 end

//详情页页面数据 start
app.get("/getSwiper", function (req, res) {
    let Sqldata = req.query;
    // console.log(Sqldata, '商品详情get获取的前端参数');
    // const sql = "SELECT swipeArr FROM detail where id =" + req.query.good_id + ""
    const sql = "select * from detail where id =" + req.query.good_id
    const sqlcollect = "SELECT iscollect from collect WHERE user_id=" + req.query.user_id + "  AND good_id=" + req.query.good_id
    var theRes = ""
    conn.query(sql, function (err, result) {
        let _res = JSON.stringify(result)
        let data = JSON.parse(_res)
        let swiperArr = data[0].swipeArr.split(",");
        let tags = data[0].tags.split(",");
        data[0].swipeArr = swiperArr;
        data[0].tags = tags;
        if (!Sqldata.user_id) {
            theRes = [data[0]]
            res.send(theRes)
            return
        } else if (Sqldata.user_id) {
            theRes = [data[0]]
        }
        // console.log(data[0], 'resultresult');
    })
    if (Sqldata.user_id) {
        conn.query(sqlcollect, function (err, result) {
            let _res = JSON.stringify(result)
            let data = JSON.parse(_res)
            if (data.length == 0) {
                data = [{
                    //不收藏为0 
                    iscollect: 0
                }];
            }
            theRes = [...theRes, ...data]
            // console.log(theRes, 'theRes222222');
            res.send(theRes)
        })
    }
});
//详情页页面数据 end

// 酒店推荐列表 start
app.get("/getHotelList", function (req, res) {
    let reData = req.query;
    // console.log(reData);
    const sql = 'select * from hotel where good_id=' + reData.good_id;
    conn.query(sql, function (err, result) {
        let _res = JSON.stringify(result)
        let data = JSON.parse(_res)
        res.send(data)
        return
    })
})
// 酒店推荐列表 end


// 食物推荐列表 start
app.get("/getFoodList", function (req, res) {
    let reData = req.query;
    const sql = 'select * from food';
    conn.query(sql, function (err, result) {
        var page =reData.page;
        var limit = reData.limit;
        var qs=(page-1)*limit;
        var hs=page*limit-1;
        var dbPath = result;
        var allu=[];
        for(var i=qs;i<=hs;i++){
            if(dbPath[i]==null){break;}
        allu.push(dbPath[i]);}
        // res.send(allu); 
        let _res = JSON.stringify(allu)
        let data = JSON.parse(_res)
        res.send(data)
    })
})
// 食物推荐列表 end

//获取搜索联想词 start
app.get("/getKeywords", function (req, res) {
    let reData = req.query;
    var a = [];
    console.log(reData, '前端参数');
    console.log(reData.class == 0);
    const sql = "SELECT good_name FROM detail where good_name like '%" + reData.keyword + "%' "
    const sql1 = "SELECT food_name as good_name FROM food where food_name like '%" + reData.keyword + "%' "
    const sql2 = "SELECT hotel_name as good_name FROM hotel where hotel_name like '%" + reData.keyword + "%' "
    if (reData.class == 1) {
        conn.query(sql, function (err, result) {
            let _res = JSON.stringify(result)
            let data = JSON.parse(_res)
            data.map(v => {
                v.class = 0;
            })
            res.send(data);
            return
        })
    } else {
        conn.query(sql, function (err, result) {
            let _res = JSON.stringify(result)
            let data = JSON.parse(_res)
            data.map(v => {
                v.class = 0;
            })
            a = [...data];
            console.log(a, 'resultresult1');
        })
        conn.query(sql1, function (err, result) {
            let _res = JSON.stringify(result)
            let data = JSON.parse(_res)
            data.map(v => {
                v.class = 1;
            })
            a = [...a, ...data];
            console.log(a, 'resultresult2');
        })
        conn.query(sql2, function (err, result) {
            let _res = JSON.stringify(result)
            let data = JSON.parse(_res)
            data.map(v => {
                v.class = 2;
            })
            a = [...a, ...data];
            console.log(a, 'resultresult3');
            res.send(a);
        })
    }


});

//获取搜索联想词 end

// 搜索页面关键词 start
app.get('/getKeyWordSearchList',function(req,res){
    let page = req.query.page;
    let limit = req.query.limit;
    let keyword = req.query.keyword;
    const sql = "select * from detail where good_name like '%" + keyword + "%'";
    // const sql = "SELECT * FROM detail where good_name like '%" + reData.keyword + "%' limit " + limit + "," + reData.limit;
    conn.query(sql, function (err, result) {
        // console.log(result);
        var qs=(page-1)*limit;
        var hs=page*limit-1;
        var dbPath = result;
        var allu=[];
        for(var i=qs;i<=hs;i++){
            if(dbPath[i]==null){break;}
        allu.push(dbPath[i]);}
        // res.send(allu); 
        let _res = JSON.stringify(allu)
        let data = JSON.parse(_res)
        res.send(data)
    })
})
// 搜索页面关键词 start

//用户注册发送验证码 start
app.get('/getyzm',function(req,res){
    // console.log(req.query);
    // 随机生成4位数字
    function rand(min, max) {
        return Math.floor(Math.random() * (max - min)) + min
    }
    validatePhoneCode = [];
    let sendCodeP = (phone) => {
        for (var item of validatePhoneCode) {
            if (phone == item.phone) {
                return true
            }
        }
        return false
    }
   
    // 模拟验证码发送接口
    let phone = req.query.phone;
    // console.log(req.query);
    if (sendCodeP(phone)) {
        res.send({
            'code': 400,
            'msg': '已经发送过验证码，稍后再试'
        })
    }else{
       let code = rand(1000, 9999);
    validatePhoneCode.push({
        'phone': parseInt(phone),
        'code': code
    })
    // console.log(validatePhoneCode);
    res.send({
        'code': 200,
        'msg': '发送成功',
        'js_code':code,
        'validate':validatePhoneCode
    })
    // console.log(code); 
    }
    
    
})
//用户注册发送验证码 end

//用户获取openid start
// app.get('/getOpenId',function(req,res){

// })
//用户获取openid  end

//新用户信息存入 start
app.get('/getUserInsert',function(req,res){
    console.log(req.query);
    let nickname =req.query.nickname;
    let phone = req.query.userPhone;
    sql='insert into userinfo(nickName,userPhone) values(?,?)';
    conn.query(sql, [nickname,phone], function (err, result) {
        if(err){
            console.log(err);
            res.send({
                msg: "注册失败!!",
                flag: 'no'
            });
                }
    });

})

//新用户信息存入 end

// 添加、移除用户收藏 start
app.post("/userCollect", function (req, res) {
    var data = "";
    req.on('data', function (chunk) {
        data += chunk;
    })
    req.on('end', function () {
        data = JSON.parse(data)
        console.log(data, 'post请求接受前端传递的参数');
        if (!data.user_id) {
            return
        }
        // let data = JSON.parse(_res)
        const sqlcollect = "SELECT iscollect from collect WHERE user_id='" + data.user_id + "'  AND good_id=" + data.good_id
        conn.query(sqlcollect, function (err, result) {
            // console.log(result, '------');
            let _res = JSON.stringify(result)
            let _data = JSON.parse(_res)
            if (_data.length == 0) {
                const sqlinsert = "insert into  collect (user_id,good_id,iscollect) values (" + data.user_id + "," + data.good_id + ",1)"
                conn.query(sqlinsert, function (err, result) {
                    if (err) {
                        console.log(err);
                        res.send({
                            msg: "操作失败",
                            flag: 'no'
                        });
                    } else {
                        res.send({
                            msg: "添加收藏成功",
                            flag: 'yes'
                        });
                    }
                })
            } else {
                let [{
                    iscollect
                }] = _data;
                // console.log({
                //     iscollect
                // }, '111111111111');
                // console.log(iscollect, '22222222222222');
                if (iscollect == 0) {
                    const sql = "UPDATE collect SET iscollect = '1' WHERE user_id=" + data.user_id + " AND good_id=" + data.good_id
                    conn.query(sql, function (err, result) {
                        if (err) {
                            console.log(err);
                            res.send({
                                msg: "操作失败",
                                flag: 'no'
                            });
                        } else {
                            res.send({
                                msg: "添加收藏成功",
                                flag: 'yes'
                            });
                        }
                    })
                } else if (iscollect == 1) {
                    const sql = "UPDATE collect SET iscollect = '0' WHERE user_id=" + data.user_id + " AND good_id=" + data.good_id
                    conn.query(sql, function (err, result) {
                        if (err) {
                            console.log(err);
                            res.send({
                                msg: "操作失败",
                                flag: 'no'
                            });
                        } else {
                            res.send({
                                msg: "取消收藏成功",
                                flag: 'yes'
                            });
                        }
                    })
                }
            }
        })
    })
})
// 添加、移除用户收藏 end

// 查看用户收藏信息 start
app.get("/getCollectList", function (req, res) {
    let reData = req.query;
    let limit = Number(reData.page - 1) * Number(reData.limit);
    console.log(req.query, 'get请求前端传递到后端的参数')
    const selcollectsql = "SELECT good_id FROM collect where user_id =" + reData.user_id + " and iscollect = 1 limit " + limit + "," + reData.limit
    console.log(selcollectsql, '--------------------------------')
    conn.query(selcollectsql, function (err, result) {
        let _res = JSON.stringify(result)
        let data = JSON.parse(_res)
        console.log(data, '查询出来的数据');
        if (data.length == 0) {
            res.send(data)
            return
        }
        var dataArr = [];
        var i = 0;
        (function run() {
            const seldetailsql = "SELECT * FROM detail where id =" + data[i].good_id
            conn.query(seldetailsql, function (err, result) {
                let _res = JSON.stringify(result)
                let _data = JSON.parse(_res)
                dataArr.push(_data[0])
                console.log(_data, '循环中的查找数据');
                if (i <= data.length) {
                    i++;
                    if (i == data.length) {
                        console.log(dataArr, '循环完毕');
                        res.send(dataArr)
                    } else {
                        run();
                    }

                }
            })
        }())
    })

})
// 查看用户收藏信息 end

//添加用户足迹表 start
app.post("/userFooter", function (req, res) {
    var data = "";
    req.on('data', function (chunk) {
        data += chunk;
    })
    req.on('end', function () {
        data = JSON.parse(data);
        console.log(data, '足迹列表post请求接受前端传递的参数');
        if (!data.user_id) {
            return;
        }
        const selectsql = "select id from footer where user_id=" + data.user_id + " and good_id = " + data.good_id;
        conn.query(selectsql, function (err, result) {
            /* 去除RowData */
            let _res = JSON.stringify(result)
            let _data = JSON.parse(_res)
            console.log(_data, '足迹表内容');
            /* 向上取整，将ms转换为m,存储在足迹表中 */
            let nowtime = Math.floor(new Date().getTime() / 1000);
            console.log(nowtime, 'time');

            if (_data.length == 0) {
                const insertsql = "insert into footer(user_id,good_id,time) values(" + data.user_id + "," + data.good_id + "," + nowtime + ")"
                conn.query(insertsql, function (err, result) {
                    if (err) {
                        res.send({
                            msg: "足迹添加失败"
                        })
                    } else {
                        res.send({
                            msg: "足迹添加成功"
                        })
                    }
                })
            } else if (_data.length != 0) {
                let [{
                    id
                }] = _data;
                console.log(id);

                let nowtime = Math.floor(new Date().getTime() / 1000);
                const updatesql = "update footer set time = " + nowtime + " where id=" + id
                console.log(updatesql);

                conn.query(updatesql, function (err, result) {
                    if (err) {
                        res.send({
                            msg: "足迹时间戳更改失败"
                        })
                    } else {
                        res.send({
                            msg: "足迹时间戳更改成功"
                        })
                    }
                })
            }

        })

    })
})

//添加用户足迹表 end

//查询用户足迹表 start
app.get("/getFooterList", function (req, res) {
    let reData = req.query;
    if (!reData.user_id) {
        return
    }
    let limit = Number(reData.page - 1) * Number(reData.limit);
    // console.log(req.query, 'get请求前端传递到后端的参数')
    const selcollectsql = "SELECT good_id FROM footer where user_id =" + reData.user_id + " order by time desc" + " limit " + limit + "," + reData.limit
    // console.log(selcollectsql, '--------------------------------')
    conn.query(selcollectsql, function (err, result) {
        let _res = JSON.stringify(result)
        let data = JSON.parse(_res)
        // console.log(data, '查询出来的数据');
        if (data.length == 0) {
            res.send(data)
            return
        }
        var dataArr = [];
        var i = 0;
        (function run() {
            const seldetailsql = "SELECT * FROM detail where id =" + data[i].good_id
            conn.query(seldetailsql, function (err, result) {
                let _res = JSON.stringify(result)
                let _data = JSON.parse(_res)
                dataArr.push(_data[0])
                // console.log(_data, '循环中的查找数据');
                if (i <= data.length) {
                    i++;
                    if (i == data.length) {
                        // console.log(dataArr, '循环完毕');
                        res.send(dataArr)
                    } else {
                        run();
                    }

                }
            })
        }())
    })
})
//查询用户足迹表 end
 
//获取用户userId start
app.get('/getUserId',function(req,res){
    phone=req.query.userPhone
    console.log(phone);
    const sql = "SELECT id FROM userinfo where userPhone=" + phone
    conn.query(sql, function (err, result) {
        if(err){
            console.log(err);
        }
        if(result){
            res.send(result);
        }
    })
})
//获取用户userId start

//用户上传日志 start
app.post("/submitFeedback", function (req, res) {
    var data = "";
    req.on('data', function (chunk) {
        data += chunk;
    })
    req.on('end', function () {
        data = JSON.parse(data)
        console.log(data, 'post请求接受前端传递的参数');
        let nowtime = Math.floor(new Date().getTime() / 1000);

        const insertsql = 'insert into travellog(good_id,user_id,user_head,user_name,article,time) values(?,?,?,?,?,?)';
        conn.query(insertsql, [data.good_id, data.user_id, data.user_head, data.user_name, data.article, nowtime], function (err) {
            if (err) {
                console.log(err);
                res.send({
                    msg: "发布失败!!",
                    flag: 'no'
                });
            } else {
                res.send({
                    msg: "发布成功",
                    flag: 'yes'
                });
            }
        })
        return
    })

})
//用户上传日志 end

// 获取用户日志 start
app.get("/getTravelLog", function (req, res) {
    let reData = req.query;
    console.log(reData, '获取日志参数');
    let limit = Number(reData.page - 1) * Number(reData.limit);
    const sql = "SELECT * FROM travellog where good_id=" + reData.good_id + " order by time desc  limit " + limit + "," + reData.limit + ""
    // const sql = "select * from travellog order by time desc"
    var allobj = {}
        conn.query(sql, function (err, result) {
        let _res = JSON.stringify(result)
        let data = JSON.parse(_res)
        allobj.log = data;
        // res.send(data)
    })
    const selAllLogsql = "SELECT * FROM travellog  where good_id=" + reData.good_id
    conn.query(selAllLogsql, function (err, result) {
        let _res = JSON.stringify(result)
        let data = JSON.parse(_res)
        allobj.length = data.length;
        res.send(allobj)
    })
    
    
    

})
//获取用户日志 end

// 写日志时，搜索按钮的点击事件查询 start
app.get("/getSearchResult", function (req, res) {
    let Sqldata = req.query;
    console.log(Sqldata, 'get获取的前端参数');
    const sql = "select * from detail where good_name like '%" + Sqldata.good_name + "%'"
    conn.query(sql, function (err, result) {
        let _res = JSON.stringify(result)
        let data = JSON.parse(_res)
        data.forEach((v, i, arr) => {
            arr[i].swipeArr = arr[i].swipeArr.split(",");
        });
        console.log(data, 'data');
        res.send(
            data
        );
    })
})
// 写日志时，搜索按钮的点击事件查询 end

// 写日志时，获取景区联想词 start
app.get("/getScenicwords", function (req, res) {
    let reData = req.query;
    const sql = "SELECT good_name FROM detail where good_name like '%" + reData.keyword + "%' "
    conn.query(sql, function (err, result) {
        let _res = JSON.stringify(result)
        let data = JSON.parse(_res)
        a = [...data];
        console.log(a, 'resultresult1');
        res.send(a);
    })


});
// 写日志时，获取景区联想词 end



// connection.end();




app.listen(8002, () => {
    console.log("服务已经启动，8000端口监听中……");
});

 






console.log("http://127.0.0.1:8002")