{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "3263de4e",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:41.244529Z",
     "iopub.status.busy": "2023-03-03T12:39:41.240416Z",
     "iopub.status.idle": "2023-03-03T12:39:45.438956Z",
     "shell.execute_reply": "2023-03-03T12:39:45.436092Z"
    },
    "papermill": {
     "duration": 4.211761,
     "end_time": "2023-03-03T12:39:45.442817",
     "exception": false,
     "start_time": "2023-03-03T12:39:41.231056",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n",
      "Loading required package: rpart\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [],
      "text/latex": [],
      "text/markdown": [],
      "text/plain": [
       "integer(0)"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>49</li><li>282</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 49\n",
       "\\item 282\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 49\n",
       "2. 282\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1]  49 282"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 301 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>X</th><th scope=col>age</th><th scope=col>sex</th><th scope=col>cp</th><th scope=col>trestbps</th><th scope=col>chol</th><th scope=col>fbs</th><th scope=col>restecg</th><th scope=col>thalach</th><th scope=col>exang</th><th scope=col>oldpeak</th><th scope=col>slope</th><th scope=col>ca</th><th scope=col>thal</th><th scope=col>target</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td> 1</td><td>63</td><td>1</td><td>3</td><td>145</td><td>233</td><td>1</td><td>0</td><td>150</td><td>0</td><td>2.3</td><td>0</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>2</th><td> 2</td><td>67</td><td>1</td><td>2</td><td>160</td><td>286</td><td>0</td><td>1</td><td>108</td><td>1</td><td>1.5</td><td>0</td><td>3</td><td>2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td> 3</td><td>67</td><td>1</td><td>1</td><td>120</td><td>229</td><td>0</td><td>0</td><td>129</td><td>1</td><td>2.6</td><td>2</td><td>2</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>4</th><td> 4</td><td>37</td><td>1</td><td>1</td><td>130</td><td>250</td><td>0</td><td>1</td><td>187</td><td>0</td><td>3.5</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td> 5</td><td>41</td><td>0</td><td>0</td><td>130</td><td>204</td><td>0</td><td>1</td><td>172</td><td>0</td><td>1.4</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>6</th><td> 6</td><td>56</td><td>1</td><td>0</td><td>120</td><td>236</td><td>0</td><td>1</td><td>178</td><td>0</td><td>0.8</td><td>1</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>7</th><td> 7</td><td>62</td><td>0</td><td>1</td><td>140</td><td>268</td><td>0</td><td>0</td><td>160</td><td>0</td><td>3.6</td><td>1</td><td>2</td><td>2</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>8</th><td> 8</td><td>57</td><td>0</td><td>1</td><td>120</td><td>354</td><td>0</td><td>1</td><td>163</td><td>1</td><td>0.6</td><td>2</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>9</th><td> 9</td><td>63</td><td>1</td><td>2</td><td>130</td><td>254</td><td>0</td><td>1</td><td>147</td><td>0</td><td>1.4</td><td>2</td><td>1</td><td>3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>10</td><td>53</td><td>1</td><td>2</td><td>140</td><td>203</td><td>1</td><td>1</td><td>155</td><td>1</td><td>3.1</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>11</th><td>11</td><td>57</td><td>1</td><td>0</td><td>140</td><td>192</td><td>0</td><td>1</td><td>148</td><td>0</td><td>0.4</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>12</td><td>56</td><td>0</td><td>2</td><td>140</td><td>294</td><td>0</td><td>1</td><td>153</td><td>0</td><td>1.3</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>13</th><td>13</td><td>56</td><td>1</td><td>1</td><td>130</td><td>256</td><td>1</td><td>1</td><td>142</td><td>1</td><td>0.6</td><td>2</td><td>1</td><td>2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>14</th><td>14</td><td>44</td><td>1</td><td>3</td><td>120</td><td>263</td><td>0</td><td>0</td><td>173</td><td>0</td><td>0.0</td><td>1</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>15</th><td>15</td><td>52</td><td>1</td><td>3</td><td>172</td><td>199</td><td>1</td><td>0</td><td>162</td><td>0</td><td>0.5</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>16</th><td>16</td><td>57</td><td>1</td><td>2</td><td>150</td><td>168</td><td>0</td><td>1</td><td>174</td><td>0</td><td>1.6</td><td>1</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>17</th><td>17</td><td>48</td><td>1</td><td>2</td><td>110</td><td>229</td><td>0</td><td>1</td><td>168</td><td>0</td><td>1.0</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>18</th><td>18</td><td>54</td><td>1</td><td>3</td><td>140</td><td>239</td><td>0</td><td>1</td><td>160</td><td>0</td><td>1.2</td><td>0</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>19</th><td>19</td><td>48</td><td>0</td><td>0</td><td>130</td><td>275</td><td>0</td><td>1</td><td>139</td><td>0</td><td>0.2</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>20</th><td>20</td><td>49</td><td>1</td><td>3</td><td>130</td><td>266</td><td>0</td><td>1</td><td>171</td><td>0</td><td>0.6</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>21</th><td>21</td><td>64</td><td>1</td><td>0</td><td>110</td><td>211</td><td>0</td><td>1</td><td>144</td><td>1</td><td>1.8</td><td>1</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>22</th><td>22</td><td>58</td><td>0</td><td>2</td><td>150</td><td>283</td><td>1</td><td>1</td><td>162</td><td>0</td><td>1.0</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>23</th><td>23</td><td>58</td><td>1</td><td>0</td><td>120</td><td>284</td><td>0</td><td>1</td><td>160</td><td>0</td><td>1.8</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>24</th><td>24</td><td>58</td><td>1</td><td>2</td><td>132</td><td>224</td><td>0</td><td>1</td><td>173</td><td>0</td><td>3.2</td><td>1</td><td>2</td><td>2</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>25</th><td>25</td><td>60</td><td>1</td><td>3</td><td>130</td><td>206</td><td>0</td><td>1</td><td>132</td><td>1</td><td>2.4</td><td>2</td><td>2</td><td>3</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>26</th><td>26</td><td>50</td><td>0</td><td>1</td><td>120</td><td>219</td><td>0</td><td>1</td><td>158</td><td>0</td><td>1.6</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>27</th><td>27</td><td>58</td><td>0</td><td>2</td><td>120</td><td>340</td><td>0</td><td>1</td><td>172</td><td>0</td><td>0.0</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>28</th><td>28</td><td>66</td><td>0</td><td>2</td><td>150</td><td>226</td><td>0</td><td>1</td><td>114</td><td>0</td><td>2.6</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>29</th><td>29</td><td>43</td><td>1</td><td>2</td><td>150</td><td>247</td><td>0</td><td>0</td><td>171</td><td>0</td><td>1.5</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>30</th><td>30</td><td>40</td><td>1</td><td>2</td><td>110</td><td>167</td><td>0</td><td>0</td><td>114</td><td>1</td><td>2.0</td><td>0</td><td>0</td><td>2</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>⋮</th><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><th scope=row>273</th><td>273</td><td>46</td><td>1</td><td>0</td><td>140</td><td>311</td><td>0</td><td>1</td><td>120</td><td>1</td><td>1.8</td><td>1</td><td>2</td><td>2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>274</th><td>274</td><td>71</td><td>0</td><td>0</td><td>112</td><td>149</td><td>0</td><td>1</td><td>125</td><td>0</td><td>1.6</td><td>2</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>275</th><td>275</td><td>59</td><td>1</td><td>0</td><td>134</td><td>204</td><td>0</td><td>0</td><td>162</td><td>0</td><td>0.8</td><td>1</td><td>2</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>276</th><td>276</td><td>64</td><td>1</td><td>0</td><td>170</td><td>227</td><td>0</td><td>1</td><td>155</td><td>0</td><td>0.6</td><td>2</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>277</th><td>277</td><td>66</td><td>0</td><td>0</td><td>146</td><td>278</td><td>0</td><td>1</td><td>152</td><td>0</td><td>0.0</td><td>1</td><td>1</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>278</th><td>278</td><td>39</td><td>0</td><td>1</td><td>138</td><td>220</td><td>0</td><td>1</td><td>152</td><td>0</td><td>0.0</td><td>2</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>279</th><td>279</td><td>57</td><td>1</td><td>1</td><td>154</td><td>232</td><td>0</td><td>0</td><td>164</td><td>0</td><td>0.0</td><td>2</td><td>1</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>280</th><td>280</td><td>58</td><td>0</td><td>0</td><td>130</td><td>197</td><td>0</td><td>0</td><td>131</td><td>0</td><td>0.6</td><td>1</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>281</th><td>281</td><td>57</td><td>1</td><td>0</td><td>110</td><td>335</td><td>0</td><td>1</td><td>143</td><td>1</td><td>3.0</td><td>1</td><td>1</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>283</th><td>283</td><td>55</td><td>0</td><td>2</td><td>128</td><td>205</td><td>0</td><td>1</td><td>130</td><td>1</td><td>2.0</td><td>1</td><td>1</td><td>1</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>284</th><td>284</td><td>35</td><td>1</td><td>0</td><td>122</td><td>192</td><td>0</td><td>1</td><td>174</td><td>0</td><td>0.0</td><td>2</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>285</th><td>285</td><td>61</td><td>1</td><td>0</td><td>148</td><td>203</td><td>0</td><td>0</td><td>161</td><td>0</td><td>0.0</td><td>2</td><td>1</td><td>3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>286</th><td>286</td><td>58</td><td>1</td><td>0</td><td>114</td><td>318</td><td>0</td><td>1</td><td>140</td><td>0</td><td>4.4</td><td>1</td><td>3</td><td>3</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>287</th><td>287</td><td>58</td><td>0</td><td>3</td><td>170</td><td>225</td><td>1</td><td>1</td><td>146</td><td>1</td><td>2.8</td><td>2</td><td>2</td><td>2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>288</th><td>288</td><td>58</td><td>1</td><td>1</td><td>125</td><td>220</td><td>0</td><td>0</td><td>144</td><td>0</td><td>0.4</td><td>2</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>289</th><td>289</td><td>56</td><td>1</td><td>0</td><td>130</td><td>221</td><td>0</td><td>1</td><td>163</td><td>0</td><td>0.0</td><td>1</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>290</th><td>290</td><td>56</td><td>1</td><td>0</td><td>120</td><td>240</td><td>0</td><td>2</td><td>169</td><td>0</td><td>0.0</td><td>1</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>291</th><td>291</td><td>67</td><td>1</td><td>0</td><td>152</td><td>212</td><td>0</td><td>1</td><td>150</td><td>0</td><td>0.8</td><td>2</td><td>0</td><td>3</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>292</th><td>292</td><td>55</td><td>0</td><td>0</td><td>132</td><td>342</td><td>0</td><td>2</td><td>166</td><td>0</td><td>1.2</td><td>0</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>293</th><td>293</td><td>44</td><td>1</td><td>0</td><td>120</td><td>169</td><td>0</td><td>0</td><td>144</td><td>1</td><td>2.8</td><td>1</td><td>0</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>294</th><td>294</td><td>63</td><td>1</td><td>2</td><td>140</td><td>187</td><td>0</td><td>0</td><td>144</td><td>1</td><td>4.0</td><td>1</td><td>2</td><td>3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>295</th><td>295</td><td>63</td><td>0</td><td>0</td><td>124</td><td>197</td><td>0</td><td>1</td><td>136</td><td>1</td><td>0.0</td><td>0</td><td>0</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>296</th><td>296</td><td>41</td><td>1</td><td>0</td><td>120</td><td>157</td><td>0</td><td>0</td><td>182</td><td>0</td><td>0.0</td><td>2</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>297</th><td>297</td><td>59</td><td>1</td><td>0</td><td>164</td><td>176</td><td>1</td><td>1</td><td> 90</td><td>0</td><td>1.0</td><td>1</td><td>2</td><td>2</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>298</th><td>298</td><td>57</td><td>0</td><td>0</td><td>140</td><td>241</td><td>0</td><td>0</td><td>123</td><td>1</td><td>0.2</td><td>1</td><td>0</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>299</th><td>299</td><td>45</td><td>1</td><td>0</td><td>110</td><td>264</td><td>0</td><td>1</td><td>132</td><td>0</td><td>1.2</td><td>1</td><td>0</td><td>3</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>300</th><td>300</td><td>68</td><td>1</td><td>3</td><td>144</td><td>193</td><td>1</td><td>1</td><td>141</td><td>0</td><td>3.4</td><td>1</td><td>2</td><td>3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>301</th><td>301</td><td>57</td><td>1</td><td>0</td><td>130</td><td>131</td><td>0</td><td>1</td><td>115</td><td>1</td><td>1.2</td><td>1</td><td>1</td><td>3</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>302</th><td>302</td><td>57</td><td>0</td><td>0</td><td>130</td><td>236</td><td>0</td><td>1</td><td>174</td><td>0</td><td>0.0</td><td>1</td><td>1</td><td>3</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>303</th><td>303</td><td>38</td><td>1</td><td>1</td><td>138</td><td>175</td><td>0</td><td>0</td><td>173</td><td>0</td><td>0.0</td><td>1</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 301 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & X & age & sex & cp & trestbps & chol & fbs & restecg & thalach & exang & oldpeak & slope & ca & thal & target\\\\\n",
       "  & <int> & <int> & <fct> & <fct> & <int> & <int> & <fct> & <fct> & <int> & <fct> & <dbl> & <fct> & <int> & <fct> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 &  1 & 63 & 1 & 3 & 145 & 233 & 1 & 0 & 150 & 0 & 2.3 & 0 & 0 & 1 & 0\\\\\n",
       "\t2 &  2 & 67 & 1 & 2 & 160 & 286 & 0 & 1 & 108 & 1 & 1.5 & 0 & 3 & 2 & 2\\\\\n",
       "\t3 &  3 & 67 & 1 & 1 & 120 & 229 & 0 & 0 & 129 & 1 & 2.6 & 2 & 2 & 2 & 1\\\\\n",
       "\t4 &  4 & 37 & 1 & 1 & 130 & 250 & 0 & 1 & 187 & 0 & 3.5 & 2 & 0 & 2 & 0\\\\\n",
       "\t5 &  5 & 41 & 0 & 0 & 130 & 204 & 0 & 1 & 172 & 0 & 1.4 & 2 & 0 & 2 & 0\\\\\n",
       "\t6 &  6 & 56 & 1 & 0 & 120 & 236 & 0 & 1 & 178 & 0 & 0.8 & 1 & 0 & 1 & 0\\\\\n",
       "\t7 &  7 & 62 & 0 & 1 & 140 & 268 & 0 & 0 & 160 & 0 & 3.6 & 1 & 2 & 2 & 3\\\\\n",
       "\t8 &  8 & 57 & 0 & 1 & 120 & 354 & 0 & 1 & 163 & 1 & 0.6 & 2 & 0 & 3 & 0\\\\\n",
       "\t9 &  9 & 63 & 1 & 2 & 130 & 254 & 0 & 1 & 147 & 0 & 1.4 & 2 & 1 & 3 & 2\\\\\n",
       "\t10 & 10 & 53 & 1 & 2 & 140 & 203 & 1 & 1 & 155 & 1 & 3.1 & 2 & 0 & 2 & 1\\\\\n",
       "\t11 & 11 & 57 & 1 & 0 & 140 & 192 & 0 & 1 & 148 & 0 & 0.4 & 2 & 0 & 2 & 0\\\\\n",
       "\t12 & 12 & 56 & 0 & 2 & 140 & 294 & 0 & 1 & 153 & 0 & 1.3 & 2 & 0 & 2 & 0\\\\\n",
       "\t13 & 13 & 56 & 1 & 1 & 130 & 256 & 1 & 1 & 142 & 1 & 0.6 & 2 & 1 & 2 & 2\\\\\n",
       "\t14 & 14 & 44 & 1 & 3 & 120 & 263 & 0 & 0 & 173 & 0 & 0.0 & 1 & 0 & 2 & 0\\\\\n",
       "\t15 & 15 & 52 & 1 & 3 & 172 & 199 & 1 & 0 & 162 & 0 & 0.5 & 2 & 0 & 2 & 0\\\\\n",
       "\t16 & 16 & 57 & 1 & 2 & 150 & 168 & 0 & 1 & 174 & 0 & 1.6 & 1 & 0 & 2 & 0\\\\\n",
       "\t17 & 17 & 48 & 1 & 2 & 110 & 229 & 0 & 1 & 168 & 0 & 1.0 & 2 & 0 & 2 & 1\\\\\n",
       "\t18 & 18 & 54 & 1 & 3 & 140 & 239 & 0 & 1 & 160 & 0 & 1.2 & 0 & 0 & 2 & 0\\\\\n",
       "\t19 & 19 & 48 & 0 & 0 & 130 & 275 & 0 & 1 & 139 & 0 & 0.2 & 2 & 0 & 2 & 0\\\\\n",
       "\t20 & 20 & 49 & 1 & 3 & 130 & 266 & 0 & 1 & 171 & 0 & 0.6 & 2 & 0 & 2 & 0\\\\\n",
       "\t21 & 21 & 64 & 1 & 0 & 110 & 211 & 0 & 1 & 144 & 1 & 1.8 & 1 & 0 & 3 & 0\\\\\n",
       "\t22 & 22 & 58 & 0 & 2 & 150 & 283 & 1 & 1 & 162 & 0 & 1.0 & 2 & 0 & 2 & 0\\\\\n",
       "\t23 & 23 & 58 & 1 & 0 & 120 & 284 & 0 & 1 & 160 & 0 & 1.8 & 2 & 0 & 2 & 1\\\\\n",
       "\t24 & 24 & 58 & 1 & 2 & 132 & 224 & 0 & 1 & 173 & 0 & 3.2 & 1 & 2 & 2 & 3\\\\\n",
       "\t25 & 25 & 60 & 1 & 3 & 130 & 206 & 0 & 1 & 132 & 1 & 2.4 & 2 & 2 & 3 & 4\\\\\n",
       "\t26 & 26 & 50 & 0 & 1 & 120 & 219 & 0 & 1 & 158 & 0 & 1.6 & 2 & 0 & 2 & 0\\\\\n",
       "\t27 & 27 & 58 & 0 & 2 & 120 & 340 & 0 & 1 & 172 & 0 & 0.0 & 2 & 0 & 2 & 0\\\\\n",
       "\t28 & 28 & 66 & 0 & 2 & 150 & 226 & 0 & 1 & 114 & 0 & 2.6 & 2 & 0 & 2 & 0\\\\\n",
       "\t29 & 29 & 43 & 1 & 2 & 150 & 247 & 0 & 0 & 171 & 0 & 1.5 & 2 & 0 & 2 & 0\\\\\n",
       "\t30 & 30 & 40 & 1 & 2 & 110 & 167 & 0 & 0 & 114 & 1 & 2.0 & 0 & 0 & 2 & 3\\\\\n",
       "\t⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t273 & 273 & 46 & 1 & 0 & 140 & 311 & 0 & 1 & 120 & 1 & 1.8 & 1 & 2 & 2 & 2\\\\\n",
       "\t274 & 274 & 71 & 0 & 0 & 112 & 149 & 0 & 1 & 125 & 0 & 1.6 & 2 & 0 & 3 & 0\\\\\n",
       "\t275 & 275 & 59 & 1 & 0 & 134 & 204 & 0 & 0 & 162 & 0 & 0.8 & 1 & 2 & 2 & 1\\\\\n",
       "\t276 & 276 & 64 & 1 & 0 & 170 & 227 & 0 & 1 & 155 & 0 & 0.6 & 2 & 0 & 3 & 0\\\\\n",
       "\t277 & 277 & 66 & 0 & 0 & 146 & 278 & 0 & 1 & 152 & 0 & 0.0 & 1 & 1 & 3 & 0\\\\\n",
       "\t278 & 278 & 39 & 0 & 1 & 138 & 220 & 0 & 1 & 152 & 0 & 0.0 & 2 & 0 & 3 & 0\\\\\n",
       "\t279 & 279 & 57 & 1 & 1 & 154 & 232 & 0 & 0 & 164 & 0 & 0.0 & 2 & 1 & 2 & 1\\\\\n",
       "\t280 & 280 & 58 & 0 & 0 & 130 & 197 & 0 & 0 & 131 & 0 & 0.6 & 1 & 0 & 2 & 0\\\\\n",
       "\t281 & 281 & 57 & 1 & 0 & 110 & 335 & 0 & 1 & 143 & 1 & 3.0 & 1 & 1 & 1 & 2\\\\\n",
       "\t283 & 283 & 55 & 0 & 2 & 128 & 205 & 0 & 1 & 130 & 1 & 2.0 & 1 & 1 & 1 & 3\\\\\n",
       "\t284 & 284 & 35 & 1 & 0 & 122 & 192 & 0 & 1 & 174 & 0 & 0.0 & 2 & 0 & 3 & 0\\\\\n",
       "\t285 & 285 & 61 & 1 & 0 & 148 & 203 & 0 & 0 & 161 & 0 & 0.0 & 2 & 1 & 3 & 2\\\\\n",
       "\t286 & 286 & 58 & 1 & 0 & 114 & 318 & 0 & 1 & 140 & 0 & 4.4 & 1 & 3 & 3 & 4\\\\\n",
       "\t287 & 287 & 58 & 0 & 3 & 170 & 225 & 1 & 1 & 146 & 1 & 2.8 & 2 & 2 & 2 & 2\\\\\n",
       "\t288 & 288 & 58 & 1 & 1 & 125 & 220 & 0 & 0 & 144 & 0 & 0.4 & 2 & 0 & 2 & 0\\\\\n",
       "\t289 & 289 & 56 & 1 & 0 & 130 & 221 & 0 & 1 & 163 & 0 & 0.0 & 1 & 0 & 3 & 0\\\\\n",
       "\t290 & 290 & 56 & 1 & 0 & 120 & 240 & 0 & 2 & 169 & 0 & 0.0 & 1 & 0 & 3 & 0\\\\\n",
       "\t291 & 291 & 67 & 1 & 0 & 152 & 212 & 0 & 1 & 150 & 0 & 0.8 & 2 & 0 & 3 & 1\\\\\n",
       "\t292 & 292 & 55 & 0 & 0 & 132 & 342 & 0 & 2 & 166 & 0 & 1.2 & 0 & 0 & 1 & 0\\\\\n",
       "\t293 & 293 & 44 & 1 & 0 & 120 & 169 & 0 & 0 & 144 & 1 & 2.8 & 1 & 0 & 1 & 2\\\\\n",
       "\t294 & 294 & 63 & 1 & 2 & 140 & 187 & 0 & 0 & 144 & 1 & 4.0 & 1 & 2 & 3 & 2\\\\\n",
       "\t295 & 295 & 63 & 0 & 0 & 124 & 197 & 0 & 1 & 136 & 1 & 0.0 & 0 & 0 & 1 & 1\\\\\n",
       "\t296 & 296 & 41 & 1 & 0 & 120 & 157 & 0 & 0 & 182 & 0 & 0.0 & 2 & 0 & 3 & 0\\\\\n",
       "\t297 & 297 & 59 & 1 & 0 & 164 & 176 & 1 & 1 &  90 & 0 & 1.0 & 1 & 2 & 2 & 3\\\\\n",
       "\t298 & 298 & 57 & 0 & 0 & 140 & 241 & 0 & 0 & 123 & 1 & 0.2 & 1 & 0 & 1 & 1\\\\\n",
       "\t299 & 299 & 45 & 1 & 0 & 110 & 264 & 0 & 1 & 132 & 0 & 1.2 & 1 & 0 & 3 & 1\\\\\n",
       "\t300 & 300 & 68 & 1 & 3 & 144 & 193 & 1 & 1 & 141 & 0 & 3.4 & 1 & 2 & 3 & 2\\\\\n",
       "\t301 & 301 & 57 & 1 & 0 & 130 & 131 & 0 & 1 & 115 & 1 & 1.2 & 1 & 1 & 3 & 3\\\\\n",
       "\t302 & 302 & 57 & 0 & 0 & 130 & 236 & 0 & 1 & 174 & 0 & 0.0 & 1 & 1 & 3 & 1\\\\\n",
       "\t303 & 303 & 38 & 1 & 1 & 138 & 175 & 0 & 0 & 173 & 0 & 0.0 & 1 & 0 & 2 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 301 × 15\n",
       "\n",
       "| <!--/--> | X &lt;int&gt; | age &lt;int&gt; | sex &lt;fct&gt; | cp &lt;fct&gt; | trestbps &lt;int&gt; | chol &lt;int&gt; | fbs &lt;fct&gt; | restecg &lt;fct&gt; | thalach &lt;int&gt; | exang &lt;fct&gt; | oldpeak &lt;dbl&gt; | slope &lt;fct&gt; | ca &lt;int&gt; | thal &lt;fct&gt; | target &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 |  1 | 63 | 1 | 3 | 145 | 233 | 1 | 0 | 150 | 0 | 2.3 | 0 | 0 | 1 | 0 |\n",
       "| 2 |  2 | 67 | 1 | 2 | 160 | 286 | 0 | 1 | 108 | 1 | 1.5 | 0 | 3 | 2 | 2 |\n",
       "| 3 |  3 | 67 | 1 | 1 | 120 | 229 | 0 | 0 | 129 | 1 | 2.6 | 2 | 2 | 2 | 1 |\n",
       "| 4 |  4 | 37 | 1 | 1 | 130 | 250 | 0 | 1 | 187 | 0 | 3.5 | 2 | 0 | 2 | 0 |\n",
       "| 5 |  5 | 41 | 0 | 0 | 130 | 204 | 0 | 1 | 172 | 0 | 1.4 | 2 | 0 | 2 | 0 |\n",
       "| 6 |  6 | 56 | 1 | 0 | 120 | 236 | 0 | 1 | 178 | 0 | 0.8 | 1 | 0 | 1 | 0 |\n",
       "| 7 |  7 | 62 | 0 | 1 | 140 | 268 | 0 | 0 | 160 | 0 | 3.6 | 1 | 2 | 2 | 3 |\n",
       "| 8 |  8 | 57 | 0 | 1 | 120 | 354 | 0 | 1 | 163 | 1 | 0.6 | 2 | 0 | 3 | 0 |\n",
       "| 9 |  9 | 63 | 1 | 2 | 130 | 254 | 0 | 1 | 147 | 0 | 1.4 | 2 | 1 | 3 | 2 |\n",
       "| 10 | 10 | 53 | 1 | 2 | 140 | 203 | 1 | 1 | 155 | 1 | 3.1 | 2 | 0 | 2 | 1 |\n",
       "| 11 | 11 | 57 | 1 | 0 | 140 | 192 | 0 | 1 | 148 | 0 | 0.4 | 2 | 0 | 2 | 0 |\n",
       "| 12 | 12 | 56 | 0 | 2 | 140 | 294 | 0 | 1 | 153 | 0 | 1.3 | 2 | 0 | 2 | 0 |\n",
       "| 13 | 13 | 56 | 1 | 1 | 130 | 256 | 1 | 1 | 142 | 1 | 0.6 | 2 | 1 | 2 | 2 |\n",
       "| 14 | 14 | 44 | 1 | 3 | 120 | 263 | 0 | 0 | 173 | 0 | 0.0 | 1 | 0 | 2 | 0 |\n",
       "| 15 | 15 | 52 | 1 | 3 | 172 | 199 | 1 | 0 | 162 | 0 | 0.5 | 2 | 0 | 2 | 0 |\n",
       "| 16 | 16 | 57 | 1 | 2 | 150 | 168 | 0 | 1 | 174 | 0 | 1.6 | 1 | 0 | 2 | 0 |\n",
       "| 17 | 17 | 48 | 1 | 2 | 110 | 229 | 0 | 1 | 168 | 0 | 1.0 | 2 | 0 | 2 | 1 |\n",
       "| 18 | 18 | 54 | 1 | 3 | 140 | 239 | 0 | 1 | 160 | 0 | 1.2 | 0 | 0 | 2 | 0 |\n",
       "| 19 | 19 | 48 | 0 | 0 | 130 | 275 | 0 | 1 | 139 | 0 | 0.2 | 2 | 0 | 2 | 0 |\n",
       "| 20 | 20 | 49 | 1 | 3 | 130 | 266 | 0 | 1 | 171 | 0 | 0.6 | 2 | 0 | 2 | 0 |\n",
       "| 21 | 21 | 64 | 1 | 0 | 110 | 211 | 0 | 1 | 144 | 1 | 1.8 | 1 | 0 | 3 | 0 |\n",
       "| 22 | 22 | 58 | 0 | 2 | 150 | 283 | 1 | 1 | 162 | 0 | 1.0 | 2 | 0 | 2 | 0 |\n",
       "| 23 | 23 | 58 | 1 | 0 | 120 | 284 | 0 | 1 | 160 | 0 | 1.8 | 2 | 0 | 2 | 1 |\n",
       "| 24 | 24 | 58 | 1 | 2 | 132 | 224 | 0 | 1 | 173 | 0 | 3.2 | 1 | 2 | 2 | 3 |\n",
       "| 25 | 25 | 60 | 1 | 3 | 130 | 206 | 0 | 1 | 132 | 1 | 2.4 | 2 | 2 | 3 | 4 |\n",
       "| 26 | 26 | 50 | 0 | 1 | 120 | 219 | 0 | 1 | 158 | 0 | 1.6 | 2 | 0 | 2 | 0 |\n",
       "| 27 | 27 | 58 | 0 | 2 | 120 | 340 | 0 | 1 | 172 | 0 | 0.0 | 2 | 0 | 2 | 0 |\n",
       "| 28 | 28 | 66 | 0 | 2 | 150 | 226 | 0 | 1 | 114 | 0 | 2.6 | 2 | 0 | 2 | 0 |\n",
       "| 29 | 29 | 43 | 1 | 2 | 150 | 247 | 0 | 0 | 171 | 0 | 1.5 | 2 | 0 | 2 | 0 |\n",
       "| 30 | 30 | 40 | 1 | 2 | 110 | 167 | 0 | 0 | 114 | 1 | 2.0 | 0 | 0 | 2 | 3 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 273 | 273 | 46 | 1 | 0 | 140 | 311 | 0 | 1 | 120 | 1 | 1.8 | 1 | 2 | 2 | 2 |\n",
       "| 274 | 274 | 71 | 0 | 0 | 112 | 149 | 0 | 1 | 125 | 0 | 1.6 | 2 | 0 | 3 | 0 |\n",
       "| 275 | 275 | 59 | 1 | 0 | 134 | 204 | 0 | 0 | 162 | 0 | 0.8 | 1 | 2 | 2 | 1 |\n",
       "| 276 | 276 | 64 | 1 | 0 | 170 | 227 | 0 | 1 | 155 | 0 | 0.6 | 2 | 0 | 3 | 0 |\n",
       "| 277 | 277 | 66 | 0 | 0 | 146 | 278 | 0 | 1 | 152 | 0 | 0.0 | 1 | 1 | 3 | 0 |\n",
       "| 278 | 278 | 39 | 0 | 1 | 138 | 220 | 0 | 1 | 152 | 0 | 0.0 | 2 | 0 | 3 | 0 |\n",
       "| 279 | 279 | 57 | 1 | 1 | 154 | 232 | 0 | 0 | 164 | 0 | 0.0 | 2 | 1 | 2 | 1 |\n",
       "| 280 | 280 | 58 | 0 | 0 | 130 | 197 | 0 | 0 | 131 | 0 | 0.6 | 1 | 0 | 2 | 0 |\n",
       "| 281 | 281 | 57 | 1 | 0 | 110 | 335 | 0 | 1 | 143 | 1 | 3.0 | 1 | 1 | 1 | 2 |\n",
       "| 283 | 283 | 55 | 0 | 2 | 128 | 205 | 0 | 1 | 130 | 1 | 2.0 | 1 | 1 | 1 | 3 |\n",
       "| 284 | 284 | 35 | 1 | 0 | 122 | 192 | 0 | 1 | 174 | 0 | 0.0 | 2 | 0 | 3 | 0 |\n",
       "| 285 | 285 | 61 | 1 | 0 | 148 | 203 | 0 | 0 | 161 | 0 | 0.0 | 2 | 1 | 3 | 2 |\n",
       "| 286 | 286 | 58 | 1 | 0 | 114 | 318 | 0 | 1 | 140 | 0 | 4.4 | 1 | 3 | 3 | 4 |\n",
       "| 287 | 287 | 58 | 0 | 3 | 170 | 225 | 1 | 1 | 146 | 1 | 2.8 | 2 | 2 | 2 | 2 |\n",
       "| 288 | 288 | 58 | 1 | 1 | 125 | 220 | 0 | 0 | 144 | 0 | 0.4 | 2 | 0 | 2 | 0 |\n",
       "| 289 | 289 | 56 | 1 | 0 | 130 | 221 | 0 | 1 | 163 | 0 | 0.0 | 1 | 0 | 3 | 0 |\n",
       "| 290 | 290 | 56 | 1 | 0 | 120 | 240 | 0 | 2 | 169 | 0 | 0.0 | 1 | 0 | 3 | 0 |\n",
       "| 291 | 291 | 67 | 1 | 0 | 152 | 212 | 0 | 1 | 150 | 0 | 0.8 | 2 | 0 | 3 | 1 |\n",
       "| 292 | 292 | 55 | 0 | 0 | 132 | 342 | 0 | 2 | 166 | 0 | 1.2 | 0 | 0 | 1 | 0 |\n",
       "| 293 | 293 | 44 | 1 | 0 | 120 | 169 | 0 | 0 | 144 | 1 | 2.8 | 1 | 0 | 1 | 2 |\n",
       "| 294 | 294 | 63 | 1 | 2 | 140 | 187 | 0 | 0 | 144 | 1 | 4.0 | 1 | 2 | 3 | 2 |\n",
       "| 295 | 295 | 63 | 0 | 0 | 124 | 197 | 0 | 1 | 136 | 1 | 0.0 | 0 | 0 | 1 | 1 |\n",
       "| 296 | 296 | 41 | 1 | 0 | 120 | 157 | 0 | 0 | 182 | 0 | 0.0 | 2 | 0 | 3 | 0 |\n",
       "| 297 | 297 | 59 | 1 | 0 | 164 | 176 | 1 | 1 |  90 | 0 | 1.0 | 1 | 2 | 2 | 3 |\n",
       "| 298 | 298 | 57 | 0 | 0 | 140 | 241 | 0 | 0 | 123 | 1 | 0.2 | 1 | 0 | 1 | 1 |\n",
       "| 299 | 299 | 45 | 1 | 0 | 110 | 264 | 0 | 1 | 132 | 0 | 1.2 | 1 | 0 | 3 | 1 |\n",
       "| 300 | 300 | 68 | 1 | 3 | 144 | 193 | 1 | 1 | 141 | 0 | 3.4 | 1 | 2 | 3 | 2 |\n",
       "| 301 | 301 | 57 | 1 | 0 | 130 | 131 | 0 | 1 | 115 | 1 | 1.2 | 1 | 1 | 3 | 3 |\n",
       "| 302 | 302 | 57 | 0 | 0 | 130 | 236 | 0 | 1 | 174 | 0 | 0.0 | 1 | 1 | 3 | 1 |\n",
       "| 303 | 303 | 38 | 1 | 1 | 138 | 175 | 0 | 0 | 173 | 0 | 0.0 | 1 | 0 | 2 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "    X   age sex cp trestbps chol fbs restecg thalach exang oldpeak slope ca\n",
       "1    1  63  1   3  145      233  1   0       150     0     2.3     0     0 \n",
       "2    2  67  1   2  160      286  0   1       108     1     1.5     0     3 \n",
       "3    3  67  1   1  120      229  0   0       129     1     2.6     2     2 \n",
       "4    4  37  1   1  130      250  0   1       187     0     3.5     2     0 \n",
       "5    5  41  0   0  130      204  0   1       172     0     1.4     2     0 \n",
       "6    6  56  1   0  120      236  0   1       178     0     0.8     1     0 \n",
       "7    7  62  0   1  140      268  0   0       160     0     3.6     1     2 \n",
       "8    8  57  0   1  120      354  0   1       163     1     0.6     2     0 \n",
       "9    9  63  1   2  130      254  0   1       147     0     1.4     2     1 \n",
       "10  10  53  1   2  140      203  1   1       155     1     3.1     2     0 \n",
       "11  11  57  1   0  140      192  0   1       148     0     0.4     2     0 \n",
       "12  12  56  0   2  140      294  0   1       153     0     1.3     2     0 \n",
       "13  13  56  1   1  130      256  1   1       142     1     0.6     2     1 \n",
       "14  14  44  1   3  120      263  0   0       173     0     0.0     1     0 \n",
       "15  15  52  1   3  172      199  1   0       162     0     0.5     2     0 \n",
       "16  16  57  1   2  150      168  0   1       174     0     1.6     1     0 \n",
       "17  17  48  1   2  110      229  0   1       168     0     1.0     2     0 \n",
       "18  18  54  1   3  140      239  0   1       160     0     1.2     0     0 \n",
       "19  19  48  0   0  130      275  0   1       139     0     0.2     2     0 \n",
       "20  20  49  1   3  130      266  0   1       171     0     0.6     2     0 \n",
       "21  21  64  1   0  110      211  0   1       144     1     1.8     1     0 \n",
       "22  22  58  0   2  150      283  1   1       162     0     1.0     2     0 \n",
       "23  23  58  1   0  120      284  0   1       160     0     1.8     2     0 \n",
       "24  24  58  1   2  132      224  0   1       173     0     3.2     1     2 \n",
       "25  25  60  1   3  130      206  0   1       132     1     2.4     2     2 \n",
       "26  26  50  0   1  120      219  0   1       158     0     1.6     2     0 \n",
       "27  27  58  0   2  120      340  0   1       172     0     0.0     2     0 \n",
       "28  28  66  0   2  150      226  0   1       114     0     2.6     2     0 \n",
       "29  29  43  1   2  150      247  0   0       171     0     1.5     2     0 \n",
       "30  30  40  1   2  110      167  0   0       114     1     2.0     0     0 \n",
       "⋮   ⋮   ⋮   ⋮   ⋮  ⋮        ⋮    ⋮   ⋮       ⋮       ⋮     ⋮       ⋮     ⋮ \n",
       "273 273 46  1   0  140      311  0   1       120     1     1.8     1     2 \n",
       "274 274 71  0   0  112      149  0   1       125     0     1.6     2     0 \n",
       "275 275 59  1   0  134      204  0   0       162     0     0.8     1     2 \n",
       "276 276 64  1   0  170      227  0   1       155     0     0.6     2     0 \n",
       "277 277 66  0   0  146      278  0   1       152     0     0.0     1     1 \n",
       "278 278 39  0   1  138      220  0   1       152     0     0.0     2     0 \n",
       "279 279 57  1   1  154      232  0   0       164     0     0.0     2     1 \n",
       "280 280 58  0   0  130      197  0   0       131     0     0.6     1     0 \n",
       "281 281 57  1   0  110      335  0   1       143     1     3.0     1     1 \n",
       "283 283 55  0   2  128      205  0   1       130     1     2.0     1     1 \n",
       "284 284 35  1   0  122      192  0   1       174     0     0.0     2     0 \n",
       "285 285 61  1   0  148      203  0   0       161     0     0.0     2     1 \n",
       "286 286 58  1   0  114      318  0   1       140     0     4.4     1     3 \n",
       "287 287 58  0   3  170      225  1   1       146     1     2.8     2     2 \n",
       "288 288 58  1   1  125      220  0   0       144     0     0.4     2     0 \n",
       "289 289 56  1   0  130      221  0   1       163     0     0.0     1     0 \n",
       "290 290 56  1   0  120      240  0   2       169     0     0.0     1     0 \n",
       "291 291 67  1   0  152      212  0   1       150     0     0.8     2     0 \n",
       "292 292 55  0   0  132      342  0   2       166     0     1.2     0     0 \n",
       "293 293 44  1   0  120      169  0   0       144     1     2.8     1     0 \n",
       "294 294 63  1   2  140      187  0   0       144     1     4.0     1     2 \n",
       "295 295 63  0   0  124      197  0   1       136     1     0.0     0     0 \n",
       "296 296 41  1   0  120      157  0   0       182     0     0.0     2     0 \n",
       "297 297 59  1   0  164      176  1   1        90     0     1.0     1     2 \n",
       "298 298 57  0   0  140      241  0   0       123     1     0.2     1     0 \n",
       "299 299 45  1   0  110      264  0   1       132     0     1.2     1     0 \n",
       "300 300 68  1   3  144      193  1   1       141     0     3.4     1     2 \n",
       "301 301 57  1   0  130      131  0   1       115     1     1.2     1     1 \n",
       "302 302 57  0   0  130      236  0   1       174     0     0.0     1     1 \n",
       "303 303 38  1   1  138      175  0   0       173     0     0.0     1     0 \n",
       "    thal target\n",
       "1   1    0     \n",
       "2   2    2     \n",
       "3   2    1     \n",
       "4   2    0     \n",
       "5   2    0     \n",
       "6   1    0     \n",
       "7   2    3     \n",
       "8   3    0     \n",
       "9   3    2     \n",
       "10  2    1     \n",
       "11  2    0     \n",
       "12  2    0     \n",
       "13  2    2     \n",
       "14  2    0     \n",
       "15  2    0     \n",
       "16  2    0     \n",
       "17  2    1     \n",
       "18  2    0     \n",
       "19  2    0     \n",
       "20  2    0     \n",
       "21  3    0     \n",
       "22  2    0     \n",
       "23  2    1     \n",
       "24  2    3     \n",
       "25  3    4     \n",
       "26  2    0     \n",
       "27  2    0     \n",
       "28  2    0     \n",
       "29  2    0     \n",
       "30  2    3     \n",
       "⋮   ⋮    ⋮     \n",
       "273 2    2     \n",
       "274 3    0     \n",
       "275 2    1     \n",
       "276 3    0     \n",
       "277 3    0     \n",
       "278 3    0     \n",
       "279 2    1     \n",
       "280 2    0     \n",
       "281 1    2     \n",
       "283 1    3     \n",
       "284 3    0     \n",
       "285 3    2     \n",
       "286 3    4     \n",
       "287 2    2     \n",
       "288 2    0     \n",
       "289 3    0     \n",
       "290 3    0     \n",
       "291 3    1     \n",
       "292 1    0     \n",
       "293 1    2     \n",
       "294 3    2     \n",
       "295 1    1     \n",
       "296 3    0     \n",
       "297 2    3     \n",
       "298 1    1     \n",
       "299 3    1     \n",
       "300 3    2     \n",
       "301 3    3     \n",
       "302 3    1     \n",
       "303 2    0     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<pre class=language-r><code>function (x) \n",
       "UseMethod(\"levels\")</code></pre>"
      ],
      "text/latex": [
       "\\begin{minted}{r}\n",
       "function (x) \n",
       "UseMethod(\"levels\")\n",
       "\\end{minted}"
      ],
      "text/markdown": [
       "```r\n",
       "function (x) \n",
       "UseMethod(\"levels\")\n",
       "```"
      ],
      "text/plain": [
       "function (x) \n",
       "UseMethod(\"levels\")\n",
       "<bytecode: 0x55fdf963e2d8>\n",
       "<environment: namespace:base>"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Libraries\n",
    "library(ggplot2)\n",
    "library(caret)\n",
    "library(rpart.plot)\n",
    "library(lattice)\n",
    "# Read the data\n",
    "data <- read.csv('../input/newdatav2/clevelanddataset-heart-disease.csv')\n",
    "#data\n",
    "# Drop the null values\n",
    "missing_ca_indeces <- which(data$ca %in% 4)\n",
    "missing_ca_indeces\n",
    "missing_thal_indeces <-which(data$thal %in% 0)\n",
    "missing_thal_indeces\n",
    "missing_values_indeces <- c(missing_ca_indeces, missing_thal_indeces)\n",
    "data <- data[-missing_values_indeces, ]\n",
    "#data\n",
    "#write.csv(data,'valueadj.csv')\n",
    "\n",
    "# Transform categorical variable to R factors\n",
    "data$sex <- as.factor(data$sex)\n",
    "data$cp <- as.factor(data$cp)\n",
    "data$fbs <- as.factor(data$fbs)\n",
    "data$restecg <- as.factor(data$restecg)\n",
    "data$exang <- as.factor(data$exang)\n",
    "data$slope <- as.factor(data$slope)\n",
    "data$thal <- as.factor(data$thal)\n",
    "data$target <- as.factor(data$target)\n",
    "data\n",
    "# Give a better name to the factor values for the graphs\n",
    "levels(data$sex) <- c(\"Female\", \"Male\")\n",
    "levels(data$cp) <- c(\"Asymptomatic\", \"Atypical angina\", \"No angina\", \"Typical angina\")\n",
    "levels(data$fbs) <- c(\"No\", \"Yes\")\n",
    "levels(data$restecg) <- c(\"Hypertrophy\", \"Normal\", \"Abnormalities\")\n",
    "levels(data$exang) <- c(\"No\", \"Yes\")\n",
    "levels(data$slope) <- c(\"Descending\", \"Flat\", \"Ascending\")\n",
    "levels(data$thal) <- c(\"Fixed defect\", \"Normal flow\", \"Reversible defect\")\n",
    "levels(data$target) <- c(\"Yes\", \"No\",\"partially no\",\"low confident\",\"absoulutely no\")\n",
    "levels"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "0c7a1568",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:45.492528Z",
     "iopub.status.busy": "2023-03-03T12:39:45.456229Z",
     "iopub.status.idle": "2023-03-03T12:39:46.199836Z",
     "shell.execute_reply": "2023-03-03T12:39:46.196328Z"
    },
    "papermill": {
     "duration": 0.754583,
     "end_time": "2023-03-03T12:39:46.203238",
     "exception": false,
     "start_time": "2023-03-03T12:39:45.448655",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mThe `<scale>` argument of `guides()` cannot be `FALSE`. Use \"none\" instead as\n",
      "of ggplot2 3.3.4.”\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBKF+R6gHSQSie7du7flGhraaxTaSRs3KPli\nw3VS2Wy4uhzOQZaWqHtcIpEIIRQVFS1RP/V8NTU1tbI2hrBLp9PTp09vyzWUttcotJM2blDy\nxYbrpLLZcMU5nIMsLVH3uLKysuLi4qamphkzZuR7lvyrqqpa0KoYwi6EkEql2vLlwq6jaeMG\nJV9suE4qmw0n7DqQJeoeV1JSEkJobm5eon7qReAYOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASBTmewAAILcah5bme4S2mhoaQ5gRQgih0/8shUPrcnfl9tgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEojDfA7Si+ck7r3ro6dc/r0musdaGB51w8EplyXyPBADQ\ncXXcPXbj7zvz4rteGLT74eec9Jvyjx4d8rtR6XyPBADQkXXUsEs3jLzr/f4Hjthzq0EDfrLJ\nSRccO2PCw3d8OTPfYwEAdFwdNOzqpz39WV3T9lsu13K2pHqTgZXFrzz1dX6nAgDoyDroMXYN\nM98KIaxZ/sN4A8oL//POtNlnL7vssokTJ7acXmGFFQ455JDFPCE51aVLl3yPwKKw4TqpbDZc\ncw7nIEuZb7jvQiqnk5CVNj5UptOtHZvWQcOuuX5mCKFH0Q/vluhRlExN/+F2+fLLL48ZM6bl\n9Lrrrnv00Ue35dvVt+WLyYGSkpJ8j8CisOE6qWw23KwczkGWstlwwq4DaeNDZVNTUytrO2jY\nFZSUhxC+TTX3LP7+xeJvUk2F1T9M+7Of/axPnz4tp1dYYYX6+ra12bAL2/TlHUAikSguLg4h\npFKp5uZO/1/qDDfoXnvU5XqSxaDlHt7Y2Nj6fbVTyPyeWDdoSE4nWQyKi4sTiURTU1NjY2O+\nZ2mrLDbcdh30AJ7MFRUVFRQULGkbrvrPRTmdZDEoLCxMJpPNzc2pVKeP1DZGSzqdTiYX+Dkh\nHTTsisrXDuGpMbNSPYu/r9qxsxqrBlTNvsAJJ5ww+3QqlZo2bdrcV7GESSaTLWFXW1sbwY1+\nidISdrNmzWrr/09YvKqrq5PJZH19fW1tbb5nIQtVVVUFBQWNjY01NTX5noUsVFZWJpPJpqYm\nGy6EUFpauqBVHfT/XqXdtuhdnHz4+cktZ1MzXn+1pmH9LXrmdyoAgI6sg4ZdSBSdvOfq464f\n+vjrYyeOf3v0WSMrem994HIV+R4LAKDj6qAvxYYQ+u8z4pj6S24fedaUusTKAzcbfvLhiXyP\nBADQkXXcsAuJ5NaDT956cL7HAADoJDrqS7EAAGRJ2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAEQikU6n8z1DW6VSqWnTpuV7ijxLpVIff/xxCGH55ZcvLS3N9zhkYezYsSGEnj17du3aNd+z\nkIVPPvmkoaGhR48eSy21VL5nIQsTJkyYOXNmVVXVsssum+9ZyMKkSZOmTp1aVlbWt2/ffM+S\nfz169FjQqhjCjhDC559/vttuu4UQbrjhhnXWWSff45CpdDr905/+NIQwbNiwX/3qV/kehyzs\nsssuEyZMOOKII4444oh8z0IWjjnmmJdffnmHHXY499xz8z0LWTjvvPPuv//+gQMHXn/99fme\npUPzUiwAQCSEHQBAJIQdAEAkHGMXidra2ueffz6E8NOf/rSqqirf45CFRx99NIQwYMCAXr16\n5XsWsvDcc8/NmjWrX79+/fr1y/csZOH111//9ttve/XqNWDAgHzPQhbef//9CRMmdOvWbYMN\nNsj3LB2asAMAiISXYgEAIiHsAAAiIew6hw/uOnWXXXZ58NOaORc2pyaftPfuBw15MF9Tka1h\nB+y5297Hf9HQNOfCMVcfu88hN+VpIuZvxpdffPVdQ8vpnXfe+Yava1u//J677HLZxBlznqAV\nHfm3VPvVE78/4jd77n9KWPCmv+3QfX97x/hFu/45b1qdWv3UR3beeedJqebcfYtMbicZ/j47\n8k2u3Qm7zmHVvc7daKmS28+9tmGOQyLfvnHYJ41d/jBkx/zNRdaa6j499+Kn8j0FC/HM0FP+\n775PWk5vv/32q5cV5nUcFp8Prrj1q7JfXXHZ6SE3m37OmxZt5/c5L2HXOSQKSo8dNjg15Znz\nHv60ZUn9dy+MePizdQ4+d0C5p5zOZJmNN530/KV3jF3S/wheh5VuqptrydFHH71R1+KcftOm\nZm9iy495f/P13zVU9Fm7Z4/q0E6b3sbtvDrpttMEnUZl3x1O3+bh8284d9wvR61Smrx/+FUF\n3Tc7c8cVQwjNjVPuG3Xtv59/69v6gt4rD9x18BG/XL265asmvf7Pa/7y9zGff1lQ0X3gpjsd\nd9BOZQWJfP4YS7yuK+/5m+TYy4b+aftbR3RLzr0tmuon3HbldY+9+v70VMEKq6631+HH/GLF\nLnmZs/Oqn/rI3oOvvfiY7f509zPfTK1fdsWVt9z9qD1+0TeE0DD1veuvuvWFtz6a3tDcY7n+\n2+1//J4b9W75qv1322X/60Z/fcMlT75TtnHyrX98Wxf+9vu9nvzFPX85deedd9511J2HLFve\n+jXMZeyo4898ds27bz665ey0j67+zclPXnX37b2Lk7MvM3j3XXe8dMT751/w2oTpldXL/nz7\ng4/fZ1DLqiXnljDfn/SmQ/Z9dsVTRp+9fgjhw1tP/N09H+909e2H964MIfz5wL3GrXfONb9b\n60dXUvfZrVfc8OI7Y76pK15jgy2POO7AvqXJBV15WPBv/q9H7Hf9VzPD56fv/srK99998exN\nX/fNf6+76s43x4ybVbj0xjsP7jbHt17Qw+98v8W1B+09501rsf2S26L12/zMiS+cNfLG9z/7\nrrLnStvtc8y+m/cLC37emf/mSKd23mWPX99w1949ylquc//ddvn5lbedsFzlD0Ms4DIlZxwy\n5++zlafCFpncK8OCbx6d5V5pj11nssGR565aNO2CCx//9r/X3vnRjMHDjixOhBDCraed9OB7\nyV+fOOTCEWdst1r6stOO/M/E2hBCY+27xw+7pmCDXc45/6JTjtztvX/cMOLfE/L8MxDCxsef\n27fx/bNGvz7PmvQ1v/3DP95LH3zSmRec/fuBpR9f9PuTxsxqzMOInV7qtFEvbLbvESOGnbJl\nv6Zb/nTC/Z/WhBBuPGXY89/2PeGsESMvGL7zwOZbL/z9N40/HCH03OXDKn6y2/kXHnvY6NsP\n71m5/A5/vOOm3891va1fw5yW3/NX9VP/9caMVMvZN0a/1K3/oXM9f4QQ/n7GBSvsevwV1151\n3K6rP3Lb+XdOajmia8m5Jcz/J93sV8tNHfP90cOvPvV1srDgrX9ODCE01X369PSGDfZa4cfX\n0Xj5iac88nnF4BPPGXHG0V0/+vdpp9zWypW3fNF8f/M7X3XrKX279PzF8Ltvv2iOq59yzvHD\nX5pSffDvzjnjuH2//c8lf5sya/baBT38zvdbtHLT6rBav80PP/XmtXY6dMSIITsOKLzj4t/e\n9sG0BT/vtP+teq7fZyvbokWG98ow/5tHp7lX2mPXmRQU9jjtzJ0OGnLFkLcKltvylF/1rggh\n1E158P5x08+74+SW12RXXnWtxpcPuPPq97YZvkHDjNdnNad/9avNVutWEvr3G3569ZdllQv7\nJuRcQXGvIaduc+iw//vXTn/Zbrny2ctrJ9357y9mnHTjGZt3Lw0hrDJgzXf3P/Dav3128T4+\n/zY76XR6rWNH7LdFrxDC6gPWr3ln/wcufXH3kVsvu93ex/9yxw2qikMIfXruNfqh4Z/UNfao\n/P61tmnLHr7vVuu0nC5MhESysLBw7kf81q9hTqXV2/+k8vo7nvpqvR36NjdOGT1m6qALNpz3\nYhU///3gbQaGEPru+rvetz0zZnJdWKZ8ybklLOgnPX+brRtuufq/M1PrlKX+OmXWvnuveP8j\nz4XDVq357J5Esut+y/3ocazmixuf+Krx/+747VrlhSGEFUdMHXrhU9Oa0kVTWvs1zvc3nygs\nLAyJRMGPNv3k16/8oK505AUn9ytNhhBWW6Nsn1//X8uqVh5+5/stksuUL+im1WG1fpvvd+yw\nfTbpGUJYfcD6M97d/+HLnt7tnKnzfd5Z4K16776LPFuysHD277P1bdEiw3tlmN+2qw1/7Sz3\nSmHXyVSvddChqz1x4/iiq4/+/uY444s30un06fvuPufFKhq/CGGDsu67bNb/kWGHHLbWT9Zb\nc4011v3Jz3+6Qrf5XSuLW4+fHHXQWi/eeOaVm1//w3/cp733VrKk95bdS1vOJgrKd+9VftWz\nX4aO98DR8W2/QffZpzffquff730yhK132XW7t1567v7PJnz99dfj33tlri/p9cuFP8G0fg1z\n2W+rXmfe9++ww2HfvnXdzMLlDu3fdd7L9Nz6h51PXZMFIR3CknRLWNBPWrrPdiuXjnrw/amr\nLP9ofdFKu2y79e133fht40FfPDC2S98DKn58DMOUl94vqlxvrf8dbVzaffs//nH7EMKXrf4a\n5/ubn6/JT08ord6mpepCCMVdfvaTyqIpIYRWH36z+hYdWeu3+Z3W/9Ed7aF7ni3rPmS+zzsL\nvFW3Iezm1Pq2mC2Te2WY37brRPdKYdf5rLpSZXLCsj2Lv38ZvbCiOJGsuOfuW+Z8qEskkiGE\nRLLrySNv3uu91/77znvvvfXYfTdfu/buQ4cOXjcfUzO3nYac9vcDTz/3nnGD/7cknQ5zHR1R\nUJBINzfN86VkJ1FYkE43Nqe+GX70seMqB2z7i3UH/HSNrXfe7HcnDJvzYuVdFvJ4uNBrmEvf\nXXeue/CKd2oHj73+nWUHnVI6v8Nbi8rms+dmybklLPgnTey/ZvWV9304aYNXKpffvbT6F8sW\njr7vq5nfvv3dikevN9eVNKfSiYL57DRt/dc439/8/M2z4boWFrSEXSsPv9l9i44qq9t8YWVh\nIlG0oOedjG/V6caFF/B8LtP6tpgtk3tlmN+260T3SsfYdXrly24bmmsfnpwq+l7hrcPOvPzJ\nr0II373z4Ogb7l9+zQ122vs3pw69aORh/d/6x035npfvFZavPuyon713x9kvflvfsqTbGms2\n1X/+9Hffn003z3pwwsylF3BsPq3752vfzj797CNfli296Ywvrn99cuqKP5914F47bzroJ32r\ns/5Qq2yvobR6659VFt30yPO3fTFjh9+smvk3WnJuCa38pKvsN2D6+HvefOSrPjuvGhLJvftU\nvv7A08/XNOyzXve5rqT7T1dsqHn1w7rvn2Lrpz4xePDgt2tT7fVrXGbT3nXfPfLx/66/qe7D\nF6Z/f52tPPzGYaG3+X+8+cMd7cmHJlT03nJBzzutb44Z/yu1uu+eqlvAe1Fbv0yG22JJuFcK\nu06vuMsGh63b/S+nDv/XM699Mv6DB6897aH3p2w5aOkQQlG3mX978ObL7n/yg/Gfjn3npfv+\nNbGiz8b5npcf9N761B37JO9/aVLL2fJl999quYqrTr3gmdfeHf/+m7f+8eQPGrsdsdsKrV8J\n8/XulWfd+8TL4z5468Frzrz785k7nbRJUZdV0unGB595Z9I3X495/fELh9wcQvjsq6nzfe9D\nQSLM+nLCd99Nn3NhVtfQYp9te4+78ZKCLoN2+t+7+TKx5NwSWvlJu/b7dUH9R7d+OXOrgdUh\nhDV36TPx0etLqjZfa54PeOra78ifdUufe9YVr7w97qP3X7v67NGp8o3WLi9qr19jj3WPWbWk\n9qwzLnnhjffHvPnCpWcM7VIy+2XZBT78Lsh8b1od1kJv869cfNZ9T7784QdvPXD1kHs+r9vr\npA0X9LyzwM2RKFqtvOiZK+/9aMKkT8e8dumZ1yUS8+xFW/BlZv8+M98W0d8rvRQbgx3Pvrj+\nuivuueaC71JFvVda53fnDxlYURRCqOxzwNBDZtz0j+ufuGVGRfXS/dfe9rxjdsv3sMyp4DfD\njn/skPO//79nInnsJRd0uWLUqAvPqWlM9l11/d9fdMyaPqdwkZwzfP/brrzmzgkzl1mx369/\nf+leK3cNYfehB00adcsFf69NrrjKwP1Pv7Lqz8fdesrxG9xx+/Ilc7/sMmCXDW+54bKjf7/p\nndf/dvbCsh4LvIYFjdF3l13S916ywu77ZTf9knNLWPBPWlC0zB7LlN39XfXmVSUhhO7rb5tO\nv7vMJjvM5zoKSk+5fMQNV9w66qKzpjWX9x+4zXnHHND6lWc3Y2H3YZcPueqyWy75vzNCaY9N\n9z71qJdG3vq/tQt6+F2Q+d60OqxWbvPLhlBQWD300F/cfMcVt3/TsNxKqxw85Iod+1SEsIDn\nnQVvjjPPPeJPl99z6rH3NTSn19z66J9Pu37eSRZ0mf9v716DoqziOI7/dxd2ubPuroUphJIm\naUrZBc1xTbPMS9mFECmvZDTdrax4YaZptzGsxsx0KLRJzFS6qDVmGgbywhkrBTTNySVvgAQC\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data, aes(target, fill=target)) + \n",
    "  geom_bar() +\n",
    "  labs(x=\"Disease\", y=\"Number of patients\") +\n",
    "  guides(fill=FALSE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "484863b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:46.218121Z",
     "iopub.status.busy": "2023-03-03T12:39:46.216243Z",
     "iopub.status.idle": "2023-03-03T12:39:46.794513Z",
     "shell.execute_reply": "2023-03-03T12:39:46.774968Z"
    },
    "papermill": {
     "duration": 0.589768,
     "end_time": "2023-03-03T12:39:46.798333",
     "exception": false,
     "start_time": "2023-03-03T12:39:46.208565",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nVDsb/m9cmyrp049/M+317y+8vnL74y1bY/QQQtxOSQs03PsJv5li0fn+F8nPz69t2/92ExYu\nXDgxMfHxlpUrdDqdTqezWq1JSUlOjKGGXq+3Wq2pqanZz+o8iqLY/mpPTk5OS7t3Co6ai+fk\n/G1g71I0Go1er3f97W4wGDQajcViSUn57w+kXLkeUdbrXOUiMg5iNBpTUlLSt7v6QVxBztdG\ntu9hewfR6XSKomTc7q7JaDQqipKampovfjs593+cJ01ArVFTdf/XvXnHvte2FtJn7v2p8SfH\n9xn0+Xd7byZpKz/TbMy8he2q+Tklp+tT++fI6TIda3hNGf9K1UXVQp6uWM5LiTkdeWjf7xeM\n3rX022a8te3ebJ6F+86cUF3lmHqPqkLsjExICTTc2yd/KiHVu/J/u76LFi06ZsyY9LsxMTGx\nsbEqB3cEd3d3W7Fzbgw1zGazxWKJj493dpCspBe7xMTE5ORk20SziifmfP3buxSDwaDT6Vx/\nu3t5eRkMhtTU1IxR1bzYbGX92lUuItMqzbjd1Q/iCnK+NrJ9L9k7iMlk0mg0rv8Wtf3IJyUl\nJSQkODtLVrRardFojIuLu++EPzhY+yWb3y9QuemwH49ENL//kbT+tUNWJDw1f+mm8l6Ja2YN\n6VSnZtHrp0PM+ePjRnlMbbEbNXqiEEKn0109/us3x3+992SdzhJ35JNP/vuMXUClF9UXOzef\nxkGGBd/vu/Fs86JCiJTY3w7GJL/WONCO+AAAQApat7IbVvcs0arNokHX+5T7by9P9F/hH0fe\nWXpp/RtBJiHE06H1d/sVGjD3+KHxmT8eBqH+rNgUdf7542U7Fq7oh79W4fSSSdt/O3Xl3J+f\njJ9tCmrapYjpcV4HAADI54o1/2hGo4Cw5/vGpf23r/T6nh16j+A3g+7VA0XrHVbW+8Lq007K\n6Oqc/MnQsh3e6Zc096vZ428lKmWqN5oyvFc++pwNAADIXYM2rI0o2LD5tCHT/51itVoz7YfS\nahWrxaU/pulEeVrstIaimzZtum+Som365vCmnN0MAACEMHiF/PRR60p9m21oee/yPQXrh6bE\nT11xNf71QA8hhNUSM+vU3WIDg50a03XlgxPOAQDAkyO4x5qBFbQzNv5tu+tdanK3cj59G7Rb\n9cPuw3u3jHntmQNJhSLCqmQ9yBOLYgcAAFyKduqWJV66fyuKolv0257ezyQN7tjsmSavfn+n\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data, aes(age, fill=target)) + \n",
    "  geom_histogram(binwidth=1) +\n",
    "  labs(fill=\"Disease\", x=\"Age\", y=\"Number of patients\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "35f98552",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:46.814674Z",
     "iopub.status.busy": "2023-03-03T12:39:46.812902Z",
     "iopub.status.idle": "2023-03-03T12:39:47.242819Z",
     "shell.execute_reply": "2023-03-03T12:39:47.240301Z"
    },
    "papermill": {
     "duration": 0.441219,
     "end_time": "2023-03-03T12:39:47.245838",
     "exception": false,
     "start_time": "2023-03-03T12:39:46.804619",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd3wTdR/A8V9G0zbdAygUKBRK2VOBIgVZIkNR9hDZe4/KKBsE2UuWgKKIbBFE\nRfYGH5YiowwBQaCs7p2mef4IVihQUkh65cfn/cfzSu6ud1/aV+vnSXJ3KpPJJAAAAPDqUys9\nAAAAAKyDsAMAAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwAAAAkoVV6ACtI\nTU2NjY1VegrYloODg729vdFojIuLU3oWIKdzc3MTQiQkJBgMBqVngc15eHgoPQJyEBnCzmQy\nGY1GpaeAbZlMJrVazc8asIRarRb8bQReS7wVCwAAIAnCDgAAQBKEHQAAgCQIOwAAAEkQdgAA\nAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwA\nAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACAJAg7AAAASRB2AAAAkiDsAAAAJEHY\nAQAASIKwAwAAkARhBwAAIAnCDgAAQBKEHQAAgCQIOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiC\nsAMAAJAEYQcAACAJrdIDAHgtuEyfoPQIr5FkIYQQOiF0Cg/yGokNGaP0CIAQvGIHAAAgDcIO\nAABAEoQdAACAJAg7AAAASRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAAQBKE\nHQAAgCSy6V6xptTITUuX/HL4jwdJ6rwFAt5v37N+BR8hhBBpe9cs/HH/yRuxmhKlq3Ts36mw\no+bfL8pkFQAAADLKplfstk8e+u3e8MYd+0+dOKx2keSF4/psvhEnhLiycdTstUeCmnYbO/Bj\n/V87QwcvNf37JZmsAgAAwJOy4xU7Y/KNxSfu15w8o0kpDyFEQPEyt//XavPisCaTys5ae75o\n+1nN6xYWQhSdKlp0mL76dvu2eZ2EKeWZqwAAAPA02fGKnTHpml/hwg39Xf5doKrgZp8SHZcc\nvf96krFB7XzmpfYeweWcdcf23RFCZLIKAAAAT5Udr9jp3ILnzAlOf2qIC/vyVlyhbkVT4tcJ\nIUrq/5uhlF67/Uy0ECIl/vSzVpl9+eWX4eHh5sf58uVr3bq1jf8RUJhWqxVCqNVqZ2dnpWcB\ngIyU+tMUHx+vyHGRY2XTyRPprh37af68r1L9G46s52u4Fi+E8Lb775QIbzuNIcYghEhLfuYq\ns927d4eFhZkfly9fvmPHjtkyPhSmUqkcHByUngIvIlnpAQCbUupPE2GHDLIv7JIjw76cO3/b\nHxE1m/f6tG1tB5Uq1l4vhIgwpPnoHr4jfN9g1HpohRDqZ68yK1y4sEqlMj8uWLBgampqtv1D\noAi1Wq1Wq00mk9FoVHoWAMiI/wwhh8imsIu9unNIyAJN2QbTln4c6P3w/9bY6csIsS8s0eCj\nszcvuZiY6lbKLfNVZhMnTkx/bDAYoqKisucfAqXo9Xq9Xp+WlsbP+hXl8vxNgFcYf5qQQ2TH\nyROmtIRPRyyyr9Nv4Zju6VUnhHBwr+Wr0/x8+J75qSHu5PHYlIq1fDJfBQAAgKfKjlfsEsJX\nnkswdCnrdOL48fSFdo4B5Uq5DWlePGT5uN15Pinunrx5/iwn33rt8zkJIYTK7pmrAAAA8DTZ\nEXbRF64JIZZP/fTRhW7+o1fOebNoq0m9k+d8N2v0gyRVkXI1Jw7ppvp3g0xWAQAA4Ekqk+mV\nv6GDwWCIjo5+/nZ4lZk/Y2c0GiMjI5WeBS/CZfoEpUcAbCg2ZIxSh/b29lbq0MiBsumWYgAA\nALA1wg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwAAAAkQdgBAABIgrADAACQBGEHAAAgCcIO\nAABAEoQdAACAJAg7AAAASRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAAQBKE\nHQAAgCQIOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAShB0AAIAk\nCDsAAABJEHYAAACSIOwAAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACAJAg7AAAA\nSRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAAQBKEHQAAgCQIOwAAAEkQdgAA\nAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwA\nAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACAJAg7AAAASRB2AAAAkiDsAAAAJEHY\nAQAASIKwAwAAkARhBwAAIAnCDgAAQBKEHQAAgCQIOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiC\nsAMAAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwAAAAkQdgBAABIQqv0AFag\nUqm8vb2VngLZQaPR8LN+RSUrPQBgU0r9aXrw4IEix0WOJUPYmUymqKgopaeAbTk4ODg4OKSl\npcXExCg9C16Eo9IDADal1H+GTCaTIsdFjiVD2AkhUlNTlR4BtpWWliaEMJlM/KwB5ED8aUIO\nwWfsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAAQBKEHQAAgCQIOwAAAEkQdgAAAJIg7AAA\nACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwAAAAkQdgB\nAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACAJAg7AAAASRB2AAAAkiDsAAAAJEHYAQAASIKw\nAwAAkARhBwAAIAnCDgAAQBKEHQAAgCQIOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiCsAMAAJAE\nYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwAAAAkQdgBAABIgrADAACQBGEHAAAg\nCcIOAABAEoQdAACAJAg7AAAASRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAA\nQBKEHQAAgCQIOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAShB0A\nAIAkCDsAAABJEHYAAACSIOwAAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACAJAg7\nAAAASRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAAQBKEHQAAgCS02Xy8Fb06\nOExY3DqXo/npnSOh3ab8+egGPb5e18jDQQghRNreNQt/3H/yRqymROkqHft3KuyoyeZpAQAA\nXiHZGXamywe/2nQrqoXJlL4o6vcoR6/3BnQrlb7E30lnfnBl46jZa/9u36dvZ4/UrUsWhA5O\nXbWopyobxwUAAHi1ZFPYhR+YM+qLQ3ejkzMsv3suxr1ktWrVSmX8AlPKrLXni7af1bxuYSFE\n0amiRYfpq2+3b5vXKXsGBgAAeOVk02fsPMs2Hz52yoypwzIs/yMm2aOCuzExJvxulOmR5cnR\n+68nGRvUzmd+au8RXM5Zd2zfneyZFgAA4FWUTa/Y6dzyF3UTxhSHDMtPxRnSDs5rOT/MYDJp\nnXLVbzugx3tlhRAp8aeFECX1/41XSq/dfiY6/emXX34ZHh5ufpwvX77WrVvb/N8ARWm1WiGE\nWq12dnZWehYAyEipP03x8fGKHBc5VnafPPEoY8rNaJWmkGfQ1O8muhljjv60bObSUfYB33Qs\n7p6WHC+E8Lb772wJbzuNIcaQ/nT37t1hYWHmx+XLl+/YsWP2zg5lqFQqB4eM//cAr4SMn8MA\n5KLUnybCDhkoGXYane+GDRv+feZds83wi9tb7V52puOM6mp7vRAiwpDmo3v4ZvF9g1Hr8d+0\npUuXdnV1NT/29/c3GAwCUtNoNGq12mQypaamKj0LAGTEf4aQQygZdk+qlNtxd+Q9IYSdvowQ\n+8ISDT46e/Oqi4mpbqXc0rccPnx4+mODwRAdHS0gNb1er9fr09LS+Fm/olyUHgCwKf40IYdQ\n8gLFURcXdOna505K2sPnJuO+2wnuJYsJIRzca/nqND8fvmdeY4g7eTw2pWItH6VGBQAAyPmU\nDDtX/1ZeCXeGjV9y/MzFS2d/Xz3nk/3xLt27FhNCCJXdkObFLy0ft/vkxVtX/lw2epaTb732\n+bjWCQAAwDMp+VasWus9ccH4rxavmjtpZJLW1b9o6WFzJlRwtjOvLdpqUu/kOd/NGv0gSVWk\nXM2JQ7pxdWIAAIBMqEwm0/O3ytn4jN3rwPwZO6PRGBkZqfQseBEu0ycoPQJgQ7EhY5Q6tLe3\nt1KHRg6k5FuxAAAAsCLCDgAAQBKEHQAAgCQIOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiCsAMA\nAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwAAAAkQdgBAABIgrADAACQBGEH\nAAAgCcIOAABAEoQdAACAJAg7AAAASRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnC\nDgAAQBKEHQAAgCQIOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAS\nhB0AAIAkCDsAAABJEHYAAACSIOwAAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACA\nJAg7AAAASRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAAQBKEHQAAgCQIOwAA\nAEkQdgAAAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYA\nAACSIOwAAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACAJAg7AAAASRB2AAAAkiDs\nAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAA/OfB+Waqxzm55ypdvfHEL3cZH99yjJ+bS95u\nykyJZ9AqPQAAAMhxCjTu2qq4uxBCmIyRd/8+8MvPY7r8tPKnT0+vH+nw74tCaq1Wk8YrRDkL\nYQcAADLy/2j49FZF0p+mGe5ObVN95MbQxnMa7Rxczrxw3F8PxikzHZ6J0AYAAM+htss9bPXh\naq72+8e0izOalB4Hz0TYAQCA51Pbec/uHGCIP/vZjVjzksmF3dM/Y5dmuL9geOeyRXwc7Oxc\nvQrUadX/6P2kR7887u/9A1vXL5jL3d7Js3iF2uOX/Jz2yNrzWxZ88HZFbzcnrc4xb5GyHT6Z\nF5FqssqeXzdZeis27faVv/L6Bwghku4emzJ9RaSuwHtd+tTzd7HRcJZTqVRKjwDbSv8R87MG\nkAMp9afJZMrWF8/8O5UTc87s33dHFHLNsGpOw/JDd4XXatW9RdcCMdePL166oO6B65E3f7BT\nCSFE/K0fypdoeV3l265Tt6Lemj/2rh/Xs9EPh7869XVHIcSNn/qU/mCRa2DNrv2GeepSzx36\n/pvpA47cKnLx20YvuefXkKVhlxJ9pG1w4y1/+aTEnzWlRjYpWXP7g0QhxKJZS1Zc+LNdQWdb\nDvkcKpXKy8tLwQGQbTQaDT/rV1Sy0gMANqXUn6YHDx5k5+HsPUoKIWLCYjIsT028GLLrVoF3\nN+xa3dS8pKnLW+9/dej7+4mtcjkKIWa80/W6qui+6yeDvByEEEJ89sOQCh/O6vTp2A9D/d32\nDFunti/wx+87C9prhBBCTMiV33XxtiVCNHrJPdv8O5LzWBp2az5oselcSucR/YQQd08M3P4g\nsc/PFyeVuFO/bJ2hrda1O9LZlkM+h8lkioyMVHAAZANHR0cHBwej0RgTk/EPCl4JeqUHAGxK\nqf8MZfMrdkKo0v/nsaVqR51KRJ3//viNem8UcBFCBE07dG/aw7WpCWcnnosoOfiXf9tLCCEa\njpkrZtVcu+hi6PQ3mx+80Nhk7/mw6oQpLT7ZZDIZE15+zzb4DuR0lobd5P/d9Xv/h6UTGwoh\nTk/ab+8WPLdBgEYEzP2oaI1vZgmhZNgJIYxG4/M3wqssLe3hRyb4WQPIgV6TP00p0eeFEK6B\nGd+H1dgX+HVK+8Yjv63st9qvdJVqVavWqF2/RfN3PLUqIURSxC9Gk+nPmZVVMzPuMPrPaCGE\n3t0z4ti2r7ftP3vxr7+vXzt/+o+bUckO7lbY82vI0rC7npxaOqiA+fHX/7vnVXa2uaud/J1S\nE/+0zWwAACAHufL170KIGjXzPLmqxidf3+044ocftu7df/DQjhXfLZ09eFDVH87sqeflINQ6\nIUSZT76cXjtfhq+ydysvhNg4pE6L2Xt8K9R+r1bVxm+9O2RCuZvd6/W9a4U9v4YsDbu3XO3P\n/fS7CCmTHLVj9b2Ehisqmpcf3/yPnb64zcYDAAA5gik1YujSi3ZOpYcXyHjSpCHuwsmzUV7l\nKrXuPrR196FCiPO/TCzZcMyAUafOLQpy8GyoUQ1MjQqsX79a+pekJoZt3PKHTzl9SuzRVrP3\nFGi4+O+t3dPXfmWNPdvqG5GzWXq5k/Edi93e3+m9rgNbB7dWaT0n18ibmnR50ae9ehwKz13l\nE5uOCAAAlJWWGjHr47f2RyfXnPCtsybjh+zi7yyqWrVqy89OpS8p9MabQojU+FQhhNah6LiS\nnpdWdtgVnpC+weo+Tdq0aXNdLVITwowmk2f5SumrEm4fnnkzVgjTS+759WTpK3ZVp+0ed/Pd\nyV/NM6gcO806WMbJLu7m5t6jFjvnD/52fVObjggAALLZ1dUzRvzuLoQQIi363vX9WzefvZMY\n0PTTrYPKPbmxW6HxdXN9sWtijYZXOlUt5Z8Wde2HZV9q7LzGTa5g3mDgzwuXFmvXoEjpD1u/\nXynA88zutSt3XCzTcWX73HqR1rquV+890xv3tRtaKb/+ytmjyxZvKeLjkHLj5LxV6zu3HPfi\ne34tqbJ0Qk1qwv14jaebvVoIkZpw7qf9UW/XC3J7otyzmcFgiI5+TT8j+frQ6/V6vd5oNHIG\n9CvKZfoEpUcAbCg2ZIxSh/b29rbuDh+cb+Zd8vtHlzi6eBYqXbV1l0GhXepqHlk+ubD7lKQW\nsbeXCiES7xweNmDs5l3/uxUR7+iRt2Jw/YFjp35Q/r+rwERf/HXYsCmb956ISNH5FyvZqk/o\nqC7vas3Xoruxq0/30J3HzsTa5alYqdqQafOqJi57s964WwanKw9ue0b+9sJ7fg1ZGnZBQUHN\n1u8Ymj/j9erCD/dvMSrywO6VNpjNUoTd64Cwe9URdpCbTGGHV9pz3oqNuXr5dopRCHH06FH/\n8+cvxGc4w9l05qf9hw9cs9V0AAAAsNhzwm7ju1U6X4wwP/7uncrfPW0b10J9rD0VAAAAsuw5\nYVdtwqzFUUlCiJ49e9acOLtNLscMG6jtXIKaNbfVdAAAALDYc8IusFWHQCGEEGvWrPmgc9ce\n+ZS8JywAAAAyYenlTvbs2SOEiPjnyr14w5NrAwMDrTkUAAAAss7SsEu6v7NZ9VY/X4h46tps\nvwkxAAAAMrI07L5o0v6XS7GNew1/t2yh1/baMAAAADmZpWE36dg9/1bf/7jwfZtOAwAAgBdm\n0a3UTMbYewajX6uytp4GAAAAL8yisFNpnN92d7iy4ritpwEAAMALs/CtWNWarRMr1vmo48T4\nqYPb5XGy9A1cAADwComNjbXRnl1cXGy0ZzzK0kRrPnxznrx2X4/p+M3YLp4+Po6ax06guHHj\nhg1mAwAA2U03KdTq+0wZ9anV94mnsjTsvL29vb3r+pW36TAAAAB4cZaG3aZNm2w6BwAAAF6S\nRSdPAAAAIOfL2mkQF3atXf3rket3I2pMXdza7vBvt8rWLJ3bRpMBAAAgSywPO9PCTtX7rDhs\nfqIfPa9R3LxaFbbW6Dp/55I+3IsCAABAcZa+FfvXqqZ9Vhyu02fOH5dumpd4BEyb3D1o39K+\n7y8Os9l4AAAAsJSlYTdpyA7PEsN3fj6gbNF85iVaffHhiw+NL+O1b9xEm40HAAAAS1kadhvu\nJxbp2PbJ5R9+7J/04EerjgQAAIAXYWnYFbTXxF6KeXJ55NlojX0+q44EAABeF0cnVlerNTPP\nRDy60Jh8vaKLvW/tWUpN9eqyNOxGVsl9+duPj95PenRhwq3dndZe8a4wzAaDAQAA+VUZua1Z\nPv24Bn0T0/5buCek8ekUrzWb+io316vK0rBruvaLgqrrNQuX7zF0ghDi7JovJ4Z0LBlQ/3pa\n3vnrW9pyQgAAIC2VxvmLHVOSb675cOEZ85KE8O+bLDxbe9q2YDedsrO9iiwNO8dcDU/9saXZ\nm+pls8YJIfaOGjJ25rcuVVtsOnW6WV4nGw4IAACk5lGi74auJXYNbXAsziCEmPZeL41v2y39\nygohjCk3J/f+sHBud3tnzzI1W6w4HJ7+Vde2LW70ZklPJ/tcvv6th8yJNZoU+wfkJFm4QLFr\nQIPvdjdYfu/q2b9upWoc8weUyu9ub7vJAADAa6LR579WWVe0RZtvDg/8fcKJiM/Pz3dQCyFE\naHDFpQk15q3YVMJLffj7+V1qFE09f7NrgFtKzIGyjfu8Hbrk58WVEq4f+bhN//cD3t3Ts7jS\n/w7lZe3OE0IIx1yF38hV2BajAACA15NGl3/95v6+tbrV3q0N6LC2d6C7ECLu5qxpx+7vi1oV\n7KoTQlSsUtOwxWtC70NddzRMitgWa0zr3btt1Tx6UanCzo15L7t4KP2PyBEyC7sKFSqo1PYn\nTxw1P85ky1OnTll5LgAA8DrJW3ParKorQ045XFjUxLwkKuxXkymthttjbw+6p4QJ0dDZd1Db\nSssbFyxcs8E71d96q16DDxqXzqPE1DlOZmHn7OysUj/8brq7u2fLPAAA4DVVpZyH3QV/fweN\n+amdm6Na6x4fF/7ojUtVKq0QQm3nver4rZEHt+3cd+DQrhVTh/etFfLLL5/VU2LqnCWzsDtw\n4ED64z179th+GAAAgIfc/LuZjFsWXk8aHOAmhBDCNLRu8N12X33TKSB838ypP6bOnjGsVPWG\nA4Q4M7dqpVGfiM94/9Diz9gFBQU1W79jaH7nDMvDD/dvMSrywO6V1h4MgFTWl5uv9AiADb0r\nxig9goQcPBvNruc7ovp7TvNGBBXz2LF86NxDN7dtKCiEsM8TPWfmxOg8vt3rllPHXJn/xUW3\nwBCl580RnhN2MVcv304xCiGOHj3qf/78hXjXx9ebzvy0//CBa7aaDgAAvMb6bT2R0L/75N4t\nw5PtA8vXWrn/hzru9kIIj+ITfpkZOezzITVGRLj5FKxUq/vexUOVHjZHUJlMmV335atAr84X\nIzLZQAjhWqhP9NXPrTpV1hgMhujoaAUHQDbQ6/V6vd5oNEZGRio9C17Etu25lB4BsKF337mn\n1KG9vb2tuLfY2FjdpFAr7tAsZdSnLi4uVt8tnvScV+yqTZi1OCpJCNGzZ8+aE2e3yeWYYQO1\nnUtQs+a2mg4AAAAWe07YBbbqECiEEGLNmjUfdO7aI1/Gz9gBAAAgh7D05IlnnRVrSkuIjReu\nLnrrjQQAAIAXYem9Yp/ln50feuUqYZVRAAAA8DIsfcXOZIz7fGC3r3cdf5CY+ujy8Ot/qxxL\n2mAwAAAAZI2lr9idmvB2/8/XxLgXLpY39dq1a8XLli9Xtrj2wS2VZ62Fm7fZdEQAAABYwtJX\n7EbOP+tVetLFw6EmY5y/s0f1z78JLeCSeHdf6cIN4/I52XREAAAAWMLSsDsQk1JiSGMhhErj\n3D63fvfJB6EFXBxz1/ymY6EmzZcOPPuJLYcEAADZJGXUp0qPgBdnadh5aFWGWIP5cZX8Tus2\n3xRNCgkh/Jrmj1o2WwjCDgAAGWz+0fX5G2VRk/dirL5PPJWln7Hr6uty+avPbiQbhRAF3vf9\n5+cvzMvDd92x1WgAAADICkvDrseX3RLvfV/Eu+DVJGORj7sm3F0Z1OmT6RMGNZ55xrPUMJuO\nCAAAAEtY+lZs3prTTm3MO37Jj2qVcMrbY/XADe3mzDhqMrkWqb9hWw+bjggAAABLWBp2Qohy\nHw76/sNB5setZu1oMOji1XiHkoEF7VS2GQ0AAABZkYWwE8K4f/3ild//+uelGwlGbb4ipd75\noF2JwIK2Gg0AAABZYeln7NIM9wbU8q/Zsu/ydb9ef5CYFnt776ZvhrR/xz+4911Dmk1HBAAA\ngCUsDbvDIXXn7b1ea8D8q1Fxt66Gnbn8T1zM3wsG1b55aFHdoYdtOiIAAAAsYWnYjVhxwaP4\n6N1z+vq52JmXaJ0K9J61a3wpr4tfj7DZeAAAQHKNvfQ657Jhj9+M/kivkq4FuEpullkWdqbU\nozEphds0fXLNB+0LG+JPW3koAADwOjHE/9nw41VKTyEDi8LOZDK4alX3j1x9ctXfh+47eDa2\n9lQAAOA1Uqhlm783dhr/212lB3nlWRR2KrXjV11K3djRbtIPZx5dfu7HKW1+vt5mwSTbzAYA\nAF4L3hWHf9vG/7MGre887YzM1IQLI9rXz+fprHNyq1Cr5frTEdk/4avC0sudXCrSurzrxNEf\nlllSNujNEgGuqthLYScO/37d3q2i3a5pvXY93Mw5b8/pY8rZalgAACCplsu3zchVqt7gX0/P\nb/D4mrQ+lYJWJ76xcMWWYq5J62cObFulQv67l4JcdMoMmrNZGnbDR4wVQmi12vBzx348d+zh\nF2u1xvjTy5b99xk775LvEnYAACCrNA5Ff1jX1a/xB0v63+0R4Ja+PObahC/CIlf8s+kjXych\nxJvBbx3wzNN3zrkTo8srN2zOZelZsQbL3P6jiU3HBQAAsirQYMG0mt4hdXrGp5nSF949uMdO\nH9jB18n8VKVxCynqdn3dJYVmzOksDTsAAABb6//DBo+7GxpM+V/6EpPJlCFXNBqVyZj6xJdC\nCMIOAADkHDrXoO0L3js0rv4PtxPMS3K/FWxIOL86/OFTkzF25sWoAs0ClQqOClMAACAASURB\nVJsxRyPsAABADhLYZX2/4pppm/82P3UrPL5TgHvP6i3W/nLg1KEdI5tXPpqcZ35IaWWHzLEI\nOwAAkKNoJu9Y7qr9N1FU2iUnD3avnDygdf3KdZv9HFnmu99OVXfllNins/SsWAAAAFvY+iAh\nwxK9zwfRBmP6UzvnUtO/2zk9e6d6RWX2il3tcqW7HLhtflyiRIkJ12OzZSQAAAC8iMxesbt1\n+eKlyUsPjqlvpxZhYWGnj/32222Xp25ZpUoV24wHAAAAS2UWdov6Vq89bWzwtrHmpxub19v4\njC1NJtMz1gAAACCbZBZ2tabuvtJi/4kr4UaTqXXr1u/M/bJzHn22TQYAAIAsec7JE4XfqFH4\nDSGE2LBhQ/2WLVv5OGXHUAAAAMg6S8+KXb9+vU3nAAAAwEvK2uVOEm7+vmHzjnNXbiUYtXn9\nS73zQfNKBZxtNBkAAACyJAtht3FM63afrkt+5L68oQN7tghdtXZCMxsMBgAAgKyxNOyurm/X\nfOLaArW6zBjZvXq5onpV8uU/Dy+ZNHjZxOa68ldXNi1kyyEBAEA2afJejNIj4MVZGnYzBm5x\n9u0YtnOpXq0yL3mjVrNKNRuk+fms6zdTNJ1vswkBAED2cT1h/Vs8xFQKsfo+8VSW3it2zb2E\nYt0HpFedmUqtH9A3MPHeahsMBgAAgKyxNOyc1eqkO0lPLk+6k6TScP4EAACA8iwNu4EBbpe/\n6X08MvnRhSnRJ/suu+hWdIDlx1vRq8Oae4mPLEjbu+bzIb07t2zfbezUZVcTjZatAgAAQEaW\nhl2nDRPsE/94q1C5XqFTv127ccPab6eO6l3Or9qJBN349Z0s24fp8sEvN92KSn3k/mNXNo6a\nvfZIUNNuYwd+rP9rZ+jgpSYLVgEAAOBJlp484R7Y+9wO7Ue9Ry6ePHzxvws9A2ssWLCyZ3H3\n5355+IE5o744dDf6sRf8hCll1trzRdvPal63sBCi6FTRosP01bfbt83rlNkqAAAAPI2lr9gJ\nIfLX6r73/L0b549t27p589Ztx85dvxe2r2edgpZ8rWfZ5sPHTpkxddijC5Oj919PMjaonc/8\n1N4juJyz7ti+O5mvAgAAwFNl7c4TQqjyF38jf/EsH0bnlr+omzCmODy6MCX+tBCipP6/GUrp\ntdvPRGe+ymzevHm3bt0yP/bz8+vcuXOWZ8IrRavVCiHUarWLi4vSswBARkr9aYqLi1PkuMix\nshp21pSWHC+E8LbTpC/xttMYYgyZrzL73//+FxYWZn5cvnz5Xr16Zc/MUJZKpbK3t1d6CgDI\nSKk/TYRdusjLYRHOfkV8HIUQKpVqyJWoGYXdMtler1G3CXuwPMAj/UF2TWpbSoad2l4vhIgw\npPnoHr4jfN9g1HpoM19lVrp0aVdXV/Njf39/g8EgIDWNRqNWq00mU2pqqtKzAEBG/GdIcWsa\nVFvYeNufsysLIXr27BnkolN6ImUoGXZ2+jJC7AtLNPjoHv4fnYuJqW6l3DJfZTZ8+PD0xwaD\nITo6WkBqer1er9enpaXxswaQA/GnSSmm1DiVNuP1dBctWmTr46YaTVqN6vnbZTsLT55IS05O\nNlj7ciMO7rV8dZqfD98zPzXEnTwem1Kxlk/mqwAAgDQS7ixXa/S/Lx1UzC+v3sGtVOXaUzec\nT1+beOdgrw9r+Lg7a+31hUsHf7bxonm5p51m/vXrg1vU8vFtK4To5+vS+3LkmTlVnHK1EEKo\nVKqhV6Mz+fIn/TawjEu+/z7Wde9kb43W9UJixveI8tlrJ5/b17hEbp2dxsu3SNeJm8zLUxMu\njGhfP5+ns87JrUKtlutPR1jnu5N1FoWdyRjrrnest+4vKx9cZTekefFLy8ftPnnx1pU/l42e\n5eRbr30+p+esAgAAMjElVx/wfbsx83ftWPdxecOIlmWn//kwjEKqNd54q+TyLbuOH9wxoK4x\ntHWVf1Ie3rBgQ9dG7g2H7jvyhRBi9tUHc4t4lOp7IPLmY7c5zeTLMyg9rE98+JLt/96IYfug\nzbnfmBXo+JQ3Nue/3aL0kOVnL51fOiRo+ZimE/6OESKtT6WgBQdM01ZsOfjT6rrOv7etUuFI\nbIq1vj1ZYtFbsSqN25ASnt98eUy0KmLdwxdtNal38pzvZo1+kKQqUq7mxCHdVBasAgAA0jCZ\n0mou2TW2fVEhRFBw/Yj9njM6bQo53kUI4d9z5PKO/RrlchRCFC8yctDc907HG/LrNEKIu4Xn\njulU27wHrU5npxIqrU6neyxsMvnyDJzy9mzgMXjcqr/e6VvSmHJz4JE7TQ++/9Rp3T9Y/VnX\nOkKIEoO/DRy97sjfcTGmWV+ERa74Z9NHvk5CiDeD3zrgmafvnHMnRpe33jfJUpZ+xm70gZ9/\nf6tRn3mOE3o09rJ/ynfEEhpd/i1btjy2SKWp12FIvQ5P2zqTVQAAQCK9GuVPf9yuU5F5n60S\noosQYtDgHrs3b5h29sK1a1dPHdj66JcU7VjyubvN5MufNK5z0TpTl4q+s2/t7h9tFzCzUq6n\nblaka+n0x95atTCJuwf32OkDO/g+fF9RpXELKerWc90loUTYWXqB4sYtQxPzFFw08MNcepe8\n+f0KP86mIwIAgNeHWqc2mVKEEMbkG42KFmg9cU20xju48UfzN3z36Gauns857zXzL39SySED\n4m7O2xedvGbIvkIfznd+xrkR9i4ZXxQzmUwZgkqjUZmMylzDwdJX7BwcHITI16hRPptOAwAA\nXkOLf7nZuN3Dj3utW/6XS8HxQojIsCHbriffvvhjHju1ECLh7qos7TOrX+7k0+V9z37Dvtz4\ne1jE1G1VLD9Q7reCDQmTV4cntPHRCyFMxtiZF6MK9AvM0rTWYmnY/fjjjzadAwAAvLb2d683\nJW1O3QDnAys/nXQuasLxVkIIe683TWnrZ67d1+ftQjfP7P9saKgQ4sxfd+q/4ffkHjQqEXv5\nQni4v4+Pt3lJJl/+rI+Uje5WrHJIRwfPpgMKZOFWIm6Fx3cKWNizegv1/OHFXJPWzeh/NDnP\nnpDSz/9KG8jCvWIBAABs4ecd43dM61Oj5gdLf0udtPr3URW9hRAu+UO2Teu9eUTL4qWqDZ65\ns8/3Z7u8kT/0rTJhCU95l7PGoCZxu7sEVhmcviRLX25WYtDgNKOh9Cdjsza9Srvk5MHulZMH\ntK5fuW6znyPLfPfbqequylwhWWUyZeHydBd2rV3965HrdyNqTF3c2u7wb7fK1iyd23bDWYgL\nFL8OzBcoNhqNkZGRSs+CF7Ft+9M/hgzI4d137il1aG9vbyvuLTY21vXEdCvu0CymUsizbqeb\ncGe5k0/X8wmG4k+7tkg2i70x181v6N7I+Bpur+qNKyz/JpoWdqreZ8Vh8xP96HmN4ubVqrC1\nRtf5O5f00XIlEgAA8OoypSSlxC/pNN2z5PhXt+qE5W/F/rWqaZ8Vh+v0mfPHpZvmJR4B0yZ3\nD9q3tO/7i8NsNh4AAJCbxsHBQekZRMLdlY4OniOOiCkbeys9y0ux9BW7SUN2eJYYvvPzAf99\npb748MWHUg57Tx03UfTK2okq0nCZPkHpEV4j5suBZ+HjrHg5sSFjlB4BgPz0eTomJnZUegqh\nz90+7ETFPGXLu7/i70Ja+ordhvuJRTq2fXL5hx/7Jz3ghFkAAPAqU+kCK1Z41atOWB52Be01\nsZdinlweeTZaY8/F7QAAAJRnadiNrJL78rcfH72f9OjChFu7O6294l1hmA0GAwAAQNZYGnZN\n135RUHW9ZuHyPYZOEEKcXfPlxJCOJQPqX0/LO399S1tOCAAAAItYevKEY66Gp/7Y0rPHkGWz\nxgkh9o4ask+lKVWr5abPFzbO62TDAQEAQDaKqRSi9Ah4cVm4GKBrQIPvdjdYfu/q2b9upWoc\n8weUyu9ub7vJAAAAkCVZucpzWuLPX89b/eOusKvhqVonv8ByjVp26vp+lVf+BBIAAPAv193W\nvwNETO1n3sUL1mXpZ+yMKf90rlqoUefhqzbvuxmVYoi8sW31F92bVC3RODTWmIWbkgEAAMBG\nLA27ff3e+erY3bf7z78aFXfratiZy//ExVz7fMDbF36aXHfcCZuOCAAAAEtYGnaha654BI7a\nM7evn4udeYnWqWCfOXvGlPA8vWCkzcYDAACApSwNu3MJhsJtmz25vFkH/5TY36w6EgAAAF6E\npWHXxMvx/m9/P7n8xpH79q7BVh0JAAAAL8LSsJu0tMutX9t9tvX8owsv/jK99dbrZftPsMFg\nAAAAyJrMTmnu16/fo0/fzq8e8V7JJRWD3ywR4KqKvRR2Yv/xKxpdnvc9DgtR0cZzAgAA4DlU\nJtMzL1ZiZ2dn4V4MBoOV5nkRBoMhOjpakUO7TOfVSkgrNmSMFfe2bXsuK+4NyGnefeeeUof2\n9va24t5iY2NtdB07FxeXZ63Va9Rtwh4sD/Cw+nFfXsxfK995J+R0ZJGEiEMqlWrIlagZhd0y\nbDPGz+2nzvtOjC3/AvuPvBwW4exXxMfRGsMKkflbsQaLWWsaAACAnONo95F/ufQ+88dGIUTP\nnj2DXHTW3f+aBtU+mPqnFXdo/SoHAAB4FaUaTVrNY3fUSghPci/7tn8BHyHEokWLbHEI67L0\n5AkhROLtsJ1bv1/7NLabDwAAvD5SEy6MaF8/n6ezzsmtQq2W609HCCE+KehWqNE28wYnQsur\nVKoBFyLNT9vlcSrWfl+GnRjizn7StkExX3e9u0+9tsPOxRsy2bkQIp+9dvK5fY1L5NbZabx8\ni3SduMm8fHYRjw/P3b+8pqa9SyUhhEqlGno1WggR/8/Ozo1qFPDUe/gEdv/sh0c/02ZMuTm5\n94eFc7vbO3uWqdlixeHwTA7Rz9el9+XIM3OqOOVqYa1voKWv2F3bGFKpzawIQ9pT17Zq1cpa\nAwEAgNdVWp9KQasT31i4Yksx16T1Mwe2rVIh/91L7XoFzJ8+S4h3hRA/fXfNTqfZvfiSmF3Z\nEP/nmnuJ/UeWeWwfppRuFd7a6tRg6Vc/+Wjvzu3VuUY19f0/pjxr5+Z3V+e/3aLD5OXTaxU7\nv3lisyFNC34cPcbPdcD5O77l840svebctzX/GzHlZv0y74X5vb9g5c950m7NHNRhzc24gH/X\nhgZXXJpQY96KTSW81Ie/n9+lRtHU8ze7Brg99RCzrz4IKOnzRYMtJ2dWtdZ30NKw69djQYym\nwNjPp9QqWVBrw1cQAQDAayrm2oQvwiJX/LPpI18nIcSbwW8d8MzTd865/V27JI3svSsqubZL\n0ux/YseMKjNt2Xoxu3LEmSkqu1xjHz/rIuJ8yDdXUvZEfF3TTSeEKLP7ToPWq+4Z0uxvPn3n\nJ0aXF0K4f7D6s651hBAlBn8bOHrdkb/jhJ+rWqfTqVQqjU6n++900hvbuh+Ndz528NsKznZC\niKrVXFxzNzGvirs5a9qx+/uiVgW76oQQFavUNGzxmtD7UNcdDZ96CK2fq51KqLQ6nc5qH42z\ndEe7o5LLjd88rns5ax0YAADgUXcP7rHTB3bwdTI/VWncQoq69Vx3yWl0j4rOA2cevvNmqa8S\nHMoO7NZlzMRPbqVMDZvxm2eJCe6Pv+D0z5bDDh7vmKtOCOHs2/PAgZ5CiMvP2LkYXV4IUaRr\n6fQ9eGvV4pmXDBF/r7no5NPVXHVCCAev9971cLgphBAiKuxXkymthpv9o9u7p4QJ0TBLh3gZ\nlobdW666hNwONhkBAABACJPJlOHT/xqNymRMFUI9vrpPj6nHrzXc6lHyE+e8zQvrBk29En1r\nb3i5Re9k2ElacppK/ZRiefbOhRDC3sXSIlJpVEI8lpK57NTmsLNzc1Rr3ePjwh9drVJps3qI\nl2HpyROzJ9Q9HtL5+N1Em04DAABeW7nfCjYknF8dnmB+ajLGzrwYVaBZoBDizbHB909N2bn8\nr+IDKwuVXWigx7YZqzc+SBxVzzfDTnwbl02K+PlE3MMTJhLurMybN++e6ORMdp4lfq0D48OX\n/fHvCRmGuBPf339YR27+3UzG6IXXk+wf0oU2qtN11ZWsfydenKXxWKrvD90+zxVUsGidBm8X\n8NZnWLt06VJrDwYAAF4vboXHdwpY2LN6C/X84cVck9bN6H80Oc+ekNJCCO8KkzQJ/iP/El/U\nySuECB5comvHwfrcH6W/5ZrOu/z89/Ksb1iv+/LJvfPp7s/rPSjZrXUtN3vh+sydZ0n+eosr\n64vUrdlxyeTePqq7C0d093R6WFMOno1m1/MdUf09p3kjgop57Fg+dO6hm9s2FMxkbxqViL18\nITzc38fHOheatjTsDg4P/vxCpBCRu375/smTJwg7AADwslTaJScPenUfMKB1/Qcp2pJV3v3u\nt8XVXXVCCI19oWF+rp+G+7TLrRdC+NbvZkrbX6hVn6fsQ+O89s/dQ7uNHNC27j2jW6W6Xfcu\nnpD5zrNErfPdfnpzry4jOjapJZzztw5dv3DzRyP/Xdtv64mE/t0n924ZnmwfWL7Wyv0/1HG3\nz2RvNQY1GTm0S2CV1tF/f5PVSZ4qs1uKPaqss+6qZ5MdB5ZU9fO0yoGtiFuKAbbALcUAy3FL\nscxlfksxWJFFPzxTWvyZhNTgJVNyYNUBAADAzKKTJ1QqrZ+9JvJ3xf7vCAAAAJ7LsrNiVfZb\n57cPm9tozo9nbHPVFQAAALwsS99H7/n1JV9t7KD3ywx3z5PL2S7D2hs3blh7MAAAAGSNpWHn\n7e3tXb9xeZvOAgAAgJdgadht2rTJpnMAAADgJVl65wkAAADkcJa+Ypf5heLc3NysMQwAAFBY\nTO1UpUfAi7M07Nzd3TNZa+FVjgEAAGA7lobduHHjHntuSr115dwPazdHqHzHLZps9bEAAIAi\n4kc8cefQl+Y0hReAsomlYTd27NgnF86Z/ludYjXnzD0R2qmdVacCAABAlr3UyROOeaosnVD+\n/h+z90UnW2sgAAAAvJiXPStWn1+vUmkC9RkvWQwAAIBs9lJhl2a4N3v073bOFXzsuGwKAACA\nwiz9jF1QUNATy9JuXzr994OkN0Z9bt2ZAAAA8AIsDbunURcoU/uDOh9NC61itXEAAADwoiwN\nuyNHjth0DgAAALykzMLuwoULFu4lMDDQGsMAAAA8lHBnuZNP16tJqYXsNbY7il6jbhP2YHmA\nx7M2iLwcFuHsV8TH8SX3kz0yC7vixYtbuBfuPAEAAKS0pkG1hY23/Tm7stKDWCSzsMt4t4nH\npRkerJy9+GqCQa1xtvJQAAAAr4FUo0mrseatPjK7TMnYZ2sTlHf3N19dTTAUrP7RtnP/WHEg\nAADwWkm8c7DXhzV83J219vrCpYM/23jx0bXRFzfVLV/IUefgW7zqhG9PmRde27a40ZslPZ3s\nc/n6tx4yJ9b48J3D1IQLI9rXz+fprHNyq1Cr5frTEUIIYUpWqVSf3ohN36ennabLpcjHhnjG\nNv18XXpfjjwzp4pTrhZCCGPKzcm9Pyyc293e2bNMzRYrDodn+Lf8NrCMS75e6U/vneyt0bpe\nSEzNsFk+e+3kc/sal8its9N4+RbpOnFTZvNnRZavP5cSdXZUu2qB9Xv8FpEndOnOqwdW1ivm\nltWdAAAAmIVUa7zxVsnlW3YdP7hjQF1jaOsq/6QY09c2rj6s5oBZu3dt7hdsN+7jN0YfvZsS\nc6Bs4z6ahoN/3n907edDDy4Y+v5S81kBaX0qBS04YJq2YsvBn1bXdf69bZUKR2JTXma22Vcf\nzC3iUarvgcibq4UQocEVZx7QTlqx6ciuTT2qmrrUKLrsUvSj25ce1ic+fMn2yId35No+aHPu\nN2YFOj7lDdL5b7coPWT52Uvnlw4JWj6m6YS/Y6wyf5Yud5K2a9no7gOmX01MrdZu1LKFo0u4\n6rJ0MAAAgAz8e45c3rFfo1yOQojiRUYOmvve6XhDft3DEyYqfrFjdCt/IURQcP2IA56LuqwO\n+elurDGtd++2VfPoRaUKOzfmveziIYSIuTbhi7DIFf9s+sjXSQjxZvBbBzzz9J1z7sSoEi88\nm1ans1MJlVan02njbs6aduz+vqhVwa46IUTFKjUNW7wm9D7UdUfD9O2d8vZs4DF43Kq/3ulb\n0phyc+CRO00Pvv/UPbt/sPqzrnWEECUGfxs4et2Rv+NiTLOePv/o8pYPbOkrdtEXtrcPLlS3\n2+R7uYOWbL946NuJVB0AAHh5gwb30B/YMG3iqN5d2tWq2i7D2n71fdMff9SpSNw/6519B7Wt\nlKdxwcJ1Pmg/dvri+35BjWvkEULcPbjHTh/YwdfJvLFK4xZS1O36ukvWmjMq7FeTKa2Gm73q\nX4PDImKvhGXYbFznomemLhVC3NrdP9ouYGalXE/dW5GupdMfe2vVwmSd+Z8fdqbUyC9Hf5S/\nVIPvjkS2DV127dLebnWLZukYAAAAT2VMvtGoaIHWE9dEa7yDG380f8N3GTZ49MwCnadOpbZX\n23mvOn7rj11fvf9m/vO7VtQtl7/B8B3i4TU6HgsbjUZlMmb8fJsQaSnPv5jHU7axc3NUa90T\nkx5z5/yADJuVHDIg7ua8fdHJa4bsK/ThfOdnnBth75LxXVOL58/Mc8Lur13LagX4dZm0yqNq\n21/O3lg1qYun1prnbgAAgNdZZNiQbdeTz/zvx09HDmzzYYOSPlEZNvh8x630x9/OveAe+HH4\nvpmDhk4vVb3hgNAp67YdPT7rjd0LPhFC5H4r2JBwfnV4gnljkzF25sWoAs0eXmo3wpBmfhB/\n+7t4Y9pTh8l8Gzf/biZj9MLrSfYP6UIb1em66kqGzZx8urzvaT/sy42jwyL6TMnC3bkyn99C\nmX3Gbkz74EmrDqm1Xt2nLJ3Yra5GGB88ePDULb28vLJ0VAAAACGEvdebprT1M9fu6/N2oZtn\n9n82NFQIceavO/Xf8DNvsLVD3anJc+oUddr79cTJ5+Pmnm1iL2bNmTkxOo9v97rl1DFX5n9x\n0S0wRAjhVnh8p4CFPau3UM8fXsw1ad2M/keT8+wJKS1Uuqqu9mt7fNZuQU+7B+cmdu2vVj3x\nKpXK/lnbaFQi9vKF8HB/H59Gs+v5jqj+ntO8EUHFPHYsHzr30M1tGwo++Y8a3a1Y5ZCODp5N\nBxRwsfxb8cz5syKzV+wmfnvQZDIZDfe/GNE6j3dmsnRIAAAAM5f8Idum9d48omXxUtUGz9zZ\n5/uzXd7IH/pWmbCEVCGERpd328wWG8Z3q/52069PaWZsOtOvuLtH8Qm/zOx7YtGQGm9WbNRu\n8L2K3ffuGyqEECrtkpMHu1dOHtC6fuW6zX6OLPPdb6equ+qEEJt/nVfs9prqJf3LVmt4O+jT\nJl4OT07yrG1qDGoSt7tLYJXBQoh+W0+Mbuo5uXfLN4Mbf/173pX7j9Vxt39yVyUGDU4zGkp/\nMjZr34tnz5+FfWRy04h+/fpZuJf58+dn6ajWZTAYoqOjn7+dDbhMn6DIcYFsEBsyxop727b9\n6R8fBuTw7jv3lDq0dV9eiY2NjR9h/c9cOU0xubhk4bUrGzGlJd6JFD5emd0czJJtniv2xlw3\nv6F7I+NruGX3maaZvRWrbK4BAABYkUrt6PO8z45Zsk1mTClJKfFLOk33LDk++6tOZPE6dgAA\nAHimhLsrnXy6avW+C0/2VmQAwg4AAMA69Lnbh52omKdseXeFriJC2AEAAFiJShdYsYKCx8/y\nvWIBAACQMxF2AAAAkiDsAAAAJMFn7AAAwH+cpjz/RqrIsQg7AADwUE64jDBeBm/FAgAASIKw\nAwAAkARhBwAAIAnCDgAAQBKEHQAAgCQIOwAAAElIcrkTlUqZW+0CEuPXCrCcUr8vJhPXnMNj\nZAg7lUrl5eWlyKGTFTkqkC2U+rUCXkVK/b48ePBAkeMix5Ih7EwmU2RkpCKH1ityVCBbKPVr\nBbyKlPp94RU7ZCBD2AkhjEaj0iMAsuHXCrAcvy/IITh5AgAAQBKEHQAAgCQIOwAAAEkQdgAA\nAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJEHYAAACSIOwA\nAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACAJAg7AAAASRB2AAAAkiDsAAAAJKFV\negAAr4X2+UYrPQJgQ/eUHgAw4xU7AAAASRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAA\nIAnCDgAAQBKEHQAAgCQIOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4A\nAEAShB0AAIAkCDsAAABJEHYAAACSIOwAAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQd\nAACAJAg7AAAASRB2AAAAkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAAQBKEHQAAgCQI\nOwAAAEkQdgAAAJIg7AAAACRB2AEAAEiCsAMAAJAEYQcAACAJwg4AAEAShB0AAIAkCDsAAABJ\nEHYAAACSIOwAAAAkQdgBAABIgrADAACQBGEHAAAgCcIOAABAEoQdAACAJAg7AAAASRB2AAAA\nkiDsAAAAJEHYAQAASIKwAwAAkARhBwAAIAnCDgAAQBKEHQAAgCS0yh7+zpHQblP+fHRJj6/X\nNfJwEEIIkbZ3zcIf95+8EaspUbpKx/6dCjtqFBkSAADglaBw2EX9HuXo9d6AbqXSl/g76cwP\nrmwcNXvt3+379O3skbp1yYLQwamrFvVUKTQnAABAzqdw2N09F+Neslq1aqUyrjClzFp7vmj7\nWc3rFhZCFJ0qWnSYvvp2+7Z5nRSYEgAA4FWg8Gfs/ohJ9qjgbkyMCb8bZXpkeXL0/utJxga1\n85mf2nsEl3PWHdt3R5EhAQAAXgkKv2J3Ks6QdnBey/lhBpNJ65SrftsBPd4rK4RIiT8thCip\n/2+8Unrt9jPR6U/nzZt369Yt82M/P7/OnTtn7+CA/FxcXJQeAXhlNhzxHAAAEiBJREFUKPX7\nEhcXp8hxkWMpGXbGlJvRKk0hz6Cp3010M8Yc/WnZzKWj7AO+6VjcPS05Xgjhbfff2RLedhpD\njCH96f/+97+wsDDz4/Lly/fq1SubhzdLVuSoQLawt7dXegTglaHU7wthhwyUDDuNznfDhg3/\nPvOu2Wb4xe2tdi8703FGdbW9XggRYUjz0T18s/i+waj1+G/aypUr58+f3/zYz88vOZnEAqyM\nXyvAcvy+IIdQ+K3YDCrldtwdee//7d15dFTl3cDxZ5gsNOwCEkENsriBBRXl4FpQKnbB1qKC\nqLjXpaKvuCOWrfpaKlLXUkVbcUEtfVE8lkpFoIqVKi5FRTiIIrKUNYY1IZn3j1BEmiKehtzh\n4fP5a5Y7c3858jjfzL0zCSHkFhwWwrQ5G8oK87b8DjR3w+YG7Rps3bJ///5bL5eVlRUXF4ck\nOFJFxEpKSpIeAXYb1gtZIskPT6yZe/9FF1+5rLRiy/VM+bQl6xseemAIoXbDri3y0i/OWF55\nT9naWW+WlB7RtTCpUQEAsl+SYVe/1VmN1y+7ccjoN2fPnff+O0+NumH6unqXXnxgCCGkcgf0\nOnjemMFTZs1d/PE/Hh40sk6L7uc2910nAAD/UZKHYmvlNBl2/5BHf/PEr4ffsjGnfqs27W8c\nNfTwurmV97Y5a/gVm0Y9OXLQyo2p1h1OHDbgEt9ODACwAwmfY5ffqN1lN99+WZX3pdLd+w3o\n3q+GJwIA2F0l/AXFAABUF2EHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEH\nABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQiZykBwD2DMU3Jz0B7FLrkh4AQvCOHQBANIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJHKSHqB6pFKppEeA2FhWsPOS\nWi+ZTCaR/ZK1Ygi7VCrVuHHjRHb9eId7E9kv1IBzGt9Trc+3oVqfDbJLUi9DK1euTGS/ZK0Y\nwi6TyfiXDdWuupdVQbU+G2SXpF6GvGPHdmIIu+BfNuwClhXsPOuFLOHDEwAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkchJeoDd27nNByU9Auwqy5MeAIBvyjt2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACRyEl6AGCPsGRyedIjwK50bNIDQAjBO3YAANEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACR8HUn/53im5OeAHaddUkPAMA34x07AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEjkJD3A7m3J5PKkR4Bd5tikBwDg\nG/KOHQBAJLL5HbuKqeMemDh91mcl6UPadz6//wUHfCud9EgAANkre9+x+3j8rXc//XqX0y/5\n+TXnFcz/y8BrH8okPRIAQDbL1rDLlI58+sM25w7vdXKXdkcef82dV679/MWnlqxLeiwAgOyV\npWG3qXj6wo3lp3ZrXnk1v9HxHerm/X3asmSnAgDIZll6jl3puvdCCIcWfDleu4Kcl2YXb716\nzz33LF68uPJyUVHRhRdeWMMTVlodyhLZL9SAevXqVeOzWSzErXrXy85bu3ZtIvsla2Vp2FVs\nWhdCaJL75aclmuSmy7748oVh5syZc+bMqbzcsWPHyy+/vIYn/BevVUQrPz+/Wp/PYiFm1b1e\ndpawYztZGna18gtCCKvKKgrzthwsXlFWntPoy2mPPvrofffdt/JyUVHRpk2ban7IEEKju3IT\n2e8eKCcnJ51OZzKZ0tLSpGfZU1TvsrJYalJlZJSVlVVUVCQ9y54iqZch2E6Whl1uwWEhTJuz\noawwb8vvQHM3bG7QrsHWDfr377/1cllZWXFx8fZPQVwKCgoKCgoqKipKSkqSngWyXWXYbdy4\nUW3AniZLPzxRu2HXFnnpF2csr7xatnbWmyWlR3QtTHYqAIBslqVhF1K5A3odPG/M4Cmz5i7+\n+B8PDxpZp0X3c5vXSXosAIDslaWHYkMIbc4afsWmUU+OHLRyY6p1hxOHDbgklfRIAADZLJXJ\n7PZ/0ME5dnuCynPsysvLV69enfQskO2aNGkSQigpKXGO3Z6g8j83VMrWQ7EAAHxDwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASOUkPADtl0aJFK1asyMvLa9myZdKzQFbLZDIzZswIIeyz\nzz716tVLehygRqUymUzSM8DXe+CBBx555JGioqLx48cnPQtktfLy8s6dO4cQhg8f3qNHj6TH\nAWqUQ7EAAJEQdgAAkRB2AACRcI4du4f58+cvWLCgoKDgmGOOSXoWyGqZTObll18OIbRv376w\nsDDpcYAaJewAACLhUCwAQCSEHQBAJHxBMTXhrev7Dflo9XY3FjQ9a9yYvrtoj71OO+2EB5/o\n37zuLnp+qHmD+vR6d11pn9+O61NYsO3ts+64ZPDryw7oNfLX57XZwcMtCtgTCDtqSO2G3W67\n4eRtb0nn7Z3UMLCbSqVTr4yd2+f6jl/elCkdM2tFOpVKbiggiwg7akit3Kbt27f/5o+rKM/U\nSnvNghBCCM26fnv5q2NKM/fm/WtRrP38ycWh8Lj6KxYmOhiQJYQdCavYvHL8Q6P/POO9VZtq\ntWjd4Uf9Lj3p4EYhhH6n/6j7oCvfvHv0guLyBs1a971uUKuF40c+NnnZxlqtj+h22/UX1kun\nQgilaz4Y88DY19+b/0VpRZPmbXqcfVWvY1rs5C5gt1O/6Lz09BueXFRy/n5b/gjsR4+91rjj\nT/Pn/nLrNl+7KKwIiJgPT1BDKsqWf/hVFSGEEMbedM2ED9LnXD1wxPBbehyUueemn760eH3l\nQybcMaFH/+G/uffOLvlLHrzpqjteDVcPvev263p/+rfn75q5vHKbR28YOmPVfv0HDR9557Ce\nHSrGjrhuxeaK7Xa9g13AbqZW/kWHN37193O2XM2UPvL2iuP6HbztJl+7KKwIiJh37KghG9dM\nufHGKdveMm7Cc7VWP/fHeV/c/tSAdgU5IYTWB7bfPLPvuAc/+O6wTiGE1hff0qNTixDCmZe2\nnXTr2z+/uV9Rfjq0bN6z8RNvfFgcuuwdQmjW48yrTvpBpwZ5IYR9C894eOKwTzZublI378v9\nrpywg13Abufg845b+T8PbazoVLtWqmTRE4tTLfq2qDt6mw12vCisCIibsKOGVPkZ2BWL3s5k\nMjf3Pn3bG+tsXhRCpxBCw0PqV96SUzenVm7Tovx05dV66VSo2PLF2qf9qMd7b7z2x4WfL1u2\n7OMP/v7v+127w13Abqfuvn33rfXc7z4puaxV/Y8ee63pkVfmfvUk1B0vCisC4ibsSFJOnbxU\nus6zzzy27QtTKpWuatsqThuoKFsx7PIr59Vtd8qxHdsddUj3nide23/of7EL2B2kci88sum9\nj/7jsqFHPfrOyhNGHbjtnV+7KKwIiJtz7EhSQbNTQsX6F5eX5W6RM3borfdOXbqTD1+7aMys\n5WX33TXo3DN6ntDlyP0ara32XUAWOvC8E1d98PCSTx9fkirq3bzOtnd97aKwIiBuwo4k5dXr\ndHHHxo/fOGzSX9/65OOPJoy+aeKHK7t1abqTD8+t1zaT2Tzhr7P/uWLZnFlTRgz8fQhh4dI1\n254o/l/uArJQncLerXKKh941uenRF+R89Tjs1y4KKwLi5lAsCfvBbXdv+u19z/7mztVluS0O\n+Pa1dwzsUCd3Jx/7rSanDz7/nw89ducL69Mt23Y4++b7G9z1s7E3XNXpqSeraxeQjVLpCzrv\nPXDq4j4D2253z84sCisCIpbKZDJJzwAAQDVwKBYAIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDqhapmLd03ff3K1zu73q18kraLB/63ZnXX7r1IVV/N02ALKELygGqpCpWN//\nuFb3vb5sn8NP/UnXjoUNcj+b99Yfn560qlbhqDfe/VmHxkkPCEAVhB1QhQV/6NnqjIldBr0w\nY+j3t964fvErR7U9ZcG3un6x/M/b/YlSALKBQ7FAFT4Y+WYIYeT13be9saB51zHnt92w8qU/\nrNiQ0FwA7IiwA6pQu1FeCOEP76za7vYjhr8we/bs7o3yK6+u/XT6Nb1P2b9pw/w6ex18eLch\no1+sCCGEUPLpE/Vy0m3OfmLrA5dOH5hKpXrc/XbNzA+wZ3IoFqjCshnXFR57Vzq38U8uvaLX\nD0/t9p2jG+ent9tm3eIJHdqcuTDVou8Fvdo0Sb879dlnp33c8bxH3/79+SGE14edcOzPXx38\n+tLbOu9dvunT45sdNLfosqXvjHIMF2DXEXZA1V5/5NYrBt/zzmclIYRa6XodjvvOySd3P+Oc\nfke1rF+5wZD2TX6xYO9pC2d1aVy78pYJAw7/8ch3hs9fM7BVg0zFhgvb7jNu9RELlv5l+iWH\nnD2u5E+LP+7+ry0B2BWEHbADmYWz/zal0iuvfv5FaSqV892rRk/69YWb179fu+5hh177xnu/\nOmrr1qXF0/MbnnjYdTPfG3FUCGHtomdaHNCncc9en/7fs73GfPj0BQcl94MA7BGEHbBzMpve\n/NPj11/Uf+rS9f0mfXZfu3H19ru+yg33P2Xyp5NOrrw8844TO98yvemRty17c4hjsAC7Wk7S\nAwBZp3zTwl69r27+nV/cf/WhX96ayu/0vYuem7GuQaurXxr8bhifF0I47IZHRnRrvt3D8xt0\n3Hp5/pylIYSSBa8tK60ozPNpLYBdy/9nge2l8wpnvDjxiVFj//2uvAatQgh5e9Wuvdf30qnU\n5jUHnbKNk04oWrNmTaplQeXGS6bd2nfsvB/88rbUmiknXfV8jf4MAHskYQf8m1Tefd/fv/iT\n/+07aspXztXIlD58xTUhhDOHd8ip3WbwoXvNG9vv5aXrt97/1JWn9enTZ2GtEELYvOGjnj8c\n0bTTLc9fP+SFAYd/+FCvEW+vrNkfA2CP4xw7oArlGxec1+nIJ99f3az98ace17Fp/drrVy2Z\n+crEv88v7njBb99+5JIQwtqFz7Q7sO+S9H4/7t3zyLZ7zZ7y9NjJHxx2/tj3Hj0nhPDAaS37\nTyqdvHRB10b5FZtX/bD5fq9UHPvJkkl75/p9EmBXEXZA1TLlXzwz6vbfjZ/41ocLV5WU1m3U\nrN0RXc644Oqrex+z9WMQxXP/fOONdzw39a1VpXmtDjz0rCsH3npRj5xUWPj8FUWnPXja6Pcn\nXLrlLL2V7/6q2eE3HPzTCbMf7JnUTwQQPWEHABAJx0QAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACLx/45zJICKbVo5AAAA\nAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data, aes(sex, fill=target)) + \n",
    "  geom_bar() +\n",
    "  labs(fill=\"Disease\", x=\"Sex\", y=\"Number of patients\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7218e2c5",
   "metadata": {
    "papermill": {
     "duration": 0.007501,
     "end_time": "2023-03-03T12:39:47.260022",
     "exception": false,
     "start_time": "2023-03-03T12:39:47.252521",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Patients with a heart rate during exercise lower than 100:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "b80e6e16",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:47.278306Z",
     "iopub.status.busy": "2023-03-03T12:39:47.276414Z",
     "iopub.status.idle": "2023-03-03T12:39:47.324762Z",
     "shell.execute_reply": "2023-03-03T12:39:47.322573Z"
    },
    "papermill": {
     "duration": 0.061564,
     "end_time": "2023-03-03T12:39:47.328826",
     "exception": false,
     "start_time": "2023-03-03T12:39:47.267262",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 8 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>age</th><th scope=col>thalach</th><th scope=col>target</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>73</th><td>62</td><td>99</td><td>No           </td></tr>\n",
       "\t<tr><th scope=row>115</th><td>62</td><td>97</td><td>partially no </td></tr>\n",
       "\t<tr><th scope=row>155</th><td>64</td><td>96</td><td>low confident</td></tr>\n",
       "\t<tr><th scope=row>176</th><td>57</td><td>88</td><td>No           </td></tr>\n",
       "\t<tr><th scope=row>224</th><td>53</td><td>95</td><td>low confident</td></tr>\n",
       "\t<tr><th scope=row>245</th><td>60</td><td>96</td><td>Yes          </td></tr>\n",
       "\t<tr><th scope=row>246</th><td>67</td><td>71</td><td>partially no </td></tr>\n",
       "\t<tr><th scope=row>297</th><td>59</td><td>90</td><td>low confident</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 8 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & age & thalach & target\\\\\n",
       "  & <int> & <int> & <fct>\\\\\n",
       "\\hline\n",
       "\t73 & 62 & 99 & No           \\\\\n",
       "\t115 & 62 & 97 & partially no \\\\\n",
       "\t155 & 64 & 96 & low confident\\\\\n",
       "\t176 & 57 & 88 & No           \\\\\n",
       "\t224 & 53 & 95 & low confident\\\\\n",
       "\t245 & 60 & 96 & Yes          \\\\\n",
       "\t246 & 67 & 71 & partially no \\\\\n",
       "\t297 & 59 & 90 & low confident\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 8 × 3\n",
       "\n",
       "| <!--/--> | age &lt;int&gt; | thalach &lt;int&gt; | target &lt;fct&gt; |\n",
       "|---|---|---|---|\n",
       "| 73 | 62 | 99 | No            |\n",
       "| 115 | 62 | 97 | partially no  |\n",
       "| 155 | 64 | 96 | low confident |\n",
       "| 176 | 57 | 88 | No            |\n",
       "| 224 | 53 | 95 | low confident |\n",
       "| 245 | 60 | 96 | Yes           |\n",
       "| 246 | 67 | 71 | partially no  |\n",
       "| 297 | 59 | 90 | low confident |\n",
       "\n"
      ],
      "text/plain": [
       "    age thalach target       \n",
       "73  62  99      No           \n",
       "115 62  97      partially no \n",
       "155 64  96      low confident\n",
       "176 57  88      No           \n",
       "224 53  95      low confident\n",
       "245 60  96      Yes          \n",
       "246 67  71      partially no \n",
       "297 59  90      low confident"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "data[data$thalach < 100, c(\"age\", \"thalach\", \"target\")]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9064faf1",
   "metadata": {
    "papermill": {
     "duration": 0.006989,
     "end_time": "2023-03-03T12:39:47.342868",
     "exception": false,
     "start_time": "2023-03-03T12:39:47.335879",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Naive Bayes Model starts here"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3573bbc6",
   "metadata": {
    "papermill": {
     "duration": 0.007001,
     "end_time": "2023-03-03T12:39:47.356795",
     "exception": false,
     "start_time": "2023-03-03T12:39:47.349794",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "To compare the models we first divide the dataset in a training set with 70% of instances and a test set with the rest of the instances. And this taking into account that the distribution of the target has to be the same in both sets."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "d75744f0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:47.374793Z",
     "iopub.status.busy": "2023-03-03T12:39:47.372920Z",
     "iopub.status.idle": "2023-03-03T12:39:47.406591Z",
     "shell.execute_reply": "2023-03-03T12:39:47.404360Z"
    },
    "papermill": {
     "duration": 0.045673,
     "end_time": "2023-03-03T12:39:47.409402",
     "exception": false,
     "start_time": "2023-03-03T12:39:47.363729",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "set.seed(8)\n",
    "training_indeces <- createDataPartition(data$target, p = .7, list = FALSE)\n",
    "data.train <- data[ training_indeces,]\n",
    "data.test  <- data[-training_indeces,]\n",
    "\n",
    "# 10 fold Cross-validation\n",
    "fitControl <- trainControl(method=\"cv\", number=10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "606f2bdc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:47.427429Z",
     "iopub.status.busy": "2023-03-03T12:39:47.425566Z",
     "iopub.status.idle": "2023-03-03T12:39:48.924392Z",
     "shell.execute_reply": "2023-03-03T12:39:48.922130Z"
    },
    "papermill": {
     "duration": 1.511047,
     "end_time": "2023-03-03T12:39:48.927331",
     "exception": false,
     "start_time": "2023-03-03T12:39:47.416284",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Naive Bayes \n",
       "\n",
       "214 samples\n",
       " 14 predictor\n",
       "  5 classes: 'Yes', 'No', 'partially no', 'low confident', 'absoulutely no' \n",
       "\n",
       "No pre-processing\n",
       "Resampling: Cross-Validated (10 fold) \n",
       "Summary of sample sizes: 192, 193, 194, 192, 193, 192, ... \n",
       "Resampling results across tuning parameters:\n",
       "\n",
       "  usekernel  Accuracy   Kappa     \n",
       "  FALSE      0.1950866  0.04409537\n",
       "   TRUE      0.5190693  0.07215229\n",
       "\n",
       "Tuning parameter 'laplace' was held constant at a value of 0\n",
       "Tuning\n",
       " parameter 'adjust' was held constant at a value of 1\n",
       "Accuracy was used to select the optimal model using the largest value.\n",
       "The final values used for the model were laplace = 0, usekernel = TRUE\n",
       " and adjust = 1."
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "set.seed(8)\n",
    "model.nb <- train(target ~ ., \n",
    "              data = data.train,\n",
    "              method = \"naive_bayes\",\n",
    "              trControl = fitControl)\n",
    "model.nb"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "733acf1c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:48.945610Z",
     "iopub.status.busy": "2023-03-03T12:39:48.943626Z",
     "iopub.status.idle": "2023-03-03T12:39:49.006735Z",
     "shell.execute_reply": "2023-03-03T12:39:49.004406Z"
    },
    "papermill": {
     "duration": 0.075296,
     "end_time": "2023-03-03T12:39:49.009582",
     "exception": false,
     "start_time": "2023-03-03T12:39:48.934286",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Confusion Matrix and Statistics\n",
       "\n",
       "                Reference\n",
       "Prediction       Yes No partially no low confident absoulutely no\n",
       "  Yes             48 16            6             8              2\n",
       "  No               0  0            2             0              0\n",
       "  partially no     0  0            2             2              1\n",
       "  low confident    0  0            0             0              0\n",
       "  absoulutely no   0  0            0             0              0\n",
       "\n",
       "Overall Statistics\n",
       "                                          \n",
       "               Accuracy : 0.5747          \n",
       "                 95% CI : (0.4641, 0.6801)\n",
       "    No Information Rate : 0.5517          \n",
       "    P-Value [Acc > NIR] : 0.3746          \n",
       "                                          \n",
       "                  Kappa : 0.1174          \n",
       "                                          \n",
       " Mcnemar's Test P-Value : NA              \n",
       "\n",
       "Statistics by Class:\n",
       "\n",
       "                     Class: Yes Class: No Class: partially no\n",
       "Sensitivity              1.0000   0.00000             0.20000\n",
       "Specificity              0.1795   0.97183             0.96104\n",
       "Pos Pred Value           0.6000   0.00000             0.40000\n",
       "Neg Pred Value           1.0000   0.81176             0.90244\n",
       "Prevalence               0.5517   0.18391             0.11494\n",
       "Detection Rate           0.5517   0.00000             0.02299\n",
       "Detection Prevalence     0.9195   0.02299             0.05747\n",
       "Balanced Accuracy        0.5897   0.48592             0.58052\n",
       "                     Class: low confident Class: absoulutely no\n",
       "Sensitivity                        0.0000               0.00000\n",
       "Specificity                        1.0000               1.00000\n",
       "Pos Pred Value                        NaN                   NaN\n",
       "Neg Pred Value                     0.8851               0.96552\n",
       "Prevalence                         0.1149               0.03448\n",
       "Detection Rate                     0.0000               0.00000\n",
       "Detection Prevalence               0.0000               0.00000\n",
       "Balanced Accuracy                  0.5000               0.50000"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "preds <- predict(model.nb, data.test)\n",
    "confusionMatrix(preds, data.test$target)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "aaaed979",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:49.029081Z",
     "iopub.status.busy": "2023-03-03T12:39:49.026939Z",
     "iopub.status.idle": "2023-03-03T12:39:49.084314Z",
     "shell.execute_reply": "2023-03-03T12:39:49.081116Z"
    },
    "papermill": {
     "duration": 0.070881,
     "end_time": "2023-03-03T12:39:49.087746",
     "exception": false,
     "start_time": "2023-03-03T12:39:49.016865",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Confusion Matrix and Statistics\n",
       "\n",
       "                Reference\n",
       "Prediction       Yes No partially no low confident absoulutely no\n",
       "  Yes             48 16            6             8              2\n",
       "  No               0  0            2             0              0\n",
       "  partially no     0  0            2             2              1\n",
       "  low confident    0  0            0             0              0\n",
       "  absoulutely no   0  0            0             0              0\n",
       "\n",
       "Overall Statistics\n",
       "                                          \n",
       "               Accuracy : 0.5747          \n",
       "                 95% CI : (0.4641, 0.6801)\n",
       "    No Information Rate : 0.5517          \n",
       "    P-Value [Acc > NIR] : 0.3746          \n",
       "                                          \n",
       "                  Kappa : 0.1174          \n",
       "                                          \n",
       " Mcnemar's Test P-Value : NA              \n",
       "\n",
       "Statistics by Class:\n",
       "\n",
       "                     Class: Yes Class: No Class: partially no\n",
       "Sensitivity              1.0000   0.00000             0.20000\n",
       "Specificity              0.1795   0.97183             0.96104\n",
       "Pos Pred Value           0.6000   0.00000             0.40000\n",
       "Neg Pred Value           1.0000   0.81176             0.90244\n",
       "Prevalence               0.5517   0.18391             0.11494\n",
       "Detection Rate           0.5517   0.00000             0.02299\n",
       "Detection Prevalence     0.9195   0.02299             0.05747\n",
       "Balanced Accuracy        0.5897   0.48592             0.58052\n",
       "                     Class: low confident Class: absoulutely no\n",
       "Sensitivity                        0.0000               0.00000\n",
       "Specificity                        1.0000               1.00000\n",
       "Pos Pred Value                        NaN                   NaN\n",
       "Neg Pred Value                     0.8851               0.96552\n",
       "Prevalence                         0.1149               0.03448\n",
       "Detection Rate                     0.0000               0.00000\n",
       "Detection Prevalence               0.0000               0.00000\n",
       "Balanced Accuracy                  0.5000               0.50000"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "preds.nb <- predict(model.nb, data.test)\n",
    "confusionMatrix(preds.nb, data.test$target)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "d1708b0e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T12:39:49.107195Z",
     "iopub.status.busy": "2023-03-03T12:39:49.105186Z",
     "iopub.status.idle": "2023-03-03T12:39:49.164562Z",
     "shell.execute_reply": "2023-03-03T12:39:49.162275Z"
    },
    "papermill": {
     "duration": 0.072581,
     "end_time": "2023-03-03T12:39:49.167824",
     "exception": false,
     "start_time": "2023-03-03T12:39:49.095243",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Confusion Matrix and Statistics\n",
       "\n",
       "                Reference\n",
       "Prediction       Yes No partially no low confident absoulutely no\n",
       "  Yes             48 16            6             8              2\n",
       "  No               0  0            2             0              0\n",
       "  partially no     0  0            2             2              1\n",
       "  low confident    0  0            0             0              0\n",
       "  absoulutely no   0  0            0             0              0\n",
       "\n",
       "Overall Statistics\n",
       "                                          \n",
       "               Accuracy : 0.5747          \n",
       "                 95% CI : (0.4641, 0.6801)\n",
       "    No Information Rate : 0.5517          \n",
       "    P-Value [Acc > NIR] : 0.3746          \n",
       "                                          \n",
       "                  Kappa : 0.1174          \n",
       "                                          \n",
       " Mcnemar's Test P-Value : NA              \n",
       "\n",
       "Statistics by Class:\n",
       "\n",
       "                     Class: Yes Class: No Class: partially no\n",
       "Sensitivity              1.0000   0.00000             0.20000\n",
       "Specificity              0.1795   0.97183             0.96104\n",
       "Pos Pred Value           0.6000   0.00000             0.40000\n",
       "Neg Pred Value           1.0000   0.81176             0.90244\n",
       "Prevalence               0.5517   0.18391             0.11494\n",
       "Detection Rate           0.5517   0.00000             0.02299\n",
       "Detection Prevalence     0.9195   0.02299             0.05747\n",
       "Balanced Accuracy        0.5897   0.48592             0.58052\n",
       "                     Class: low confident Class: absoulutely no\n",
       "Sensitivity                        0.0000               0.00000\n",
       "Specificity                        1.0000               1.00000\n",
       "Pos Pred Value                        NaN                   NaN\n",
       "Neg Pred Value                     0.8851               0.96552\n",
       "Prevalence                         0.1149               0.03448\n",
       "Detection Rate                     0.0000               0.00000\n",
       "Detection Prevalence               0.0000               0.00000\n",
       "Balanced Accuracy                  0.5000               0.50000"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "preds.tree <- predict(model.nb, data.test)\n",
    "confusionMatrix(preds.tree, data.test$target)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 12.243586,
   "end_time": "2023-03-03T12:39:49.300214",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-03T12:39:37.056628",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
