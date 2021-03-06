/*
path: edit.tpl
type: file
unique_id: VikMgBcd
icon: ico-field
*/
{% set tableName = ( field | fieldData ).table.name |ย friendly %}
{% set bpr %}
import Select from '@mui/material/Select'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import FormControl from '@mui/material/FormControl'
{% endset %}
{{ save_delayed('bpr', bpr) }}
{% set bpr %}
import MenuItem from '@mui/material/MenuItem'
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FormControl
    margin='{{ element.values.margin|default("dense") }}'
    variant="{{ element.values.variant|default('standard') }}"
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
>
  <Select
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    value={ {{ tableName }}data.{{ field.column_name | friendly }}}
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
    displayEmpty
  >
    <MenuItem value=""><em>None</em></MenuItem>
    <MenuItem value="Ascension Island">๐ฆ๐จ - Ascension Island</MenuItem>
    <MenuItem value="Andorra">๐ฆ๐ฉ - Andorra</MenuItem>
    <MenuItem value="United Arab Emirates">๐ฆ๐ช - United Arab Emirates</MenuItem>
    <MenuItem value="Afghanistan">๐ฆ๐ซ - Afghanistan</MenuItem>
    <MenuItem value="Antigua & Barbuda">๐ฆ๐ฌ - Antigua & Barbuda</MenuItem>
    <MenuItem value="Anguilla">๐ฆ๐ฎ - Anguilla</MenuItem>
    <MenuItem value="Albania">๐ฆ๐ฑ - Albania</MenuItem>
    <MenuItem value="Armenia">๐ฆ๐ฒ - Armenia</MenuItem>
    <MenuItem value="Angola">๐ฆ๐ด - Angola</MenuItem>
    <MenuItem value="Antarctica">๐ฆ๐ถ - Antarctica</MenuItem>
    <MenuItem value="Argentina">๐ฆ๐ท - Argentina</MenuItem>
    <MenuItem value="American Samoa">๐ฆ๐ธ - American Samoa</MenuItem>
    <MenuItem value="Austria">๐ฆ๐น - Austria</MenuItem>
    <MenuItem value="Australia">๐ฆ๐บ - Australia</MenuItem>
    <MenuItem value="Aruba">๐ฆ๐ผ - Aruba</MenuItem>
    <MenuItem value="รland Islands">๐ฆ๐ฝ - รland Islands</MenuItem>
    <MenuItem value="Azerbaijan">๐ฆ๐ฟ - Azerbaijan</MenuItem>
    <MenuItem value="Bosnia & Herzegovina">๐ง๐ฆ - Bosnia & Herzegovina</MenuItem>
    <MenuItem value="Barbados">๐ง๐ง - Barbados</MenuItem>
    <MenuItem value="Bangladesh">๐ง๐ฉ - Bangladesh</MenuItem>
    <MenuItem value="Belgium">๐ง๐ช - Belgium</MenuItem>
    <MenuItem value="Burkina Faso">๐ง๐ซ - Burkina Faso</MenuItem>
    <MenuItem value="Bulgaria">๐ง๐ฌ - Bulgaria</MenuItem>
    <MenuItem value="Bahrain">๐ง๐ญ - Bahrain</MenuItem>
    <MenuItem value="Burundi">๐ง๐ฎ - Burundi</MenuItem>
    <MenuItem value="Benin">๐ง๐ฏ - Benin</MenuItem>
    <MenuItem value="St. Barthรฉlemy">๐ง๐ฑ - St. Barthรฉlemy</MenuItem>
    <MenuItem value="Bermuda">๐ง๐ฒ - Bermuda</MenuItem>
    <MenuItem value="Brunei">๐ง๐ณ - Brunei</MenuItem>
    <MenuItem value="Bolivia">๐ง๐ด - Bolivia</MenuItem>
    <MenuItem value="Caribbean Netherlands">๐ง๐ถ - Caribbean Netherlands</MenuItem>
    <MenuItem value="Brazil">๐ง๐ท - Brazil</MenuItem>
    <MenuItem value="Bahamas">๐ง๐ธ - Bahamas</MenuItem>
    <MenuItem value="Bhutan">๐ง๐น - Bhutan</MenuItem>
    <MenuItem value="Bouvet Island">๐ง๐ป - Bouvet Island</MenuItem>
    <MenuItem value="Botswana">๐ง๐ผ - Botswana</MenuItem>
    <MenuItem value="Belarus">๐ง๐พ - Belarus</MenuItem>
    <MenuItem value="Belize">๐ง๐ฟ - Belize</MenuItem>
    <MenuItem value="Canada">๐จ๐ฆ - Canada</MenuItem>
    <MenuItem value="Cocos (Keeling) Islands">๐จ๐จ - Cocos (Keeling) Islands</MenuItem>
    <MenuItem value="Congo - Kinshasa">๐จ๐ฉ - Congo - Kinshasa</MenuItem>
    <MenuItem value="Central African Republic">๐จ๐ซ - Central African Republic</MenuItem>
    <MenuItem value="Congo - Brazzaville">๐จ๐ฌ - Congo - Brazzaville</MenuItem>
    <MenuItem value="Switzerland">๐จ๐ญ - Switzerland</MenuItem>
    <MenuItem value="Cรดte dโIvoire">๐จ๐ฎ - Cรดte dโIvoire</MenuItem>
    <MenuItem value="Cook Islands">๐จ๐ฐ - Cook Islands</MenuItem>
    <MenuItem value="Chile">๐จ๐ฑ - Chile</MenuItem>
    <MenuItem value="Cameroon">๐จ๐ฒ - Cameroon</MenuItem>
    <MenuItem value="China">๐จ๐ณ - China</MenuItem>
    <MenuItem value="Colombia">๐จ๐ด - Colombia</MenuItem>
    <MenuItem value="Clipperton Island">๐จ๐ต - Clipperton Island</MenuItem>
    <MenuItem value="Costa Rica">๐จ๐ท - Costa Rica</MenuItem>
    <MenuItem value="Cuba">๐จ๐บ - Cuba</MenuItem>
    <MenuItem value="Cape Verde">๐จ๐ป - Cape Verde</MenuItem>
    <MenuItem value="Curaรงao">๐จ๐ผ - Curaรงao</MenuItem>
    <MenuItem value="Christmas Island">๐จ๐ฝ - Christmas Island</MenuItem>
    <MenuItem value="Cyprus">๐จ๐พ - Cyprus</MenuItem>
    <MenuItem value="Czechia">๐จ๐ฟ - Czechia</MenuItem>
    <MenuItem value="Germany">๐ฉ๐ช - Germany</MenuItem>
    <MenuItem value="Diego Garcia">๐ฉ๐ฌ - Diego Garcia</MenuItem>
    <MenuItem value="Djibouti">๐ฉ๐ฏ - Djibouti</MenuItem>
    <MenuItem value="Denmark">๐ฉ๐ฐ - Denmark</MenuItem>
    <MenuItem value="Dominica">๐ฉ๐ฒ - Dominica</MenuItem>
    <MenuItem value="Dominican Republic">๐ฉ๐ด - Dominican Republic</MenuItem>
    <MenuItem value="Algeria">๐ฉ๐ฟ - Algeria</MenuItem>
    <MenuItem value="Ceuta & Melilla">๐ช๐ฆ - Ceuta & Melilla</MenuItem>
    <MenuItem value="Ecuador">๐ช๐จ - Ecuador</MenuItem>
    <MenuItem value="Estonia">๐ช๐ช - Estonia</MenuItem>
    <MenuItem value="Egypt">๐ช๐ฌ - Egypt</MenuItem>
    <MenuItem value="Western Sahara">๐ช๐ญ - Western Sahara</MenuItem>
    <MenuItem value="Eritrea">๐ช๐ท - Eritrea</MenuItem>
    <MenuItem value="Spain">๐ช๐ธ - Spain</MenuItem>
    <MenuItem value="Ethiopia">๐ช๐น - Ethiopia</MenuItem>
    <MenuItem value="European Union">๐ช๐บ - European Union</MenuItem>
    <MenuItem value="Finland">๐ซ๐ฎ - Finland</MenuItem>
    <MenuItem value="Fiji">๐ซ๐ฏ - Fiji</MenuItem>
    <MenuItem value="Falkland Islands">๐ซ๐ฐ - Falkland Islands</MenuItem>
    <MenuItem value="Micronesia">๐ซ๐ฒ - Micronesia</MenuItem>
    <MenuItem value="Faroe Islands">๐ซ๐ด - Faroe Islands</MenuItem>
    <MenuItem value="France">๐ซ๐ท - France</MenuItem>
    <MenuItem value="Gabon">๐ฌ๐ฆ - Gabon</MenuItem>
    <MenuItem value="United Kingdom">๐ฌ๐ง - United Kingdom</MenuItem>
    <MenuItem value="Grenada">๐ฌ๐ฉ - Grenada</MenuItem>
    <MenuItem value="Georgia">๐ฌ๐ช - Georgia</MenuItem>
    <MenuItem value="French Guiana">๐ฌ๐ซ - French Guiana</MenuItem>
    <MenuItem value="Guernsey">๐ฌ๐ฌ - Guernsey</MenuItem>
    <MenuItem value="Ghana">๐ฌ๐ญ - Ghana</MenuItem>
    <MenuItem value="Gibraltar">๐ฌ๐ฎ - Gibraltar</MenuItem>
    <MenuItem value="Greenland">๐ฌ๐ฑ - Greenland</MenuItem>
    <MenuItem value="Gambia">๐ฌ๐ฒ - Gambia</MenuItem>
    <MenuItem value="Guinea">๐ฌ๐ณ - Guinea</MenuItem>
    <MenuItem value="Guadeloupe">๐ฌ๐ต - Guadeloupe</MenuItem>
    <MenuItem value="Equatorial Guinea">๐ฌ๐ถ - Equatorial Guinea</MenuItem>
    <MenuItem value="Greece">๐ฌ๐ท - Greece</MenuItem>
    <MenuItem value="South Georgia & South Sandwich Islands">๐ฌ๐ธ - South Georgia & South Sandwich Islands</MenuItem>
    <MenuItem value="Guatemala">๐ฌ๐น - Guatemala</MenuItem>
    <MenuItem value="Guam">๐ฌ๐บ - Guam</MenuItem>
    <MenuItem value="Guinea-Bissau">๐ฌ๐ผ - Guinea-Bissau</MenuItem>
    <MenuItem value="Guyana">๐ฌ๐พ - Guyana</MenuItem>
    <MenuItem value="Hong Kong SAR China">๐ญ๐ฐ - Hong Kong SAR China</MenuItem>
    <MenuItem value="Heard & McDonald Islands">๐ญ๐ฒ - Heard & McDonald Islands</MenuItem>
    <MenuItem value="Honduras">๐ญ๐ณ - Honduras</MenuItem>
    <MenuItem value="Croatia">๐ญ๐ท - Croatia</MenuItem>
    <MenuItem value="Haiti">๐ญ๐น - Haiti</MenuItem>
    <MenuItem value="Hungary">๐ญ๐บ - Hungary</MenuItem>
    <MenuItem value="Canary Islands">๐ฎ๐จ - Canary Islands</MenuItem>
    <MenuItem value="Indonesia">๐ฎ๐ฉ - Indonesia</MenuItem>
    <MenuItem value="Ireland">๐ฎ๐ช - Ireland</MenuItem>
    <MenuItem value="Israel">๐ฎ๐ฑ - Israel</MenuItem>
    <MenuItem value="Isle of Man">๐ฎ๐ฒ - Isle of Man</MenuItem>
    <MenuItem value="India">๐ฎ๐ณ - India</MenuItem>
    <MenuItem value="British Indian Ocean Territory">๐ฎ๐ด - British Indian Ocean Territory</MenuItem>
    <MenuItem value="Iraq">๐ฎ๐ถ - Iraq</MenuItem>
    <MenuItem value="Iran">๐ฎ๐ท - Iran</MenuItem>
    <MenuItem value="Iceland">๐ฎ๐ธ - Iceland</MenuItem>
    <MenuItem value="Italy">๐ฎ๐น - Italy</MenuItem>
    <MenuItem value="Jersey">๐ฏ๐ช - Jersey</MenuItem>
    <MenuItem value="Jamaica">๐ฏ๐ฒ - Jamaica</MenuItem>
    <MenuItem value="Jordan">๐ฏ๐ด - Jordan</MenuItem>
    <MenuItem value="Japan">๐ฏ๐ต - Japan</MenuItem>
    <MenuItem value="Kenya">๐ฐ๐ช - Kenya</MenuItem>
    <MenuItem value="Kyrgyzstan">๐ฐ๐ฌ - Kyrgyzstan</MenuItem>
    <MenuItem value="Cambodia">๐ฐ๐ญ - Cambodia</MenuItem>
    <MenuItem value="Kiribati">๐ฐ๐ฎ - Kiribati</MenuItem>
    <MenuItem value="Comoros">๐ฐ๐ฒ - Comoros</MenuItem>
    <MenuItem value="St. Kitts & Nevis">๐ฐ๐ณ - St. Kitts & Nevis</MenuItem>
    <MenuItem value="North Korea">๐ฐ๐ต - North Korea</MenuItem>
    <MenuItem value="South Korea">๐ฐ๐ท - South Korea</MenuItem>
    <MenuItem value="Kuwait">๐ฐ๐ผ - Kuwait</MenuItem>
    <MenuItem value="Cayman Islands">๐ฐ๐พ - Cayman Islands</MenuItem>
    <MenuItem value="Kazakhstan">๐ฐ๐ฟ - Kazakhstan</MenuItem>
    <MenuItem value="Laos">๐ฑ๐ฆ - Laos</MenuItem>
    <MenuItem value="Lebanon">๐ฑ๐ง - Lebanon</MenuItem>
    <MenuItem value="St. Lucia">๐ฑ๐จ - St. Lucia</MenuItem>
    <MenuItem value="Liechtenstein">๐ฑ๐ฎ - Liechtenstein</MenuItem>
    <MenuItem value="Sri Lanka">๐ฑ๐ฐ - Sri Lanka</MenuItem>
    <MenuItem value="Liberia">๐ฑ๐ท - Liberia</MenuItem>
    <MenuItem value="Lesotho">๐ฑ๐ธ - Lesotho</MenuItem>
    <MenuItem value="Lithuania">๐ฑ๐น - Lithuania</MenuItem>
    <MenuItem value="Luxembourg">๐ฑ๐บ - Luxembourg</MenuItem>
    <MenuItem value="Latvia">๐ฑ๐ป - Latvia</MenuItem>
    <MenuItem value="Libya">๐ฑ๐พ - Libya</MenuItem>
    <MenuItem value="Morocco">๐ฒ๐ฆ - Morocco</MenuItem>
    <MenuItem value="Monaco">๐ฒ๐จ - Monaco</MenuItem>
    <MenuItem value="Moldova">๐ฒ๐ฉ - Moldova</MenuItem>
    <MenuItem value="Montenegro">๐ฒ๐ช - Montenegro</MenuItem>
    <MenuItem value="St. Martin">๐ฒ๐ซ - St. Martin</MenuItem>
    <MenuItem value="Madagascar">๐ฒ๐ฌ - Madagascar</MenuItem>
    <MenuItem value="Marshall Islands">๐ฒ๐ญ - Marshall Islands</MenuItem>
    <MenuItem value="Macedonia">๐ฒ๐ฐ - Macedonia</MenuItem>
    <MenuItem value="Mali">๐ฒ๐ฑ - Mali</MenuItem>
    <MenuItem value="Myanmar (Burma)">๐ฒ๐ฒ - Myanmar (Burma)</MenuItem>
    <MenuItem value="Mongolia">๐ฒ๐ณ - Mongolia</MenuItem>
    <MenuItem value="Macau SAR China">๐ฒ๐ด - Macau SAR China</MenuItem>
    <MenuItem value="Northern Mariana Islands">๐ฒ๐ต - Northern Mariana Islands</MenuItem>
    <MenuItem value="Martinique">๐ฒ๐ถ - Martinique</MenuItem>
    <MenuItem value="Mauritania">๐ฒ๐ท - Mauritania</MenuItem>
    <MenuItem value="Montserrat">๐ฒ๐ธ - Montserrat</MenuItem>
    <MenuItem value="Malta">๐ฒ๐น - Malta</MenuItem>
    <MenuItem value="Mauritius">๐ฒ๐บ - Mauritius</MenuItem>
    <MenuItem value="Maldives">๐ฒ๐ป - Maldives</MenuItem>
    <MenuItem value="Malawi">๐ฒ๐ผ - Malawi</MenuItem>
    <MenuItem value="Mexico">๐ฒ๐ฝ - Mexico</MenuItem>
    <MenuItem value="Malaysia">๐ฒ๐พ - Malaysia</MenuItem>
    <MenuItem value="Mozambique">๐ฒ๐ฟ - Mozambique</MenuItem>
    <MenuItem value="Namibia">๐ณ๐ฆ - Namibia</MenuItem>
    <MenuItem value="New Caledonia">๐ณ๐จ - New Caledonia</MenuItem>
    <MenuItem value="Niger">๐ณ๐ช - Niger</MenuItem>
    <MenuItem value="Norfolk Island">๐ณ๐ซ - Norfolk Island</MenuItem>
    <MenuItem value="Nigeria">๐ณ๐ฌ - Nigeria</MenuItem>
    <MenuItem value="Nicaragua">๐ณ๐ฎ - Nicaragua</MenuItem>
    <MenuItem value="Netherlands">๐ณ๐ฑ - Netherlands</MenuItem>
    <MenuItem value="Norway">๐ณ๐ด - Norway</MenuItem>
    <MenuItem value="Nepal">๐ณ๐ต - Nepal</MenuItem>
    <MenuItem value="Nauru">๐ณ๐ท - Nauru</MenuItem>
    <MenuItem value="Niue">๐ณ๐บ - Niue</MenuItem>
    <MenuItem value="New Zealand">๐ณ๐ฟ - New Zealand</MenuItem>
    <MenuItem value="Oman">๐ด๐ฒ - Oman</MenuItem>
    <MenuItem value="Panama">๐ต๐ฆ - Panama</MenuItem>
    <MenuItem value="Peru">๐ต๐ช - Peru</MenuItem>
    <MenuItem value="French Polynesia">๐ต๐ซ - French Polynesia</MenuItem>
    <MenuItem value="Papua New Guinea">๐ต๐ฌ - Papua New Guinea</MenuItem>
    <MenuItem value="Philippines">๐ต๐ญ - Philippines</MenuItem>
    <MenuItem value="Pakistan">๐ต๐ฐ - Pakistan</MenuItem>
    <MenuItem value="Poland">๐ต๐ฑ - Poland</MenuItem>
    <MenuItem value="St. Pierre & Miquelon">๐ต๐ฒ - St. Pierre & Miquelon</MenuItem>
    <MenuItem value="Pitcairn Islands">๐ต๐ณ - Pitcairn Islands</MenuItem>
    <MenuItem value="Puerto Rico">๐ต๐ท - Puerto Rico</MenuItem>
    <MenuItem value="Palestinian Territories">๐ต๐ธ - Palestinian Territories</MenuItem>
    <MenuItem value="Portugal">๐ต๐น - Portugal</MenuItem>
    <MenuItem value="Palau">๐ต๐ผ - Palau</MenuItem>
    <MenuItem value="Paraguay">๐ต๐พ - Paraguay</MenuItem>
    <MenuItem value="Qatar">๐ถ๐ฆ - Qatar</MenuItem>
    <MenuItem value="Rรฉunion">๐ท๐ช - Rรฉunion</MenuItem>
    <MenuItem value="Romania">๐ท๐ด - Romania</MenuItem>
    <MenuItem value="Serbia">๐ท๐ธ - Serbia</MenuItem>
    <MenuItem value="Russia">๐ท๐บ - Russia</MenuItem>
    <MenuItem value="Rwanda">๐ท๐ผ - Rwanda</MenuItem>
    <MenuItem value="Saudi Arabia">๐ธ๐ฆ - Saudi Arabia</MenuItem>
    <MenuItem value="Solomon Islands">๐ธ๐ง - Solomon Islands</MenuItem>
    <MenuItem value="Seychelles">๐ธ๐จ - Seychelles</MenuItem>
    <MenuItem value="Sudan">๐ธ๐ฉ - Sudan</MenuItem>
    <MenuItem value="Sweden">๐ธ๐ช - Sweden</MenuItem>
    <MenuItem value="Singapore">๐ธ๐ฌ - Singapore</MenuItem>
    <MenuItem value="St. Helena">๐ธ๐ญ - St. Helena</MenuItem>
    <MenuItem value="Slovenia">๐ธ๐ฎ - Slovenia</MenuItem>
    <MenuItem value="Svalbard & Jan Mayen">๐ธ๐ฏ - Svalbard & Jan Mayen</MenuItem>
    <MenuItem value="Slovakia">๐ธ๐ฐ - Slovakia</MenuItem>
    <MenuItem value="Sierra Leone">๐ธ๐ฑ - Sierra Leone</MenuItem>
    <MenuItem value="San Marino">๐ธ๐ฒ - San Marino</MenuItem>
    <MenuItem value="Senegal">๐ธ๐ณ - Senegal</MenuItem>
    <MenuItem value="Somalia">๐ธ๐ด - Somalia</MenuItem>
    <MenuItem value="Suriname">๐ธ๐ท - Suriname</MenuItem>
    <MenuItem value="South Sudan">๐ธ๐ธ - South Sudan</MenuItem>
    <MenuItem value="Sรฃo Tomรฉ & Prรญncipe">๐ธ๐น - Sรฃo Tomรฉ & Prรญncipe</MenuItem>
    <MenuItem value="El Salvador">๐ธ๐ป - El Salvador</MenuItem>
    <MenuItem value="Sint Maarten">๐ธ๐ฝ - Sint Maarten</MenuItem>
    <MenuItem value="Syria">๐ธ๐พ - Syria</MenuItem>
    <MenuItem value="Swaziland">๐ธ๐ฟ - Swaziland</MenuItem>
    <MenuItem value="Tristan da Cunha">๐น๐ฆ - Tristan da Cunha</MenuItem>
    <MenuItem value="Turks & Caicos Islands">๐น๐จ - Turks & Caicos Islands</MenuItem>
    <MenuItem value="Chad">๐น๐ฉ - Chad</MenuItem>
    <MenuItem value="French Southern Territories">๐น๐ซ - French Southern Territories</MenuItem>
    <MenuItem value="Togo">๐น๐ฌ - Togo</MenuItem>
    <MenuItem value="Thailand">๐น๐ญ - Thailand</MenuItem>
    <MenuItem value="Tajikistan">๐น๐ฏ - Tajikistan</MenuItem>
    <MenuItem value="Tokelau">๐น๐ฐ - Tokelau</MenuItem>
    <MenuItem value="Timor-Leste">๐น๐ฑ - Timor-Leste</MenuItem>
    <MenuItem value="Turkmenistan">๐น๐ฒ - Turkmenistan</MenuItem>
    <MenuItem value="Tunisia">๐น๐ณ - Tunisia</MenuItem>
    <MenuItem value="Tonga">๐น๐ด - Tonga</MenuItem>
    <MenuItem value="Turkey">๐น๐ท - Turkey</MenuItem>
    <MenuItem value="Trinidad & Tobago">๐น๐น - Trinidad & Tobago</MenuItem>
    <MenuItem value="Tuvalu">๐น๐ป - Tuvalu</MenuItem>
    <MenuItem value="Taiwan">๐น๐ผ - Taiwan</MenuItem>
    <MenuItem value="Tanzania">๐น๐ฟ - Tanzania</MenuItem>
    <MenuItem value="Ukraine">๐บ๐ฆ - Ukraine</MenuItem>
    <MenuItem value="Uganda">๐บ๐ฌ - Uganda</MenuItem>
    <MenuItem value="U.S. Outlying Islands">๐บ๐ฒ - U.S. Outlying Islands</MenuItem>
    <MenuItem value="United Nations">๐บ๐ณ - United Nations</MenuItem>
    <MenuItem value="United States">๐บ๐ธ - United States</MenuItem>
    <MenuItem value="Uruguay">๐บ๐พ - Uruguay</MenuItem>
    <MenuItem value="Uzbekistan">๐บ๐ฟ - Uzbekistan</MenuItem>
    <MenuItem value="Vatican City">๐ป๐ฆ - Vatican City</MenuItem>
    <MenuItem value="St. Vincent & Grenadines">๐ป๐จ - St. Vincent & Grenadines</MenuItem>
    <MenuItem value="Venezuela">๐ป๐ช - Venezuela</MenuItem>
    <MenuItem value="British Virgin Islands">๐ป๐ฌ - British Virgin Islands</MenuItem>
    <MenuItem value="U.S. Virgin Islands">๐ป๐ฎ - U.S. Virgin Islands</MenuItem>
    <MenuItem value="Vietnam">๐ป๐ณ - Vietnam</MenuItem>
    <MenuItem value="Vanuatu">๐ป๐บ - Vanuatu</MenuItem>
    <MenuItem value="Wallis & Futuna">๐ผ๐ซ - Wallis & Futuna</MenuItem>
    <MenuItem value="Samoa">๐ผ๐ธ - Samoa</MenuItem>
    <MenuItem value="Kosovo">๐ฝ๐ฐ - Kosovo</MenuItem>
    <MenuItem value="Yemen">๐พ๐ช - Yemen</MenuItem>
    <MenuItem value="Mayotte">๐พ๐น - Mayotte</MenuItem>
    <MenuItem value="South Africa">๐ฟ๐ฆ - South Africa</MenuItem>
    <MenuItem value="Zambia">๐ฟ๐ฒ - Zambia</MenuItem>
    <MenuItem value="Zimbabwe">๐ฟ๐ผ - Zimbabwe</MenuItem>
  </Select>
</FormControl>


