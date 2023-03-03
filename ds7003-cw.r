{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "53c358a9",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:38.928718Z",
     "iopub.status.busy": "2023-03-03T11:45:38.925800Z",
     "iopub.status.idle": "2023-03-03T11:45:42.581694Z",
     "shell.execute_reply": "2023-03-03T11:45:42.579822Z"
    },
    "papermill": {
     "duration": 3.667754,
     "end_time": "2023-03-03T11:45:42.585175",
     "exception": false,
     "start_time": "2023-03-03T11:45:38.917421",
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
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>93</li><li>159</li><li>164</li><li>165</li><li>252</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 93\n",
       "\\item 159\n",
       "\\item 164\n",
       "\\item 165\n",
       "\\item 252\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 93\n",
       "2. 159\n",
       "3. 164\n",
       "4. 165\n",
       "5. 252\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1]  93 159 164 165 252"
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
       "<caption>A data.frame: 296 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>X</th><th scope=col>age</th><th scope=col>sex</th><th scope=col>cp</th><th scope=col>trestbps</th><th scope=col>chol</th><th scope=col>fbs</th><th scope=col>restecg</th><th scope=col>thalach</th><th scope=col>exang</th><th scope=col>oldpeak</th><th scope=col>slope</th><th scope=col>ca</th><th scope=col>thal</th><th scope=col>target</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td> 1</td><td>63</td><td>1</td><td>3</td><td>145</td><td>233</td><td>1</td><td>0</td><td>150</td><td>0</td><td>2.3</td><td>0</td><td>0</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>2</th><td> 2</td><td>37</td><td>1</td><td>2</td><td>130</td><td>250</td><td>0</td><td>1</td><td>187</td><td>0</td><td>3.5</td><td>0</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>3</th><td> 3</td><td>41</td><td>0</td><td>1</td><td>130</td><td>204</td><td>0</td><td>0</td><td>172</td><td>0</td><td>1.4</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>4</th><td> 4</td><td>56</td><td>1</td><td>1</td><td>120</td><td>236</td><td>0</td><td>1</td><td>178</td><td>0</td><td>0.8</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>5</th><td> 5</td><td>57</td><td>0</td><td>0</td><td>120</td><td>354</td><td>0</td><td>1</td><td>163</td><td>1</td><td>0.6</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>6</th><td> 6</td><td>57</td><td>1</td><td>0</td><td>140</td><td>192</td><td>0</td><td>1</td><td>148</td><td>0</td><td>0.4</td><td>1</td><td>0</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>7</th><td> 7</td><td>56</td><td>0</td><td>1</td><td>140</td><td>294</td><td>0</td><td>0</td><td>153</td><td>0</td><td>1.3</td><td>1</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>8</th><td> 8</td><td>44</td><td>1</td><td>1</td><td>120</td><td>263</td><td>0</td><td>1</td><td>173</td><td>0</td><td>0.0</td><td>2</td><td>0</td><td>3</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>9</th><td> 9</td><td>52</td><td>1</td><td>2</td><td>172</td><td>199</td><td>1</td><td>1</td><td>162</td><td>0</td><td>0.5</td><td>2</td><td>0</td><td>3</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>10</td><td>57</td><td>1</td><td>2</td><td>150</td><td>168</td><td>0</td><td>1</td><td>174</td><td>0</td><td>1.6</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>11</th><td>11</td><td>54</td><td>1</td><td>0</td><td>140</td><td>239</td><td>0</td><td>1</td><td>160</td><td>0</td><td>1.2</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>12</td><td>48</td><td>0</td><td>2</td><td>130</td><td>275</td><td>0</td><td>1</td><td>139</td><td>0</td><td>0.2</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>13</th><td>13</td><td>49</td><td>1</td><td>1</td><td>130</td><td>266</td><td>0</td><td>1</td><td>171</td><td>0</td><td>0.6</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>14</th><td>14</td><td>64</td><td>1</td><td>3</td><td>110</td><td>211</td><td>0</td><td>0</td><td>144</td><td>1</td><td>1.8</td><td>1</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>15</th><td>15</td><td>58</td><td>0</td><td>3</td><td>150</td><td>283</td><td>1</td><td>0</td><td>162</td><td>0</td><td>1.0</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>16</th><td>16</td><td>50</td><td>0</td><td>2</td><td>120</td><td>219</td><td>0</td><td>1</td><td>158</td><td>0</td><td>1.6</td><td>1</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>17</th><td>17</td><td>58</td><td>0</td><td>2</td><td>120</td><td>340</td><td>0</td><td>1</td><td>172</td><td>0</td><td>0.0</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>18</th><td>18</td><td>66</td><td>0</td><td>3</td><td>150</td><td>226</td><td>0</td><td>1</td><td>114</td><td>0</td><td>2.6</td><td>0</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>19</th><td>19</td><td>43</td><td>1</td><td>0</td><td>150</td><td>247</td><td>0</td><td>1</td><td>171</td><td>0</td><td>1.5</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>20</th><td>20</td><td>69</td><td>0</td><td>3</td><td>140</td><td>239</td><td>0</td><td>1</td><td>151</td><td>0</td><td>1.8</td><td>2</td><td>2</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>21</th><td>21</td><td>59</td><td>1</td><td>0</td><td>135</td><td>234</td><td>0</td><td>1</td><td>161</td><td>0</td><td>0.5</td><td>1</td><td>0</td><td>3</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>22</th><td>22</td><td>44</td><td>1</td><td>2</td><td>130</td><td>233</td><td>0</td><td>1</td><td>179</td><td>1</td><td>0.4</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>23</th><td>23</td><td>42</td><td>1</td><td>0</td><td>140</td><td>226</td><td>0</td><td>1</td><td>178</td><td>0</td><td>0.0</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>24</th><td>24</td><td>61</td><td>1</td><td>2</td><td>150</td><td>243</td><td>1</td><td>1</td><td>137</td><td>1</td><td>1.0</td><td>1</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>25</th><td>25</td><td>40</td><td>1</td><td>3</td><td>140</td><td>199</td><td>0</td><td>1</td><td>178</td><td>1</td><td>1.4</td><td>2</td><td>0</td><td>3</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>26</th><td>26</td><td>71</td><td>0</td><td>1</td><td>160</td><td>302</td><td>0</td><td>1</td><td>162</td><td>0</td><td>0.4</td><td>2</td><td>2</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>27</th><td>27</td><td>59</td><td>1</td><td>2</td><td>150</td><td>212</td><td>1</td><td>1</td><td>157</td><td>0</td><td>1.6</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>28</th><td>28</td><td>51</td><td>1</td><td>2</td><td>110</td><td>175</td><td>0</td><td>1</td><td>123</td><td>0</td><td>0.6</td><td>2</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>29</th><td>29</td><td>65</td><td>0</td><td>2</td><td>140</td><td>417</td><td>1</td><td>0</td><td>157</td><td>0</td><td>0.8</td><td>2</td><td>1</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>30</th><td>30</td><td>53</td><td>1</td><td>2</td><td>130</td><td>197</td><td>1</td><td>0</td><td>152</td><td>0</td><td>1.2</td><td>0</td><td>0</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>⋮</th><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><th scope=row>273</th><td>273</td><td>67</td><td>1</td><td>0</td><td>120</td><td>237</td><td>0</td><td>1</td><td> 71</td><td>0</td><td>1.0</td><td>1</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>274</th><td>274</td><td>58</td><td>1</td><td>0</td><td>100</td><td>234</td><td>0</td><td>1</td><td>156</td><td>0</td><td>0.1</td><td>2</td><td>1</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>275</th><td>275</td><td>47</td><td>1</td><td>0</td><td>110</td><td>275</td><td>0</td><td>0</td><td>118</td><td>1</td><td>1.0</td><td>1</td><td>1</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>276</th><td>276</td><td>52</td><td>1</td><td>0</td><td>125</td><td>212</td><td>0</td><td>1</td><td>168</td><td>0</td><td>1.0</td><td>2</td><td>2</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>277</th><td>277</td><td>58</td><td>1</td><td>0</td><td>146</td><td>218</td><td>0</td><td>1</td><td>105</td><td>0</td><td>2.0</td><td>1</td><td>1</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>278</th><td>278</td><td>57</td><td>1</td><td>1</td><td>124</td><td>261</td><td>0</td><td>1</td><td>141</td><td>0</td><td>0.3</td><td>2</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>279</th><td>279</td><td>58</td><td>0</td><td>1</td><td>136</td><td>319</td><td>1</td><td>0</td><td>152</td><td>0</td><td>0.0</td><td>2</td><td>2</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>280</th><td>280</td><td>61</td><td>1</td><td>0</td><td>138</td><td>166</td><td>0</td><td>0</td><td>125</td><td>1</td><td>3.6</td><td>1</td><td>1</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>281</th><td>281</td><td>42</td><td>1</td><td>0</td><td>136</td><td>315</td><td>0</td><td>1</td><td>125</td><td>1</td><td>1.8</td><td>1</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>283</th><td>283</td><td>59</td><td>1</td><td>2</td><td>126</td><td>218</td><td>1</td><td>1</td><td>134</td><td>0</td><td>2.2</td><td>1</td><td>1</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>284</th><td>284</td><td>40</td><td>1</td><td>0</td><td>152</td><td>223</td><td>0</td><td>1</td><td>181</td><td>0</td><td>0.0</td><td>2</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>285</th><td>285</td><td>61</td><td>1</td><td>0</td><td>140</td><td>207</td><td>0</td><td>0</td><td>138</td><td>1</td><td>1.9</td><td>2</td><td>1</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>286</th><td>286</td><td>46</td><td>1</td><td>0</td><td>140</td><td>311</td><td>0</td><td>1</td><td>120</td><td>1</td><td>1.8</td><td>1</td><td>2</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>287</th><td>287</td><td>59</td><td>1</td><td>3</td><td>134</td><td>204</td><td>0</td><td>1</td><td>162</td><td>0</td><td>0.8</td><td>2</td><td>2</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>288</th><td>288</td><td>57</td><td>1</td><td>1</td><td>154</td><td>232</td><td>0</td><td>0</td><td>164</td><td>0</td><td>0.0</td><td>2</td><td>1</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>289</th><td>289</td><td>57</td><td>1</td><td>0</td><td>110</td><td>335</td><td>0</td><td>1</td><td>143</td><td>1</td><td>3.0</td><td>1</td><td>1</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>290</th><td>290</td><td>55</td><td>0</td><td>0</td><td>128</td><td>205</td><td>0</td><td>2</td><td>130</td><td>1</td><td>2.0</td><td>1</td><td>1</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>291</th><td>291</td><td>61</td><td>1</td><td>0</td><td>148</td><td>203</td><td>0</td><td>1</td><td>161</td><td>0</td><td>0.0</td><td>2</td><td>1</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>292</th><td>292</td><td>58</td><td>1</td><td>0</td><td>114</td><td>318</td><td>0</td><td>2</td><td>140</td><td>0</td><td>4.4</td><td>0</td><td>3</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>293</th><td>293</td><td>58</td><td>0</td><td>0</td><td>170</td><td>225</td><td>1</td><td>0</td><td>146</td><td>1</td><td>2.8</td><td>1</td><td>2</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>294</th><td>294</td><td>67</td><td>1</td><td>2</td><td>152</td><td>212</td><td>0</td><td>0</td><td>150</td><td>0</td><td>0.8</td><td>1</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>295</th><td>295</td><td>44</td><td>1</td><td>0</td><td>120</td><td>169</td><td>0</td><td>1</td><td>144</td><td>1</td><td>2.8</td><td>0</td><td>0</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>296</th><td>296</td><td>63</td><td>1</td><td>0</td><td>140</td><td>187</td><td>0</td><td>0</td><td>144</td><td>1</td><td>4.0</td><td>2</td><td>2</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>297</th><td>297</td><td>63</td><td>0</td><td>0</td><td>124</td><td>197</td><td>0</td><td>1</td><td>136</td><td>1</td><td>0.0</td><td>1</td><td>0</td><td>2</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>298</th><td>298</td><td>59</td><td>1</td><td>0</td><td>164</td><td>176</td><td>1</td><td>0</td><td> 90</td><td>0</td><td>1.0</td><td>1</td><td>2</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>299</th><td>299</td><td>57</td><td>0</td><td>0</td><td>140</td><td>241</td><td>0</td><td>1</td><td>123</td><td>1</td><td>0.2</td><td>1</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>300</th><td>300</td><td>45</td><td>1</td><td>3</td><td>110</td><td>264</td><td>0</td><td>1</td><td>132</td><td>0</td><td>1.2</td><td>1</td><td>0</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>301</th><td>301</td><td>68</td><td>1</td><td>0</td><td>144</td><td>193</td><td>1</td><td>1</td><td>141</td><td>0</td><td>3.4</td><td>1</td><td>2</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>302</th><td>302</td><td>57</td><td>1</td><td>0</td><td>130</td><td>131</td><td>0</td><td>1</td><td>115</td><td>1</td><td>1.2</td><td>1</td><td>1</td><td>3</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>303</th><td>303</td><td>57</td><td>0</td><td>1</td><td>130</td><td>236</td><td>0</td><td>0</td><td>174</td><td>0</td><td>0.0</td><td>1</td><td>1</td><td>2</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 296 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & X & age & sex & cp & trestbps & chol & fbs & restecg & thalach & exang & oldpeak & slope & ca & thal & target\\\\\n",
       "  & <int> & <int> & <fct> & <fct> & <int> & <int> & <fct> & <fct> & <int> & <fct> & <dbl> & <fct> & <int> & <fct> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 &  1 & 63 & 1 & 3 & 145 & 233 & 1 & 0 & 150 & 0 & 2.3 & 0 & 0 & 1 & 1\\\\\n",
       "\t2 &  2 & 37 & 1 & 2 & 130 & 250 & 0 & 1 & 187 & 0 & 3.5 & 0 & 0 & 2 & 1\\\\\n",
       "\t3 &  3 & 41 & 0 & 1 & 130 & 204 & 0 & 0 & 172 & 0 & 1.4 & 2 & 0 & 2 & 1\\\\\n",
       "\t4 &  4 & 56 & 1 & 1 & 120 & 236 & 0 & 1 & 178 & 0 & 0.8 & 2 & 0 & 2 & 1\\\\\n",
       "\t5 &  5 & 57 & 0 & 0 & 120 & 354 & 0 & 1 & 163 & 1 & 0.6 & 2 & 0 & 2 & 1\\\\\n",
       "\t6 &  6 & 57 & 1 & 0 & 140 & 192 & 0 & 1 & 148 & 0 & 0.4 & 1 & 0 & 1 & 1\\\\\n",
       "\t7 &  7 & 56 & 0 & 1 & 140 & 294 & 0 & 0 & 153 & 0 & 1.3 & 1 & 0 & 2 & 1\\\\\n",
       "\t8 &  8 & 44 & 1 & 1 & 120 & 263 & 0 & 1 & 173 & 0 & 0.0 & 2 & 0 & 3 & 1\\\\\n",
       "\t9 &  9 & 52 & 1 & 2 & 172 & 199 & 1 & 1 & 162 & 0 & 0.5 & 2 & 0 & 3 & 1\\\\\n",
       "\t10 & 10 & 57 & 1 & 2 & 150 & 168 & 0 & 1 & 174 & 0 & 1.6 & 2 & 0 & 2 & 1\\\\\n",
       "\t11 & 11 & 54 & 1 & 0 & 140 & 239 & 0 & 1 & 160 & 0 & 1.2 & 2 & 0 & 2 & 1\\\\\n",
       "\t12 & 12 & 48 & 0 & 2 & 130 & 275 & 0 & 1 & 139 & 0 & 0.2 & 2 & 0 & 2 & 1\\\\\n",
       "\t13 & 13 & 49 & 1 & 1 & 130 & 266 & 0 & 1 & 171 & 0 & 0.6 & 2 & 0 & 2 & 1\\\\\n",
       "\t14 & 14 & 64 & 1 & 3 & 110 & 211 & 0 & 0 & 144 & 1 & 1.8 & 1 & 0 & 2 & 1\\\\\n",
       "\t15 & 15 & 58 & 0 & 3 & 150 & 283 & 1 & 0 & 162 & 0 & 1.0 & 2 & 0 & 2 & 1\\\\\n",
       "\t16 & 16 & 50 & 0 & 2 & 120 & 219 & 0 & 1 & 158 & 0 & 1.6 & 1 & 0 & 2 & 1\\\\\n",
       "\t17 & 17 & 58 & 0 & 2 & 120 & 340 & 0 & 1 & 172 & 0 & 0.0 & 2 & 0 & 2 & 1\\\\\n",
       "\t18 & 18 & 66 & 0 & 3 & 150 & 226 & 0 & 1 & 114 & 0 & 2.6 & 0 & 0 & 2 & 1\\\\\n",
       "\t19 & 19 & 43 & 1 & 0 & 150 & 247 & 0 & 1 & 171 & 0 & 1.5 & 2 & 0 & 2 & 1\\\\\n",
       "\t20 & 20 & 69 & 0 & 3 & 140 & 239 & 0 & 1 & 151 & 0 & 1.8 & 2 & 2 & 2 & 1\\\\\n",
       "\t21 & 21 & 59 & 1 & 0 & 135 & 234 & 0 & 1 & 161 & 0 & 0.5 & 1 & 0 & 3 & 1\\\\\n",
       "\t22 & 22 & 44 & 1 & 2 & 130 & 233 & 0 & 1 & 179 & 1 & 0.4 & 2 & 0 & 2 & 1\\\\\n",
       "\t23 & 23 & 42 & 1 & 0 & 140 & 226 & 0 & 1 & 178 & 0 & 0.0 & 2 & 0 & 2 & 1\\\\\n",
       "\t24 & 24 & 61 & 1 & 2 & 150 & 243 & 1 & 1 & 137 & 1 & 1.0 & 1 & 0 & 2 & 1\\\\\n",
       "\t25 & 25 & 40 & 1 & 3 & 140 & 199 & 0 & 1 & 178 & 1 & 1.4 & 2 & 0 & 3 & 1\\\\\n",
       "\t26 & 26 & 71 & 0 & 1 & 160 & 302 & 0 & 1 & 162 & 0 & 0.4 & 2 & 2 & 2 & 1\\\\\n",
       "\t27 & 27 & 59 & 1 & 2 & 150 & 212 & 1 & 1 & 157 & 0 & 1.6 & 2 & 0 & 2 & 1\\\\\n",
       "\t28 & 28 & 51 & 1 & 2 & 110 & 175 & 0 & 1 & 123 & 0 & 0.6 & 2 & 0 & 2 & 1\\\\\n",
       "\t29 & 29 & 65 & 0 & 2 & 140 & 417 & 1 & 0 & 157 & 0 & 0.8 & 2 & 1 & 2 & 1\\\\\n",
       "\t30 & 30 & 53 & 1 & 2 & 130 & 197 & 1 & 0 & 152 & 0 & 1.2 & 0 & 0 & 2 & 1\\\\\n",
       "\t⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t273 & 273 & 67 & 1 & 0 & 120 & 237 & 0 & 1 &  71 & 0 & 1.0 & 1 & 0 & 2 & 0\\\\\n",
       "\t274 & 274 & 58 & 1 & 0 & 100 & 234 & 0 & 1 & 156 & 0 & 0.1 & 2 & 1 & 3 & 0\\\\\n",
       "\t275 & 275 & 47 & 1 & 0 & 110 & 275 & 0 & 0 & 118 & 1 & 1.0 & 1 & 1 & 2 & 0\\\\\n",
       "\t276 & 276 & 52 & 1 & 0 & 125 & 212 & 0 & 1 & 168 & 0 & 1.0 & 2 & 2 & 3 & 0\\\\\n",
       "\t277 & 277 & 58 & 1 & 0 & 146 & 218 & 0 & 1 & 105 & 0 & 2.0 & 1 & 1 & 3 & 0\\\\\n",
       "\t278 & 278 & 57 & 1 & 1 & 124 & 261 & 0 & 1 & 141 & 0 & 0.3 & 2 & 0 & 3 & 0\\\\\n",
       "\t279 & 279 & 58 & 0 & 1 & 136 & 319 & 1 & 0 & 152 & 0 & 0.0 & 2 & 2 & 2 & 0\\\\\n",
       "\t280 & 280 & 61 & 1 & 0 & 138 & 166 & 0 & 0 & 125 & 1 & 3.6 & 1 & 1 & 2 & 0\\\\\n",
       "\t281 & 281 & 42 & 1 & 0 & 136 & 315 & 0 & 1 & 125 & 1 & 1.8 & 1 & 0 & 1 & 0\\\\\n",
       "\t283 & 283 & 59 & 1 & 2 & 126 & 218 & 1 & 1 & 134 & 0 & 2.2 & 1 & 1 & 1 & 0\\\\\n",
       "\t284 & 284 & 40 & 1 & 0 & 152 & 223 & 0 & 1 & 181 & 0 & 0.0 & 2 & 0 & 3 & 0\\\\\n",
       "\t285 & 285 & 61 & 1 & 0 & 140 & 207 & 0 & 0 & 138 & 1 & 1.9 & 2 & 1 & 3 & 0\\\\\n",
       "\t286 & 286 & 46 & 1 & 0 & 140 & 311 & 0 & 1 & 120 & 1 & 1.8 & 1 & 2 & 3 & 0\\\\\n",
       "\t287 & 287 & 59 & 1 & 3 & 134 & 204 & 0 & 1 & 162 & 0 & 0.8 & 2 & 2 & 2 & 0\\\\\n",
       "\t288 & 288 & 57 & 1 & 1 & 154 & 232 & 0 & 0 & 164 & 0 & 0.0 & 2 & 1 & 2 & 0\\\\\n",
       "\t289 & 289 & 57 & 1 & 0 & 110 & 335 & 0 & 1 & 143 & 1 & 3.0 & 1 & 1 & 3 & 0\\\\\n",
       "\t290 & 290 & 55 & 0 & 0 & 128 & 205 & 0 & 2 & 130 & 1 & 2.0 & 1 & 1 & 3 & 0\\\\\n",
       "\t291 & 291 & 61 & 1 & 0 & 148 & 203 & 0 & 1 & 161 & 0 & 0.0 & 2 & 1 & 3 & 0\\\\\n",
       "\t292 & 292 & 58 & 1 & 0 & 114 & 318 & 0 & 2 & 140 & 0 & 4.4 & 0 & 3 & 1 & 0\\\\\n",
       "\t293 & 293 & 58 & 0 & 0 & 170 & 225 & 1 & 0 & 146 & 1 & 2.8 & 1 & 2 & 1 & 0\\\\\n",
       "\t294 & 294 & 67 & 1 & 2 & 152 & 212 & 0 & 0 & 150 & 0 & 0.8 & 1 & 0 & 3 & 0\\\\\n",
       "\t295 & 295 & 44 & 1 & 0 & 120 & 169 & 0 & 1 & 144 & 1 & 2.8 & 0 & 0 & 1 & 0\\\\\n",
       "\t296 & 296 & 63 & 1 & 0 & 140 & 187 & 0 & 0 & 144 & 1 & 4.0 & 2 & 2 & 3 & 0\\\\\n",
       "\t297 & 297 & 63 & 0 & 0 & 124 & 197 & 0 & 1 & 136 & 1 & 0.0 & 1 & 0 & 2 & 0\\\\\n",
       "\t298 & 298 & 59 & 1 & 0 & 164 & 176 & 1 & 0 &  90 & 0 & 1.0 & 1 & 2 & 1 & 0\\\\\n",
       "\t299 & 299 & 57 & 0 & 0 & 140 & 241 & 0 & 1 & 123 & 1 & 0.2 & 1 & 0 & 3 & 0\\\\\n",
       "\t300 & 300 & 45 & 1 & 3 & 110 & 264 & 0 & 1 & 132 & 0 & 1.2 & 1 & 0 & 3 & 0\\\\\n",
       "\t301 & 301 & 68 & 1 & 0 & 144 & 193 & 1 & 1 & 141 & 0 & 3.4 & 1 & 2 & 3 & 0\\\\\n",
       "\t302 & 302 & 57 & 1 & 0 & 130 & 131 & 0 & 1 & 115 & 1 & 1.2 & 1 & 1 & 3 & 0\\\\\n",
       "\t303 & 303 & 57 & 0 & 1 & 130 & 236 & 0 & 0 & 174 & 0 & 0.0 & 1 & 1 & 2 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 296 × 15\n",
       "\n",
       "| <!--/--> | X &lt;int&gt; | age &lt;int&gt; | sex &lt;fct&gt; | cp &lt;fct&gt; | trestbps &lt;int&gt; | chol &lt;int&gt; | fbs &lt;fct&gt; | restecg &lt;fct&gt; | thalach &lt;int&gt; | exang &lt;fct&gt; | oldpeak &lt;dbl&gt; | slope &lt;fct&gt; | ca &lt;int&gt; | thal &lt;fct&gt; | target &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 |  1 | 63 | 1 | 3 | 145 | 233 | 1 | 0 | 150 | 0 | 2.3 | 0 | 0 | 1 | 1 |\n",
       "| 2 |  2 | 37 | 1 | 2 | 130 | 250 | 0 | 1 | 187 | 0 | 3.5 | 0 | 0 | 2 | 1 |\n",
       "| 3 |  3 | 41 | 0 | 1 | 130 | 204 | 0 | 0 | 172 | 0 | 1.4 | 2 | 0 | 2 | 1 |\n",
       "| 4 |  4 | 56 | 1 | 1 | 120 | 236 | 0 | 1 | 178 | 0 | 0.8 | 2 | 0 | 2 | 1 |\n",
       "| 5 |  5 | 57 | 0 | 0 | 120 | 354 | 0 | 1 | 163 | 1 | 0.6 | 2 | 0 | 2 | 1 |\n",
       "| 6 |  6 | 57 | 1 | 0 | 140 | 192 | 0 | 1 | 148 | 0 | 0.4 | 1 | 0 | 1 | 1 |\n",
       "| 7 |  7 | 56 | 0 | 1 | 140 | 294 | 0 | 0 | 153 | 0 | 1.3 | 1 | 0 | 2 | 1 |\n",
       "| 8 |  8 | 44 | 1 | 1 | 120 | 263 | 0 | 1 | 173 | 0 | 0.0 | 2 | 0 | 3 | 1 |\n",
       "| 9 |  9 | 52 | 1 | 2 | 172 | 199 | 1 | 1 | 162 | 0 | 0.5 | 2 | 0 | 3 | 1 |\n",
       "| 10 | 10 | 57 | 1 | 2 | 150 | 168 | 0 | 1 | 174 | 0 | 1.6 | 2 | 0 | 2 | 1 |\n",
       "| 11 | 11 | 54 | 1 | 0 | 140 | 239 | 0 | 1 | 160 | 0 | 1.2 | 2 | 0 | 2 | 1 |\n",
       "| 12 | 12 | 48 | 0 | 2 | 130 | 275 | 0 | 1 | 139 | 0 | 0.2 | 2 | 0 | 2 | 1 |\n",
       "| 13 | 13 | 49 | 1 | 1 | 130 | 266 | 0 | 1 | 171 | 0 | 0.6 | 2 | 0 | 2 | 1 |\n",
       "| 14 | 14 | 64 | 1 | 3 | 110 | 211 | 0 | 0 | 144 | 1 | 1.8 | 1 | 0 | 2 | 1 |\n",
       "| 15 | 15 | 58 | 0 | 3 | 150 | 283 | 1 | 0 | 162 | 0 | 1.0 | 2 | 0 | 2 | 1 |\n",
       "| 16 | 16 | 50 | 0 | 2 | 120 | 219 | 0 | 1 | 158 | 0 | 1.6 | 1 | 0 | 2 | 1 |\n",
       "| 17 | 17 | 58 | 0 | 2 | 120 | 340 | 0 | 1 | 172 | 0 | 0.0 | 2 | 0 | 2 | 1 |\n",
       "| 18 | 18 | 66 | 0 | 3 | 150 | 226 | 0 | 1 | 114 | 0 | 2.6 | 0 | 0 | 2 | 1 |\n",
       "| 19 | 19 | 43 | 1 | 0 | 150 | 247 | 0 | 1 | 171 | 0 | 1.5 | 2 | 0 | 2 | 1 |\n",
       "| 20 | 20 | 69 | 0 | 3 | 140 | 239 | 0 | 1 | 151 | 0 | 1.8 | 2 | 2 | 2 | 1 |\n",
       "| 21 | 21 | 59 | 1 | 0 | 135 | 234 | 0 | 1 | 161 | 0 | 0.5 | 1 | 0 | 3 | 1 |\n",
       "| 22 | 22 | 44 | 1 | 2 | 130 | 233 | 0 | 1 | 179 | 1 | 0.4 | 2 | 0 | 2 | 1 |\n",
       "| 23 | 23 | 42 | 1 | 0 | 140 | 226 | 0 | 1 | 178 | 0 | 0.0 | 2 | 0 | 2 | 1 |\n",
       "| 24 | 24 | 61 | 1 | 2 | 150 | 243 | 1 | 1 | 137 | 1 | 1.0 | 1 | 0 | 2 | 1 |\n",
       "| 25 | 25 | 40 | 1 | 3 | 140 | 199 | 0 | 1 | 178 | 1 | 1.4 | 2 | 0 | 3 | 1 |\n",
       "| 26 | 26 | 71 | 0 | 1 | 160 | 302 | 0 | 1 | 162 | 0 | 0.4 | 2 | 2 | 2 | 1 |\n",
       "| 27 | 27 | 59 | 1 | 2 | 150 | 212 | 1 | 1 | 157 | 0 | 1.6 | 2 | 0 | 2 | 1 |\n",
       "| 28 | 28 | 51 | 1 | 2 | 110 | 175 | 0 | 1 | 123 | 0 | 0.6 | 2 | 0 | 2 | 1 |\n",
       "| 29 | 29 | 65 | 0 | 2 | 140 | 417 | 1 | 0 | 157 | 0 | 0.8 | 2 | 1 | 2 | 1 |\n",
       "| 30 | 30 | 53 | 1 | 2 | 130 | 197 | 1 | 0 | 152 | 0 | 1.2 | 0 | 0 | 2 | 1 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 273 | 273 | 67 | 1 | 0 | 120 | 237 | 0 | 1 |  71 | 0 | 1.0 | 1 | 0 | 2 | 0 |\n",
       "| 274 | 274 | 58 | 1 | 0 | 100 | 234 | 0 | 1 | 156 | 0 | 0.1 | 2 | 1 | 3 | 0 |\n",
       "| 275 | 275 | 47 | 1 | 0 | 110 | 275 | 0 | 0 | 118 | 1 | 1.0 | 1 | 1 | 2 | 0 |\n",
       "| 276 | 276 | 52 | 1 | 0 | 125 | 212 | 0 | 1 | 168 | 0 | 1.0 | 2 | 2 | 3 | 0 |\n",
       "| 277 | 277 | 58 | 1 | 0 | 146 | 218 | 0 | 1 | 105 | 0 | 2.0 | 1 | 1 | 3 | 0 |\n",
       "| 278 | 278 | 57 | 1 | 1 | 124 | 261 | 0 | 1 | 141 | 0 | 0.3 | 2 | 0 | 3 | 0 |\n",
       "| 279 | 279 | 58 | 0 | 1 | 136 | 319 | 1 | 0 | 152 | 0 | 0.0 | 2 | 2 | 2 | 0 |\n",
       "| 280 | 280 | 61 | 1 | 0 | 138 | 166 | 0 | 0 | 125 | 1 | 3.6 | 1 | 1 | 2 | 0 |\n",
       "| 281 | 281 | 42 | 1 | 0 | 136 | 315 | 0 | 1 | 125 | 1 | 1.8 | 1 | 0 | 1 | 0 |\n",
       "| 283 | 283 | 59 | 1 | 2 | 126 | 218 | 1 | 1 | 134 | 0 | 2.2 | 1 | 1 | 1 | 0 |\n",
       "| 284 | 284 | 40 | 1 | 0 | 152 | 223 | 0 | 1 | 181 | 0 | 0.0 | 2 | 0 | 3 | 0 |\n",
       "| 285 | 285 | 61 | 1 | 0 | 140 | 207 | 0 | 0 | 138 | 1 | 1.9 | 2 | 1 | 3 | 0 |\n",
       "| 286 | 286 | 46 | 1 | 0 | 140 | 311 | 0 | 1 | 120 | 1 | 1.8 | 1 | 2 | 3 | 0 |\n",
       "| 287 | 287 | 59 | 1 | 3 | 134 | 204 | 0 | 1 | 162 | 0 | 0.8 | 2 | 2 | 2 | 0 |\n",
       "| 288 | 288 | 57 | 1 | 1 | 154 | 232 | 0 | 0 | 164 | 0 | 0.0 | 2 | 1 | 2 | 0 |\n",
       "| 289 | 289 | 57 | 1 | 0 | 110 | 335 | 0 | 1 | 143 | 1 | 3.0 | 1 | 1 | 3 | 0 |\n",
       "| 290 | 290 | 55 | 0 | 0 | 128 | 205 | 0 | 2 | 130 | 1 | 2.0 | 1 | 1 | 3 | 0 |\n",
       "| 291 | 291 | 61 | 1 | 0 | 148 | 203 | 0 | 1 | 161 | 0 | 0.0 | 2 | 1 | 3 | 0 |\n",
       "| 292 | 292 | 58 | 1 | 0 | 114 | 318 | 0 | 2 | 140 | 0 | 4.4 | 0 | 3 | 1 | 0 |\n",
       "| 293 | 293 | 58 | 0 | 0 | 170 | 225 | 1 | 0 | 146 | 1 | 2.8 | 1 | 2 | 1 | 0 |\n",
       "| 294 | 294 | 67 | 1 | 2 | 152 | 212 | 0 | 0 | 150 | 0 | 0.8 | 1 | 0 | 3 | 0 |\n",
       "| 295 | 295 | 44 | 1 | 0 | 120 | 169 | 0 | 1 | 144 | 1 | 2.8 | 0 | 0 | 1 | 0 |\n",
       "| 296 | 296 | 63 | 1 | 0 | 140 | 187 | 0 | 0 | 144 | 1 | 4.0 | 2 | 2 | 3 | 0 |\n",
       "| 297 | 297 | 63 | 0 | 0 | 124 | 197 | 0 | 1 | 136 | 1 | 0.0 | 1 | 0 | 2 | 0 |\n",
       "| 298 | 298 | 59 | 1 | 0 | 164 | 176 | 1 | 0 |  90 | 0 | 1.0 | 1 | 2 | 1 | 0 |\n",
       "| 299 | 299 | 57 | 0 | 0 | 140 | 241 | 0 | 1 | 123 | 1 | 0.2 | 1 | 0 | 3 | 0 |\n",
       "| 300 | 300 | 45 | 1 | 3 | 110 | 264 | 0 | 1 | 132 | 0 | 1.2 | 1 | 0 | 3 | 0 |\n",
       "| 301 | 301 | 68 | 1 | 0 | 144 | 193 | 1 | 1 | 141 | 0 | 3.4 | 1 | 2 | 3 | 0 |\n",
       "| 302 | 302 | 57 | 1 | 0 | 130 | 131 | 0 | 1 | 115 | 1 | 1.2 | 1 | 1 | 3 | 0 |\n",
       "| 303 | 303 | 57 | 0 | 1 | 130 | 236 | 0 | 0 | 174 | 0 | 0.0 | 1 | 1 | 2 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "    X   age sex cp trestbps chol fbs restecg thalach exang oldpeak slope ca\n",
       "1    1  63  1   3  145      233  1   0       150     0     2.3     0     0 \n",
       "2    2  37  1   2  130      250  0   1       187     0     3.5     0     0 \n",
       "3    3  41  0   1  130      204  0   0       172     0     1.4     2     0 \n",
       "4    4  56  1   1  120      236  0   1       178     0     0.8     2     0 \n",
       "5    5  57  0   0  120      354  0   1       163     1     0.6     2     0 \n",
       "6    6  57  1   0  140      192  0   1       148     0     0.4     1     0 \n",
       "7    7  56  0   1  140      294  0   0       153     0     1.3     1     0 \n",
       "8    8  44  1   1  120      263  0   1       173     0     0.0     2     0 \n",
       "9    9  52  1   2  172      199  1   1       162     0     0.5     2     0 \n",
       "10  10  57  1   2  150      168  0   1       174     0     1.6     2     0 \n",
       "11  11  54  1   0  140      239  0   1       160     0     1.2     2     0 \n",
       "12  12  48  0   2  130      275  0   1       139     0     0.2     2     0 \n",
       "13  13  49  1   1  130      266  0   1       171     0     0.6     2     0 \n",
       "14  14  64  1   3  110      211  0   0       144     1     1.8     1     0 \n",
       "15  15  58  0   3  150      283  1   0       162     0     1.0     2     0 \n",
       "16  16  50  0   2  120      219  0   1       158     0     1.6     1     0 \n",
       "17  17  58  0   2  120      340  0   1       172     0     0.0     2     0 \n",
       "18  18  66  0   3  150      226  0   1       114     0     2.6     0     0 \n",
       "19  19  43  1   0  150      247  0   1       171     0     1.5     2     0 \n",
       "20  20  69  0   3  140      239  0   1       151     0     1.8     2     2 \n",
       "21  21  59  1   0  135      234  0   1       161     0     0.5     1     0 \n",
       "22  22  44  1   2  130      233  0   1       179     1     0.4     2     0 \n",
       "23  23  42  1   0  140      226  0   1       178     0     0.0     2     0 \n",
       "24  24  61  1   2  150      243  1   1       137     1     1.0     1     0 \n",
       "25  25  40  1   3  140      199  0   1       178     1     1.4     2     0 \n",
       "26  26  71  0   1  160      302  0   1       162     0     0.4     2     2 \n",
       "27  27  59  1   2  150      212  1   1       157     0     1.6     2     0 \n",
       "28  28  51  1   2  110      175  0   1       123     0     0.6     2     0 \n",
       "29  29  65  0   2  140      417  1   0       157     0     0.8     2     1 \n",
       "30  30  53  1   2  130      197  1   0       152     0     1.2     0     0 \n",
       "⋮   ⋮   ⋮   ⋮   ⋮  ⋮        ⋮    ⋮   ⋮       ⋮       ⋮     ⋮       ⋮     ⋮ \n",
       "273 273 67  1   0  120      237  0   1        71     0     1.0     1     0 \n",
       "274 274 58  1   0  100      234  0   1       156     0     0.1     2     1 \n",
       "275 275 47  1   0  110      275  0   0       118     1     1.0     1     1 \n",
       "276 276 52  1   0  125      212  0   1       168     0     1.0     2     2 \n",
       "277 277 58  1   0  146      218  0   1       105     0     2.0     1     1 \n",
       "278 278 57  1   1  124      261  0   1       141     0     0.3     2     0 \n",
       "279 279 58  0   1  136      319  1   0       152     0     0.0     2     2 \n",
       "280 280 61  1   0  138      166  0   0       125     1     3.6     1     1 \n",
       "281 281 42  1   0  136      315  0   1       125     1     1.8     1     0 \n",
       "283 283 59  1   2  126      218  1   1       134     0     2.2     1     1 \n",
       "284 284 40  1   0  152      223  0   1       181     0     0.0     2     0 \n",
       "285 285 61  1   0  140      207  0   0       138     1     1.9     2     1 \n",
       "286 286 46  1   0  140      311  0   1       120     1     1.8     1     2 \n",
       "287 287 59  1   3  134      204  0   1       162     0     0.8     2     2 \n",
       "288 288 57  1   1  154      232  0   0       164     0     0.0     2     1 \n",
       "289 289 57  1   0  110      335  0   1       143     1     3.0     1     1 \n",
       "290 290 55  0   0  128      205  0   2       130     1     2.0     1     1 \n",
       "291 291 61  1   0  148      203  0   1       161     0     0.0     2     1 \n",
       "292 292 58  1   0  114      318  0   2       140     0     4.4     0     3 \n",
       "293 293 58  0   0  170      225  1   0       146     1     2.8     1     2 \n",
       "294 294 67  1   2  152      212  0   0       150     0     0.8     1     0 \n",
       "295 295 44  1   0  120      169  0   1       144     1     2.8     0     0 \n",
       "296 296 63  1   0  140      187  0   0       144     1     4.0     2     2 \n",
       "297 297 63  0   0  124      197  0   1       136     1     0.0     1     0 \n",
       "298 298 59  1   0  164      176  1   0        90     0     1.0     1     2 \n",
       "299 299 57  0   0  140      241  0   1       123     1     0.2     1     0 \n",
       "300 300 45  1   3  110      264  0   1       132     0     1.2     1     0 \n",
       "301 301 68  1   0  144      193  1   1       141     0     3.4     1     2 \n",
       "302 302 57  1   0  130      131  0   1       115     1     1.2     1     1 \n",
       "303 303 57  0   1  130      236  0   0       174     0     0.0     1     1 \n",
       "    thal target\n",
       "1   1    1     \n",
       "2   2    1     \n",
       "3   2    1     \n",
       "4   2    1     \n",
       "5   2    1     \n",
       "6   1    1     \n",
       "7   2    1     \n",
       "8   3    1     \n",
       "9   3    1     \n",
       "10  2    1     \n",
       "11  2    1     \n",
       "12  2    1     \n",
       "13  2    1     \n",
       "14  2    1     \n",
       "15  2    1     \n",
       "16  2    1     \n",
       "17  2    1     \n",
       "18  2    1     \n",
       "19  2    1     \n",
       "20  2    1     \n",
       "21  3    1     \n",
       "22  2    1     \n",
       "23  2    1     \n",
       "24  2    1     \n",
       "25  3    1     \n",
       "26  2    1     \n",
       "27  2    1     \n",
       "28  2    1     \n",
       "29  2    1     \n",
       "30  2    1     \n",
       "⋮   ⋮    ⋮     \n",
       "273 2    0     \n",
       "274 3    0     \n",
       "275 2    0     \n",
       "276 3    0     \n",
       "277 3    0     \n",
       "278 3    0     \n",
       "279 2    0     \n",
       "280 2    0     \n",
       "281 1    0     \n",
       "283 1    0     \n",
       "284 3    0     \n",
       "285 3    0     \n",
       "286 3    0     \n",
       "287 2    0     \n",
       "288 2    0     \n",
       "289 3    0     \n",
       "290 3    0     \n",
       "291 3    0     \n",
       "292 1    0     \n",
       "293 1    0     \n",
       "294 3    0     \n",
       "295 1    0     \n",
       "296 3    0     \n",
       "297 2    0     \n",
       "298 1    0     \n",
       "299 3    0     \n",
       "300 3    0     \n",
       "301 3    0     \n",
       "302 3    0     \n",
       "303 2    0     "
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
    "data <- read.csv('../input/heartnew/heart.csv')\n",
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
    "levels(data$target) <- c(\"Yes\", \"No\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "2f58e729",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:42.628527Z",
     "iopub.status.busy": "2023-03-03T11:45:42.596333Z",
     "iopub.status.idle": "2023-03-03T11:45:43.306447Z",
     "shell.execute_reply": "2023-03-03T11:45:43.303516Z"
    },
    "papermill": {
     "duration": 0.719827,
     "end_time": "2023-03-03T11:45:43.309594",
     "exception": false,
     "start_time": "2023-03-03T11:45:42.589767",
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
      "image/png": "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\nyfQAgWt09YhMj8AGVhFFJVGUiKJGmZ6EDavovEsyPQLA+nLEDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nOZkeYANIJBLNmzfP9BSrV5rpAYCYau1uBMiIWrtPKC8vr2JtCGGXSqUKCwszPcXq1c/0AEBM\ntXY3AmRErd0npFKppk2brmltCGEXRVFZWVmmRwB+2exGgFX9QvcJrrEDAAiEsAMACISwAwAI\nhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMA\nCISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLAD\nAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISw\nAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiE\nsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAI\nhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMA\nCISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLAD\nAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISw\nAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiE\nsAMACISwAwAIRE4N/767/3B8vRGjj2pR/38LKl4ad8uTE9+dU5TdpftOA888oX397BirAAD4\n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\nVMoXMx8Zdt34LwYMOf3EpmVP3Xbz0HPK/n7rqYkMzQkAUPtlOOzmTVmS33WXXXbp9tMVqdJR\n4z/pOGBUv73bR1HU8aroiOOvfvDrAce0apCBKQEAfgkyHHYfLClpum1++Yol84sqNt0kf+UB\nuZLCibOLy8/cs3Xl27pNd+vZ8G9vvfztMUd1qFyybNmy8vLyytepVCqRcCwPWC92I8CqfqH7\nhAyH3XtLkxWv3nDkjVOTqVROgxb7HXPW4IN6RFFUuuzDKIq65v0wXre8nGcnF658O3jw4KlT\np1a+7tWr19ixY2t28LhKMj0AEFPz5s0zPQJQi9TafcLKA1urlcm7YstLvypMZDdv1vvWBx56\n6P47z/rdVk+PGXb31MVRFFWULIuiqCD3h7slCnKzk0uSGZsVAKDWy+QRu+w6bR5++OH/vSvo\nc/QF05/tP2Hs5IHX7JpVNy+Kou+SFS3rfJ+eC5LlOU1/mPbMM89csmRJ5euGDRsWFRXV5OTx\n1cn0AEBMtXY3AmRErd0npFKpxo0br2lthk/F/sT2m9SfsGh+FEW5edtE0ctTVyRb1qlbuWr6\nirIm3Zqs/OSOO+648nUymSwsLIxqJWEHvxQlJS6dAH7wC90nZPJU7OLpN580aMi3pRXfv0+V\nv/z18vyuW0dRVC+/b5s62c9Mml+5Jrn03beLSrfr2zJTowIA1H6ZDLvGHfo3X/7t+Zfd9vbk\n6TM+fv/B6/80cVmjUwZtHUVRlMg9t1/nGXcMn/Du9LkzPxp78agGbfYZ0NqzTgAA1iiRSqUy\n+OtLFn181+i/v/bB9OKcxh06dj/0pME7b/a/ekuVP3fv9eOf++/C4sSWPfuceu7JHfNWf+K4\nNp+KbXT1iEyPAMRSdN4lNfBbWkyeVgO/BVh/87t3yvQIa1RQULCmVRkOuw1C2AHrT9gBq/qF\nhl0mT8UCALABCTsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQORkeoANIzc3N9MjAL9sdiPAqn6h+4QQwi6R\nSDRu3DjTU6xeaaYHAGKqtbsRICNq7T6hvLy8irUhhF0qlVq4cGGmp1i9RpkeAIip1u5GgIyo\nzfuEgoKCNa1yjR0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAg\nhB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBA\nIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0A\nQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQd\nAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCE\nHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAg\nhB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBA\nIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0A\nQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQd\nAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCByMj1AFSpeGnfLkxPfnVOU\n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\nE0XRNn+68+o9W//kp+o26RVF0SPn7nXEdS+22XbPg/rufOCvf3PuiJ5fnbLP6fPWvvHea9sy\nQFyZPhcMkC5rusauIrlw9yZ1cxt0LyqrSK1yjV1p0dQ33nhjxorkyk9OeWZEFEVdTp2USqWS\nK2ZkJxJdTnlt1U0ll38ybty4l75eVrLk9exEYvMDblt17Z1bN6uXv1fl6yo2XvWW1/+/B2Dj\n4VQssHGpKPtu1HG/nlhY0mfE/Q2zf3SR3bJvb915552P/Mt7K5dsscOvoigqW1YWRVFOvY7D\nuzabcd/xL3yzfOUHHhxy8NFHHz07KypbPrU8lWrWa/uVq5Z/Penar4qiKLXWjVe9ZYD4fPME\nEKzKb57Y/OBTj+mSH0VRFFUUzp898aknPv52xVaH/fmjhy+qm4iiKLqiff6VxUcUfT0mVV64\nb6tWLyxM/ebYE3bu1qFi8eePj71zcmHevTM/P6ZtwyiKls7+R7etj/06e7NDj/rd9ls1mzxh\n/H3PTdlm4H0f3vX7qKJ4n02avVjU5NSL/rh927yZH78xdvQ/t2xZ/vqc7Ovuvv2ko/vlpZZU\nsfGqtgwQX6YPGQKkS+Wp2FXVb9SsS+/fXjb2ubJVPrbyVGwqlVr+zWtn9N9784LGOVnZjZq3\n7XPISY+9t2DVbS6e9u/Bh/Rpmd+wTl6zzr12vXTMv5IV369aOvv543+zU5vmDRq37LDHAb9/\n8uPv5r/91y2a5tVp2OLLkrK1bryKLQPE5IgdAEAgXL4BABAIYQcAEAhhBwAQCGEHABAIYQcA\nEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABCI/wckZz12nwKYhQAA\nAABJRU5ErkJggg=="
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
   "id": "840e203c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:43.323397Z",
     "iopub.status.busy": "2023-03-03T11:45:43.321792Z",
     "iopub.status.idle": "2023-03-03T11:45:43.741556Z",
     "shell.execute_reply": "2023-03-03T11:45:43.739809Z"
    },
    "papermill": {
     "duration": 0.428956,
     "end_time": "2023-03-03T11:45:43.743849",
     "exception": false,
     "start_time": "2023-03-03T11:45:43.314893",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdZ5xU5dnA4TNlKyxLs4NKEyliS6LYEEuUWGLHEmPDErErsWAFo4nYYkVRY1cU\nY9ckKnbR1xoroqKi2JC69GV33g+rKwLC2WVmh3lyXR/87Zw5nHPzMAx/pyYymUwEAEDhS+Z7\nAAAAskPYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEIp3vARpg1qxZ8+fPz/cU\nPykpKSktLa2tra2qqsr3LA1WXFxcXFw8c+bMfA/SYIW+7EVFRbNmzcr3IA1m2fOitLS0pKSk\npqamQP+qptNpy97ECnfZ67Rq1SrfIxS8Qgq72trampqafE/xM8lkMoqiFW2qODKZTCKRKMTJ\noyhKJpOZTKYQh89kMslkshAnjwp52aMoKtBbe90NpkCX3Z1MXhT0spMVnooFAAiEsAMACISw\nAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiE\nsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAI\nhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIRDrfAwAUtoph\nQ+LsVjXo7FxPAuAROwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgECk8z1AAxQV\nFRUVFeV7ip+k0+koihKJRPPmzfM9S4OlUqlkMlmIk9cte4EOb9nzIpVKpVKpvE/eiAEKetnT\n6XThTh5Z9nyYOXNmvkcIQSGFXRRFmUwm3yP8pH6YFWqqBinEyS17fhXu8LmbPJH7AQpx2etm\nLsTJ62QymUIcvtCXneVXSGFXXV09b968fE/xk/Ly8qKiokwmM2vWrHzP0mClpaWlpaWFOHnd\nstfW1hbi8AW97Ol0ukCXvaysrLi4OHeTV8TbrREDWPa8aNasWTqdLtD79sJddrLFa+wAAAIh\n7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAAC\nIewAAAIh7AAAAiHsAAACIewAAAIh7AAAApHO9wAAK6iKYUPyPQJAw3jEDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQ6XwPABBXxbAhcXarGnR2ricBWDF5xA4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ6SY+381/Oqh0yPB9Vyqr\nu/jtmMGHX/jOwjscecs9O7UqbeKpAAAC0JRhl/n4hX/c/9W0vTOZ+k3T3ppW1maX4w/vUb+l\nY7PiJhwJACAcTRR23zx/+ZnXv/jd9HmLbP/u/Rktu2+22WY9lvirAACIr4leY9e6116nnXPh\nxX87dZHt/50xr9WGLWvmzPjmu2mZJf5KAADiaaJH7Ior23WujGrmL/riuTdnVte+cMU+V46t\nzmTSzVbaYf/jj9ylV/21M2fOfP/99+svrr766hUVFU0zcBzJ5A9ZXFRUlN9JGiGVSiUSiUKc\nvG7ZC3T4wl32VCoVFc6yLzLkCrLsjRigsJZ9ESvIsjeC+/Z8qa6uzvcIIWjqN08srGb+xOmJ\n1Nqte//tzqGVNTNefvSGS0acWdLl1oPXbVm3w/jx448++uj6/YcOHdqvX788DfuLkslkZWVl\nvqdopMKd3LLnRd6XfdEXc/yCJQ7ZiMljni6mRi9d3pd9eRTu5KlUqnCHL9DJv//++3yPEIJ8\nhl2qeI1Ro0b9eKltn/1OG/ef/qNvePfgi7fI41QAAAUqn2G3uI1XLhs9dVL9xR49eowePbr+\nYk1NzeTJk/Mx15KVlZWVl5fX1tZOnTo137M0WGlpaUlJyfTp0/M9SINZ9rwoLy8vKyurqamZ\nNm1aHsdoHm+3Re4oysrKioqKZsyYkaPTxdSIu68VZNkbp9HLnneWnYKWz7CbNu7qky96/4Jr\nrlylOBlFUZSpefbr2S03Wqd+h1Qq1aJFi/qLVVVV8+Zl97mR7MhkCu+NH3UzF+LkdTKZTCEO\nX7jLXj9zQQy/yJAryLI3YoDCWvZFrCDLvjwKcfgAlp3llM9vnmjRsX+b2d+eet51r7077qP3\n3rrr8j8/N6viiAHrLPtXAgCwmHw+YpdMtx169Xn/GH7H388/Y266RcfOPU+9fMiGzQvyvTwA\nAHnXpGGXKm730EMPLbylpFWPo06/4KimHAIAIFD5fCoWAIAsEnYAAIEQdgAAgRB2AACBEHYA\nAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2\nAACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQ\ndgAAgRB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAAgUjnewCA/wkVw4bE2a1q0Nm5ngQI\nmEfsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewA\nAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHs\nAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh\n7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAAC\nIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAA\nAiHsAAACIewAAAIh7AAAApHO9wANUFxcXFpamu8pfpJMJqMoSiQSlZWV+Z6lwZLJZDKZLNDJ\n6/5boMMX6OSpVCpaAZa9Nt5uiwzZ6GWPebrsWnjOFWTZG8etPS8Kd9mjKJo+fXq+RwhBIYVd\nTU1NdXV1vqf4SXFxcd3f/3nz5uV7lgYrKioqKioqxMnrlj2TyRTi8EVFRel0uhAnLy4uLi4u\nzvuyF8XbbZEhG73sMU+XXQvPuYIse+O4tedFcXFxVJj/KpEtBRZ2K9SNNZlM1v3lnzt3br5n\naYxUKlWIk1v2vFhBlj1maS0yZCKRSCaTjZg8L2G38JwryLI3TqOXPe/q/o+9cJc9kUgU4uRk\ni9fYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgB\nAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAAQine8BgEJVMWxIzD2rBp2d00kAqOMR\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBApBuyc+3X4z9ZrWOXKIrmfvfqhcNunlrcfpfD\nBm7fsSJHw8EKq2LYkDi7VQ06O9eTFIQ4y9XEaxXzT7DpLTLYvLqNP98nzlq5icL/prhhN3/6\nmP233PmhT1adP+u9zIKpv+/e5z+T50RRdO2l19384TsHrNk8l0MCALBscZ+KvXu3ve9/f/5B\nJx0bRdF3r5/wn8lzBj42buqnz29U9NUp/e/J5YQAAMQSN+wu+L/v1tp15IihR0VR9Pb5z5VU\nbvn3fl1arr3F3//QefI7l+ZyQgAAYokbdhPmLWjbu33dz7f836Q2vU5KRVEURc06Nlsw55Pc\nzAYAQAPEDbvNW5RMfPStKIrmTXvirkmzNzp9o7rtrz34ZVH5urmaDgCA2OK+eeK8g9fZ4vJD\ndhnwevqV2xLp1hdstdqCuR+PuOSS41/8ZpVtLsnpiAAAxBE37Da9aPS5E3e84B9XVCfKDrn0\nhfWaFc2c+ODRZw5v3m7L2+/dI6cjAgAQR9ywS6bbnD3y1TNmfz8r1bqyJBlFUWmrfg883nvr\n7XtXphK5nBAAgFjivsaud+/eF385M13etq7qoihKl3f//Y6bzXnl+C23OTBn4wEAENcyHrGb\n8enHX8+viaLo5Zdf7vjBBx/OavHz6zPvPvrcS89/lqvpAACIbRlhd9+Omxw6bkrdz3f+9jd3\nLmmfFmsPzPZUAAA02DLCbrMhlw6fNjeKoqOOOqrP0Mv2W6lskR2SRRW999wrV9MBABDbMsKu\na/+DukZRFEV33333bocOOHJ13wkLALCCivuu2KeffjqKoilfjp80q3rxa7t27ZrNoQAAaLi4\nYTf3+yf33KL/Yx9OWeK1mUwmeyMBANAYccPu+t8f+PhHVTv/6bQde62d9rl1AAArnrhhd/6r\nkzr2/+fD1+ya02kAAGi0WB9QnKmpmlRds1b/XrmeBgCARosVdolU861blo6/+bVcTwMAQKPF\n/EqxxN2PDJ3/+B8OHnrLt7MW5HYiAAAaJe5r7PY67cFVViu65eyDbz3nsNarrlqW+tkbKL74\n4osczAYAQAPEDbu2bdu2bbvdWhvkdBgAABovbtjdf//9OZ0DAIDlFPM1dgAArOjiPmJX58On\nRt717zETvpuy1d+G71v00itf9erTc+UcTQYAQIPED7vMNYdsMfDml+oulJ91xU4zr+i74SNb\nDbjyyesG+i4KAIC8i/tU7Cd37DHw5pe2HXj5fz+aWLelVZeLLjii97Mjjtl1+NicjQcAQFxx\nw+78k59o3e20J686vlfn1eu2pMvXPW34i+et1+bZc4fmbDwAAOKKG3ajvp/T6eD9F9+++x87\nzp38cFZHAgCgMeKG3ZolqaqPZiy+fep701Mlq2d1JAAAGiNu2J2xycof3/7Hl7+fu/DG2V+N\nPmTk+LYbnpqDwQAAaJi4YbfHyOvXTEzo02GDI08ZEkXRe3ffNHTQwd277DChdrUr790nlxMC\nABBL3LArW+l3b/73oT1/nbzh0nOjKHrmzJPPueT2ik33vv/Nt/dcrVkOBwQAIJ4GfEBxiy79\n7hzd78ZJn773yVcLUmXtuvRo17Kkoee7+U8HlQ4Zvu9KZT9uqH3m7msefu6NL6pS3XpucvBx\nh3QoSzX0mAAARI34SrGylTr8atPNN/31Rg2vuszHL9x0/1fTFmQy9ZvG33fmZSPH9N7j8HNO\n+GP5J08OPmlEZikHAADgly3tEbsNN9wwkSx54/WX635eyp5vvvnm0k/zzfOXn3n9i99Nn/ez\nrZn5l478oPOBl+61XYcoijr/Ldr7oGF3fX3g/p7bBQBouKWFXfPmzRPJHx6Wa9my5fKcpnWv\nvU47Z+fa6m9POfVv9RvnTX9uwtya47b54dNSSlptuX7zv7/67Lf779txec4FAPC/aWlh9/zz\nz9f//PTTTy/PaYor23WujGrmly68cf6st6Mo6l7+0ww9ytP/eXd6/cUpU6Y888wz9RfXW2+9\n1VZbbXnGyK50Oh1FUSKRKC0tXebOK5qioqJkMlmIkxfWsi8ypGVfiiweeZFDpdPpAl32X5K7\ntcqiwl32VCoVFc6dzCIKd9mjKJo7d+6yd2JZ4r55onfv3nve+8Qp7Zovsv2bl47b+8ypz4++\nrRHnrp03K4qitkU/vVuibVGqekZ1/cUvv/zyggsuqL84dOjQLl26NOJEOZVIJJo3X3RZCkXh\nTp5MJhceft6px8X8hSV/uyIrA8xb9i5R9AsrHM6yZ/XgcZYl0a9/nENlYix7dodvYnHWanlu\nooseKt7fryX+5Qrm1l5YCnTyXITd5A/2bNv9nwtvKa9s26HnJv0PPfGMQ7dd+N2aZ69Vedn8\nfaq+HpH1GZrYMsJuxqcffz2/Joqil19+ueMHH3w4q8XPr8+8++hzLz3/WePOnSwpj6JoSnXt\nqsU/vIfj++qadKufRkqlUi1a/HTGoqKiTGbFenNFIpGIomhFmyqmRCJRuJNHjV32Jv4tL366\nAl32ujWPcrmAWTxyMMv+S3K6Vlk8VIEuexPc2nOqQJc9p9rvPKD/ui2jKIoyNVO/+/z5xx87\n+7BHb3v0L2/fe0bpj28iTabTqdoGv6N0BbSMsLtvx00OHTel7uc7f/ubO5e0T4u1Bzbu3EXl\n60XRs2PnVK9a/MMr+cbNWVDZo7J+hx49eowePbr+YlVV1eTJkxt3rlwoLy8vLy+vra2dMmVK\nvmdpsNLS0tLS0mnTpuV7kAarW/aampqpU6fWb6yI/cuzdROKecZFTvc/u+xxZPFv9yKHKisr\nKy4unj59+sIbszt8E4uzVo27iWbxUEtc9oLQrFmzsrKyRW7thaJwlz2nOv7htGH9O9VfrK3+\n7m/7bXHGfYN3vnynJ09av27juZ9MPjc/02XZMsJusyGXDp82N4qio446qs/Qy/b76fPnfpAs\nqui9516NO3dpy75rFF/72EuTtu7XLoqi6plvvFY1f6++qzbuaAAAy5QsWvnUu156pG27584+\nYObx7zRPJfI9UTYt41HHrv0POvLII4888sitt95690MHHLmYww/dv2dlcSNPnig6ea91P7rx\n3NFvjPtq/Ds3nHVpszW2P3B1n3UCAORQsqjtZYd2qZ713l+/qKrbckGHlhWrHV73c23191ef\ndmivTquWFhW1aNN+2/7Hvfz9z17/N/Pz507Yd4c1V2pZ0qz1uhtuc951j9UudO0HD12929Yb\n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\n5sWvPvttHkcCAChc+XyN3fxZb0dR1L38pxl6lKf/8+70+ouff/75tddeW39x77337tmzZ1NO\nuLiKior6n1OpVBRFiURi4Y2FLqTfC0DTa+J70UVOl0qlkslkTmfI3cGrqqpydOT/KfkMu9p5\ns6Ioalv007sl2halqmdU11+cPn36k08+WX+xT58+JSUlTTnh4krHvJbfAXIti7/B0n79s3Uo\ngELRxP9MNP2ddiZn/xALu6zIZ9glS8qjKJpSXbtq8Q/PCH9fXZNu9dNIlZWV2223Xf3FlVde\ned68ebmYZG7vXzXiV6VSqXQ6nclk5s+fn/WRci2VSqVSqQKd3LI3vXQ6nUqlCnfZk8lkdXX1\nsnddwVj2vLDsS5ejf4jJlnyGXVH5elH07Ng51asW/5D/4+YsqOxRWb/DWmut9de//rX+YlVV\n1QqV8+Xl5XWFsUJNFVNpaWlpaWkhTl637LW1tYU4fEEve3l5eYEue1lZWXFxcSFObtnzolmz\nZmVlZZadApXPN0+Utuy7RnHqsZcm1V2snvnGa1XzN+q7ah5HAgAoXHn9uJNE0cl7rfvRjeeO\nfmPcV+PfueGsS5utsf2BqzfL50gAAAUrz9880bn/+UfPu/zOS8+aPDfRaf0+Q08+PJHfgQAA\nCla+v1Iskdr+oJO3PyjPUwAABCDPXykGAEC2CDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\npPM9QAGbOHHipEmT0ul0x44d8z1Lg9XW1i5YsCDfUzRG3bIXFRV16NAh37M0WG1tbXV1db6n\naIwvvvhi8uTJJSUla621Vr5nabCampoCvbXXLXtxcfHaa6+d71karHDvZD7//PMpU6YU6K29\ncJedbCmksKuoqKioqMj3FD956KGHrrnmmpVXXvmxxx7L9yyNVFpamu8RGuz++++/7rrrVl99\n9YceeijfszRSWVlZvkdosPvuu2/EiBHt27e///778z1LIxXist9zzz033XTT2muvPWrUqHzP\n0kiFuOx33nnnrbfe2qlTp5EjR+Z7lkYqxGUnWzwVCwAQCGEHABAIYQcAEIhCeo3diqZv375r\n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"
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
   "id": "a174f74a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:43.757796Z",
     "iopub.status.busy": "2023-03-03T11:45:43.756275Z",
     "iopub.status.idle": "2023-03-03T11:45:44.072927Z",
     "shell.execute_reply": "2023-03-03T11:45:44.071145Z"
    },
    "papermill": {
     "duration": 0.326299,
     "end_time": "2023-03-03T11:45:44.075470",
     "exception": false,
     "start_time": "2023-03-03T11:45:43.749171",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASGTX8f7uPPXohsPGHNaq\nUdXdGa8POfHK/yy7wcl3PbRP84YhhBAqX3rw5idefveboqxNu297zJnHtm+UVcfTAgCsQeoy\n7JL/ffWOx6bPPySZXLpo/vvzG7Xc76wTuy1d0qFxg6obUx+9+PrxXw8YePpxzcufHHvTkHPK\n77vllIw6HBcAYM1SR2H3wyujLr71tZkLSpdbPvOThQVdt99++27LPyBZNnL8px0HjOy3W/sQ\nQserwiFHX/PA9wOOWK9x3QwMALDGqaPP2LXo0W/wZVdee9UFyy3/YGFp880LKpYs/GHm/OQy\ny0sXvDytpGKvXdevupvbfKeeTRq8NXFG3UwLALAmqqMjdg3yN+iYHyrKGi63/L3iROWrNxw6\nenIimcxu3GqPI846eb8eIYSyRR+GELrm/Txet7zsZz5asPTuOeec88UXX1Td7tq164gRI2r9\nZ2BNlpeX16hRo3RPQR0pT/cAsGZp3rx5ukcIIYR58+ale4QY1PXJE8uqKPtuQUbWRi16X3X/\n8PyKhW/847brxl2c2+nuY7oUVJYuCiEU5vx8tkRhTlZiYWLp3ZkzZ3733XdVt1u1apWV5bwK\nViYz0wngaxFhB9Xib2hM0hl2WQ3aPPLIIz/dK+xz+OApz/R/4baPjrl2x8zcvBDC3ERl6wY/\n/j2enajIbv7ztP379587d27V7ZYtWy5atKguJ2cN0rhx4xBCaWlpebk/92uLdP5egzWQv6Ex\nqV+/ALdcp9EL82aFEHLyNgth4uQlidYNcqtWTVlSnt8tf+mW++2339LbiURiwYIFAX5NVdgl\nEomSkpJ0z0IdaZruAWDNsmTJknSPQI1J5/tT86fcdPwJA2eUVf54P1kx8fvFBV03CSE0LOjb\npkHWU5NmVa1JFL/7dlHZFn1bp2tUAID6L51h16xD/5aLZ1xw+di3P5ry+cfvPzDq/JcXNT3p\nhE1CCCEjZ1C/Lp/fPvSFd6dMn/qf2y4Z2bjN7gPWd60TAID/KZ1vxWZmFw6/6fI7xtz3lxEX\nlWQ369Cx+wWjhm3eJKdqbcf+I04rHXX/yEvmlGRs3LPP8EEnujoxAMBKZCSTyd/eqn7zGTtW\norCwMIRQXFzsM3Zrj6bXDEv3CLAmKTrv0nSP8KOq39isDteAAACIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIhEdroHqAEZGRlNmjRJ9xTUa7m5udnZMfxrB6hx9eRvaHFxcbpHiIEjdgAAkYjhGEYymZT5\n/C8NGzYMIZSWlpaUlKR7FupI03QPAGsWf0Nj4ogdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSq\nFXaV30/9vOpWycy3Ljtv4JlD/vzs1KLaGAsAgOpK9XInZQteP2Knff/+ReuyRR8ny+cd0LXP\nM3OWhBBuGTn2zs/+c+SG9eLahgAAa7NUj9g9eOAhj31SdvQ5Z4QQZr5z9jNzlgx8asq8L1/Z\n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\nZDKZkeFYHqx5vHKhPqgnr8RkMpnuEWKQ5rB7rzhR+eoNh46enEgmsxu32uOIs07er0cIoWzR\nhyGErnk/j9ctL/uZjxYsvXvyySdPnjy56navXr1uu+22uh0cqAEtW7ZM9whAfXklzp49O90j\nxCCdZ8VWlH23ICOrZYvet9z/8MP3/vWs/Tv9Y9zFd06eH0KoLF0UQijM+flsicKcrMTCRNpm\nBQCo99J5xC6rQZtHHnnkp3uFfQ4fPOWZ/i/c9tEx1+6YmZsXQpibqGzd4Mf0nJ2oyG7+87SD\nBw9evHhx1e2GDRsuWLAgAGsar1yoD7wSY5Lmt2KXs+U6jV6YNyuEkJO3WQgTJy9JtG6QW7Vq\nypLy/G75S7fs3r370tuJRMI/SlgTJRIOw0P6eSXGJJ1vxc6fctPxJwycUVb54/1kxcTvFxd0\n3SSE0LCgb5sGWU9NmlW1JlH87ttFZVv0bZ2uUQEA6r90hl2zDv1bLp5xweVj3/5oyucfv//A\nqPNfXtT0pBM2CSGEjJxB/bp8fvvQF96dMn3qf267ZGTjNrsPWN+1TgAA/qeM9J5dXDrv4zvG\n3PfaB1NKspt16Nj998efvF3bn+otWfHs3aPGP/vvOSUZG/fsc8qgEzvm/fobx/XnrdhWH32W\n7hFgTTKre+faeFqvRKiWWnolroLCwsJ0j7DGS3PY1QhhB2soYQf1gbCLSTrfigUAoAYJOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASGSne4AakJGRUVBQkO4pgGrzyoX6oJ68EufPn5/uEWIQQ9glk8nS0tJ0\nTwFUW0lJSbpHALwSoxJD2AX/KGHN5JUL9YFXYkx8xg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEtnp\nHmAlKl968OYnXn73m6KsTbtve8yZx7ZvlJXukQAA6q/6e8Ru6qMXXz/+9d4HnXjZ2UflffHc\nkHPGJdM9EgBAfVZfwy5ZNnL8px0HjOi3W+9uW+509lUDi7976oHvF6V7LACA+quehl3pgpen\nlVTstev6VXdzm+/Us0mDtybOSO9UAAD1WT39jF3Zog9DCF3zfh6vW172Mx8tWHr3hhtumD59\netXtdu3aHXfccXU8IbD6mjZtmu4RgPrySiwqKkr3CDGop2FXWboohFCY8/PZEoU5WYmFiaV3\n//3vf0+ePLnqdq9evU499dQ6nhBYfbm5uekeAagvr0RhVyPqadhl5uaFEOYmKls3+PHN4tmJ\niuzmP0+7zTbbbLDBBlW327VrV1paWvdDrqik91bpHoHlVf3CKi8vr6ioSPcsLK+WXrleifVQ\ndnZ2VlZWZWVlIpH47a2pW/Xkbyg1op6GXU7eZiFMnLwk0brBj/8ZMWVJeX63/KUbnHnmmUtv\nJxKJBQsWLP8UEEL4KexKSkpKSkrSPQusvZo0aZKVlVVRUeGoDNSqenryRMOCvm0aZD01aVbV\n3UTxu28XlW3Rt3V6pwIAqM/qadiFjJxB/bp8fvvQF96dMn3qf267ZGTjNrsPWL9xuscCAKi/\n6ulbsSGEjv1HnFY66v6Rl8wpydi4Z5/hg07MSPdIAAD1WUYyucZ/oYPP2LEShYWFIYTi4mKf\nsYM0atKkScOGDf26ZuWqfmOzOurrW7EAAFSTsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIhE\ndroHgNo1adKkEELr1q2bNWuW7llg7TV16tT58+c3atSobdu26Z4FYpaRTCbTPQPUom222aay\nsvKyyy7bb7/90j0LrL1GjBgxYcKELbbY4tZbb033LBAzb8UCAERC2AEARELYAQBEwmfsiNzz\nzz+fTCa7du26/vrrp3sWWHt98skn06dPb968+ZZbbpnuWSBmwg4AIBLeigUAiISwAwCIhAsU\nU3+9c97Rl382b7mFea36P3j7kbW3034HHLDzLfeduX6T2tsFROOSw/t9sKjs8FsfPLx13rLL\n373yxKGvz2jfb+Rfjuq4kod7uUGNE3bUaw0Ldr30/N2WXZLVYJ10DQOsKCMr48V7phx+Xq+f\nFyXLbn93dlZGRvqGgrWXsKNey8xp1b1791V6aGVFMjPLXxaoZev27THr1dvLkqMb/PRyK/7u\n/umh9Y7NZk9L62CwdhJ2rJEqy+c8Om7svyZ9OLc0s83GPQ88+qTfdWleterogw7c/ZKBb18/\n9ssFFfnrbnzkuZd0mPboyLufnVGSufEWu1563nFNszLK5n9y+833vP7hFwvLKgvX77jnEWf0\n275N6rsAlmrW7qisl8+//9uiY9o2rVry2d2vtex1cu6Uq5du4xUHdcbJE9RrlYlZn/5SZQgh\nhHsGnz3hk6w/nDXkmhEX7dk5ecPgk5+ZvnjpoyZcOWHPM0eMGX1V79zvbxl8xpWvhrOGXXfF\nuYd9/cbfr/v3rBDCHecPmzS37ZmXjBh51fD9e1bec825s8srl9v1yncB/Cgz9/jNW7561+Qf\n7ybL/vre7B2P7rLsJl5xUGccsaNeK5n/wgUXvLDskgcnPJ457/G/fb7wigcGdcvLDiFsvEn3\n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"
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
   "id": "51e36e4f",
   "metadata": {
    "papermill": {
     "duration": 0.00566,
     "end_time": "2023-03-03T11:45:44.087434",
     "exception": false,
     "start_time": "2023-03-03T11:45:44.081774",
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
   "id": "41d23f1a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:44.102249Z",
     "iopub.status.busy": "2023-03-03T11:45:44.100680Z",
     "iopub.status.idle": "2023-03-03T11:45:44.125930Z",
     "shell.execute_reply": "2023-03-03T11:45:44.124162Z"
    },
    "papermill": {
     "duration": 0.0354,
     "end_time": "2023-03-03T11:45:44.128490",
     "exception": false,
     "start_time": "2023-03-03T11:45:44.093090",
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
       "\t<tr><th scope=row>137</th><td>60</td><td>96</td><td>No </td></tr>\n",
       "\t<tr><th scope=row>199</th><td>62</td><td>99</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>217</th><td>62</td><td>97</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>234</th><td>64</td><td>96</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>244</th><td>57</td><td>88</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>263</th><td>53</td><td>95</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>273</th><td>67</td><td>71</td><td>Yes</td></tr>\n",
       "\t<tr><th scope=row>298</th><td>59</td><td>90</td><td>Yes</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 8 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & age & thalach & target\\\\\n",
       "  & <int> & <int> & <fct>\\\\\n",
       "\\hline\n",
       "\t137 & 60 & 96 & No \\\\\n",
       "\t199 & 62 & 99 & Yes\\\\\n",
       "\t217 & 62 & 97 & Yes\\\\\n",
       "\t234 & 64 & 96 & Yes\\\\\n",
       "\t244 & 57 & 88 & Yes\\\\\n",
       "\t263 & 53 & 95 & Yes\\\\\n",
       "\t273 & 67 & 71 & Yes\\\\\n",
       "\t298 & 59 & 90 & Yes\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 8 × 3\n",
       "\n",
       "| <!--/--> | age &lt;int&gt; | thalach &lt;int&gt; | target &lt;fct&gt; |\n",
       "|---|---|---|---|\n",
       "| 137 | 60 | 96 | No  |\n",
       "| 199 | 62 | 99 | Yes |\n",
       "| 217 | 62 | 97 | Yes |\n",
       "| 234 | 64 | 96 | Yes |\n",
       "| 244 | 57 | 88 | Yes |\n",
       "| 263 | 53 | 95 | Yes |\n",
       "| 273 | 67 | 71 | Yes |\n",
       "| 298 | 59 | 90 | Yes |\n",
       "\n"
      ],
      "text/plain": [
       "    age thalach target\n",
       "137 60  96      No    \n",
       "199 62  99      Yes   \n",
       "217 62  97      Yes   \n",
       "234 64  96      Yes   \n",
       "244 57  88      Yes   \n",
       "263 53  95      Yes   \n",
       "273 67  71      Yes   \n",
       "298 59  90      Yes   "
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
   "id": "50f7784f",
   "metadata": {
    "papermill": {
     "duration": 0.005861,
     "end_time": "2023-03-03T11:45:44.140237",
     "exception": false,
     "start_time": "2023-03-03T11:45:44.134376",
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
   "id": "e91d9a49",
   "metadata": {
    "papermill": {
     "duration": 0.005979,
     "end_time": "2023-03-03T11:45:44.152187",
     "exception": false,
     "start_time": "2023-03-03T11:45:44.146208",
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
   "id": "79919f50",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:44.167921Z",
     "iopub.status.busy": "2023-03-03T11:45:44.166285Z",
     "iopub.status.idle": "2023-03-03T11:45:44.194891Z",
     "shell.execute_reply": "2023-03-03T11:45:44.193027Z"
    },
    "papermill": {
     "duration": 0.03921,
     "end_time": "2023-03-03T11:45:44.197498",
     "exception": false,
     "start_time": "2023-03-03T11:45:44.158288",
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
   "id": "f61e5ec9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:44.212780Z",
     "iopub.status.busy": "2023-03-03T11:45:44.211204Z",
     "iopub.status.idle": "2023-03-03T11:45:45.006216Z",
     "shell.execute_reply": "2023-03-03T11:45:45.004385Z"
    },
    "papermill": {
     "duration": 0.805335,
     "end_time": "2023-03-03T11:45:45.008774",
     "exception": false,
     "start_time": "2023-03-03T11:45:44.203439",
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
       "208 samples\n",
       " 14 predictor\n",
       "  2 classes: 'Yes', 'No' \n",
       "\n",
       "No pre-processing\n",
       "Resampling: Cross-Validated (10 fold) \n",
       "Summary of sample sizes: 187, 187, 188, 186, 188, 187, ... \n",
       "Resampling results across tuning parameters:\n",
       "\n",
       "  usekernel  Accuracy   Kappa    \n",
       "  FALSE      0.8941991  0.7810746\n",
       "   TRUE      0.9564286  0.9130894\n",
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
   "id": "9a39627f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:45.026529Z",
     "iopub.status.busy": "2023-03-03T11:45:45.024865Z",
     "iopub.status.idle": "2023-03-03T11:45:45.063354Z",
     "shell.execute_reply": "2023-03-03T11:45:45.061515Z"
    },
    "papermill": {
     "duration": 0.050989,
     "end_time": "2023-03-03T11:45:45.065868",
     "exception": false,
     "start_time": "2023-03-03T11:45:45.014879",
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
       "          Reference\n",
       "Prediction Yes No\n",
       "       Yes  39  2\n",
       "       No    1 46\n",
       "                                          \n",
       "               Accuracy : 0.9659          \n",
       "                 95% CI : (0.9036, 0.9929)\n",
       "    No Information Rate : 0.5455          \n",
       "    P-Value [Acc > NIR] : <2e-16          \n",
       "                                          \n",
       "                  Kappa : 0.9314          \n",
       "                                          \n",
       " Mcnemar's Test P-Value : 1               \n",
       "                                          \n",
       "            Sensitivity : 0.9750          \n",
       "            Specificity : 0.9583          \n",
       "         Pos Pred Value : 0.9512          \n",
       "         Neg Pred Value : 0.9787          \n",
       "             Prevalence : 0.4545          \n",
       "         Detection Rate : 0.4432          \n",
       "   Detection Prevalence : 0.4659          \n",
       "      Balanced Accuracy : 0.9667          \n",
       "                                          \n",
       "       'Positive' Class : Yes             \n",
       "                                          "
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
   "id": "05cdb71d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-03T11:45:45.088099Z",
     "iopub.status.busy": "2023-03-03T11:45:45.084420Z",
     "iopub.status.idle": "2023-03-03T11:45:45.129129Z",
     "shell.execute_reply": "2023-03-03T11:45:45.126636Z"
    },
    "papermill": {
     "duration": 0.059215,
     "end_time": "2023-03-03T11:45:45.132179",
     "exception": false,
     "start_time": "2023-03-03T11:45:45.072964",
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
       "          Reference\n",
       "Prediction Yes No\n",
       "       Yes  39  2\n",
       "       No    1 46\n",
       "                                          \n",
       "               Accuracy : 0.9659          \n",
       "                 95% CI : (0.9036, 0.9929)\n",
       "    No Information Rate : 0.5455          \n",
       "    P-Value [Acc > NIR] : <2e-16          \n",
       "                                          \n",
       "                  Kappa : 0.9314          \n",
       "                                          \n",
       " Mcnemar's Test P-Value : 1               \n",
       "                                          \n",
       "            Sensitivity : 0.9750          \n",
       "            Specificity : 0.9583          \n",
       "         Pos Pred Value : 0.9512          \n",
       "         Neg Pred Value : 0.9787          \n",
       "             Prevalence : 0.4545          \n",
       "         Detection Rate : 0.4432          \n",
       "   Detection Prevalence : 0.4659          \n",
       "      Balanced Accuracy : 0.9667          \n",
       "                                          \n",
       "       'Positive' Class : Yes             \n",
       "                                          "
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
   "duration": 10.113931,
   "end_time": "2023-03-03T11:45:45.263481",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-03T11:45:35.149550",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
