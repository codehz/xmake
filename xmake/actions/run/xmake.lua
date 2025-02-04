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
-- @file        xmake.lua
--

-- define task
task("run")

    -- set category
    set_category("action")

    -- on run
    on_run("main")

    -- set menu
    set_menu {
                -- usage
                usage = "xmake run|r [options] [target] [arguments]"

                -- description
            ,   description = "Run the project target."

                -- xmake r
            ,   shortname = 'r'

                -- options
            ,   options = 
                {
                    {'d', "debug",      "k",   nil,          "Run and debug the given target."                                    }
                ,   {'a', "all",        "k",   nil,          "Run all targets."                                                   }
                ,   {'w', "workdir",    "kv",  nil,          "Work directory of running targets, default is folder of targetfile",
                                                             "e.g.",
                                                             "    --workdir=.",
                                                             "    --workdir=`pwd`"                                                }
                ,   {}
                ,   {nil, "target",     "v",   nil,          "Run the given target."                                              }
                ,   {nil, "arguments",  "vs",  nil,         "The target arguments"                                                }
                }
            }



