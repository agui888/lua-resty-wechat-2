-- Copyright (C) Shaobo Wan (Tinywan)

local cjson = require("cjson")
local http = require "resty.http"
local log = ngx.log
local err = ngx.ERR
local exit = ngx.exit
local ngx_var = ngx.var
local print = ngx.print
local redirect = ngx.redirect

local ok, new_tab = pcall(require, "table.new")
if not ok or type(new_tab) ~= "function" then
    new_tab = function(narr, nrec) return {} end
end


local _M = new_tab(0, 54)

_M._VERSION = '0.26'

local scope = "snsapi_userinfo"
local appid = 'wx94c43716d8a91f3f'

-- 获取access_token
function _M.get_access_token()
end

-- 拉取用户信息
function _M.get_user_info()

end

-- 入口文件
function _M.web_oauth()
    local redirect_uri = urlencode('http://wanwecaht.amai8.com/wechat/Index/getUserInfo');
    local url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" ..appid .."&redirect_uri="..redirect_uri .."&response_type=code&scope="..scope.."&state=1234#wechat_redirect";
    redirect('location:' .. url)
end