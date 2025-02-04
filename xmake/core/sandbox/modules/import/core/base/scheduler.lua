--!A cross-platform build utility based on Lua
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2019, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        scheduler.lua
--

-- define module
local sandbox_core_base_scheduler = sandbox_core_base_scheduler or {}

-- load modules
local scheduler = require("base/scheduler")
local raise     = require("sandbox/modules/raise")

-- start a new coroutine task 
function sandbox_core_base_scheduler.co_start(cotask, ...)
    local co, errors = scheduler:co_start(cotask, ...)
    if not co then
        raise(errors)
    end
    return co
end

-- start a new named coroutine task 
function sandbox_core_base_scheduler.co_start_named(coname, cotask, ...)
    local co, errors = scheduler:co_start_named(coname, cotask, ...)
    if not co then
        raise(errors)
    end
    return co
end

-- resume the given coroutine
function sandbox_core_base_scheduler.co_resume(co, ...)
    return scheduler:resume(co:thread(), ...)
end

-- suspend the current coroutine
function sandbox_core_base_scheduler.co_suspend(...)
    return scheduler:co_suspend(...)
end

-- get the current running coroutine 
function sandbox_core_base_scheduler.co_running()
    return scheduler:co_running()
end

-- get the all coroutine task count
function sandbox_core_base_scheduler.co_count()
    return scheduler:co_count()
end

-- sleep some times (ms)
function sandbox_core_base_scheduler.sleep(ms)
    local ok, errors = scheduler:sleep(ms)
    if not ok then
        raise(errors)
    end
end


-- stop loop
function sandbox_core_base_scheduler.stop()
    local ok, errors = scheduler:stop()
    if not ok then
        raise(errors)
    end
end

-- run loop
function sandbox_core_base_scheduler.runloop()
    local ok, errors = scheduler:runloop()
    if not ok then
        raise(errors)
    end
end

-- return module
return sandbox_core_base_scheduler
