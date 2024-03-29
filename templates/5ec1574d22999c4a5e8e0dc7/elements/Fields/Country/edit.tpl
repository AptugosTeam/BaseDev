/*
path: edit.tpl
type: file
unique_id: VikMgBcd
icon: ico-field
*/
{% set tableName = ( field | fieldData ).table.name | friendly %}
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
import { InputLabel } from '@mui/material';
{% endset %}
{{ save_delayed('bpr', bpr) }}
<FormControl
    margin='{{ element.values.margin|default("dense") }}'
    size='{{ element.values.size|default("medium") }}'
    variant="{{ element.values.variant|default('standard') }}"
    {% if element.values.Autofocus %}autoFocus{% endif %}
    {% if element.values.DisableVariable %}disabled={ {{ element.values.DisableVariable }} }{% endif %}
>
    {% if element.values.inputLabel %}
  <InputLabel id={{ field.prompt|default(field.column_name)  | textOrVariable }}>{{ element.values.inputLabel }}</InputLabel>
    {% endif %}
  <Select
    label={{ field.prompt|default(field.column_name)  | textOrVariable }}
    labelId={{ field.prompt|default(field.column_name)  | textOrVariable }}
    value={ {{ tableName }}data.{{ field.column_name | friendly }}}
    onChange={handle{{ tableName }}Change("{{ field.column_name | friendly }}")}
    displayEmpty
  >
    <MenuItem value=""><em>None</em></MenuItem>
    <MenuItem value="Ascension Island">🇦🇨 - Ascension Island</MenuItem>
    <MenuItem value="Andorra">🇦🇩 - Andorra</MenuItem>
    <MenuItem value="United Arab Emirates">🇦🇪 - United Arab Emirates</MenuItem>
    <MenuItem value="Afghanistan">🇦🇫 - Afghanistan</MenuItem>
    <MenuItem value="Antigua & Barbuda">🇦🇬 - Antigua & Barbuda</MenuItem>
    <MenuItem value="Anguilla">🇦🇮 - Anguilla</MenuItem>
    <MenuItem value="Albania">🇦🇱 - Albania</MenuItem>
    <MenuItem value="Armenia">🇦🇲 - Armenia</MenuItem>
    <MenuItem value="Angola">🇦🇴 - Angola</MenuItem>
    <MenuItem value="Antarctica">🇦🇶 - Antarctica</MenuItem>
    <MenuItem value="Argentina">🇦🇷 - Argentina</MenuItem>
    <MenuItem value="American Samoa">🇦🇸 - American Samoa</MenuItem>
    <MenuItem value="Austria">🇦🇹 - Austria</MenuItem>
    <MenuItem value="Australia">🇦🇺 - Australia</MenuItem>
    <MenuItem value="Aruba">🇦🇼 - Aruba</MenuItem>
    <MenuItem value="Åland Islands">🇦🇽 - Åland Islands</MenuItem>
    <MenuItem value="Azerbaijan">🇦🇿 - Azerbaijan</MenuItem>
    <MenuItem value="Bosnia & Herzegovina">🇧🇦 - Bosnia & Herzegovina</MenuItem>
    <MenuItem value="Barbados">🇧🇧 - Barbados</MenuItem>
    <MenuItem value="Bangladesh">🇧🇩 - Bangladesh</MenuItem>
    <MenuItem value="Belgium">🇧🇪 - Belgium</MenuItem>
    <MenuItem value="Burkina Faso">🇧🇫 - Burkina Faso</MenuItem>
    <MenuItem value="Bulgaria">🇧🇬 - Bulgaria</MenuItem>
    <MenuItem value="Bahrain">🇧🇭 - Bahrain</MenuItem>
    <MenuItem value="Burundi">🇧🇮 - Burundi</MenuItem>
    <MenuItem value="Benin">🇧🇯 - Benin</MenuItem>
    <MenuItem value="St. Barthélemy">🇧🇱 - St. Barthélemy</MenuItem>
    <MenuItem value="Bermuda">🇧🇲 - Bermuda</MenuItem>
    <MenuItem value="Brunei">🇧🇳 - Brunei</MenuItem>
    <MenuItem value="Bolivia">🇧🇴 - Bolivia</MenuItem>
    <MenuItem value="Caribbean Netherlands">🇧🇶 - Caribbean Netherlands</MenuItem>
    <MenuItem value="Brazil">🇧🇷 - Brazil</MenuItem>
    <MenuItem value="Bahamas">🇧🇸 - Bahamas</MenuItem>
    <MenuItem value="Bhutan">🇧🇹 - Bhutan</MenuItem>
    <MenuItem value="Bouvet Island">🇧🇻 - Bouvet Island</MenuItem>
    <MenuItem value="Botswana">🇧🇼 - Botswana</MenuItem>
    <MenuItem value="Belarus">🇧🇾 - Belarus</MenuItem>
    <MenuItem value="Belize">🇧🇿 - Belize</MenuItem>
    <MenuItem value="Canada">🇨🇦 - Canada</MenuItem>
    <MenuItem value="Cocos (Keeling) Islands">🇨🇨 - Cocos (Keeling) Islands</MenuItem>
    <MenuItem value="Congo - Kinshasa">🇨🇩 - Congo - Kinshasa</MenuItem>
    <MenuItem value="Central African Republic">🇨🇫 - Central African Republic</MenuItem>
    <MenuItem value="Congo - Brazzaville">🇨🇬 - Congo - Brazzaville</MenuItem>
    <MenuItem value="Switzerland">🇨🇭 - Switzerland</MenuItem>
    <MenuItem value="Côte d’Ivoire">🇨🇮 - Côte d’Ivoire</MenuItem>
    <MenuItem value="Cook Islands">🇨🇰 - Cook Islands</MenuItem>
    <MenuItem value="Chile">🇨🇱 - Chile</MenuItem>
    <MenuItem value="Cameroon">🇨🇲 - Cameroon</MenuItem>
    <MenuItem value="China">🇨🇳 - China</MenuItem>
    <MenuItem value="Colombia">🇨🇴 - Colombia</MenuItem>
    <MenuItem value="Clipperton Island">🇨🇵 - Clipperton Island</MenuItem>
    <MenuItem value="Costa Rica">🇨🇷 - Costa Rica</MenuItem>
    <MenuItem value="Cuba">🇨🇺 - Cuba</MenuItem>
    <MenuItem value="Cape Verde">🇨🇻 - Cape Verde</MenuItem>
    <MenuItem value="Curaçao">🇨🇼 - Curaçao</MenuItem>
    <MenuItem value="Christmas Island">🇨🇽 - Christmas Island</MenuItem>
    <MenuItem value="Cyprus">🇨🇾 - Cyprus</MenuItem>
    <MenuItem value="Czechia">🇨🇿 - Czechia</MenuItem>
    <MenuItem value="Germany">🇩🇪 - Germany</MenuItem>
    <MenuItem value="Diego Garcia">🇩🇬 - Diego Garcia</MenuItem>
    <MenuItem value="Djibouti">🇩🇯 - Djibouti</MenuItem>
    <MenuItem value="Denmark">🇩🇰 - Denmark</MenuItem>
    <MenuItem value="Dominica">🇩🇲 - Dominica</MenuItem>
    <MenuItem value="Dominican Republic">🇩🇴 - Dominican Republic</MenuItem>
    <MenuItem value="Algeria">🇩🇿 - Algeria</MenuItem>
    <MenuItem value="Ceuta & Melilla">🇪🇦 - Ceuta & Melilla</MenuItem>
    <MenuItem value="Ecuador">🇪🇨 - Ecuador</MenuItem>
    <MenuItem value="Estonia">🇪🇪 - Estonia</MenuItem>
    <MenuItem value="Egypt">🇪🇬 - Egypt</MenuItem>
    <MenuItem value="Western Sahara">🇪🇭 - Western Sahara</MenuItem>
    <MenuItem value="Eritrea">🇪🇷 - Eritrea</MenuItem>
    <MenuItem value="Spain">🇪🇸 - Spain</MenuItem>
    <MenuItem value="Ethiopia">🇪🇹 - Ethiopia</MenuItem>
    <MenuItem value="European Union">🇪🇺 - European Union</MenuItem>
    <MenuItem value="Finland">🇫🇮 - Finland</MenuItem>
    <MenuItem value="Fiji">🇫🇯 - Fiji</MenuItem>
    <MenuItem value="Falkland Islands">🇫🇰 - Falkland Islands</MenuItem>
    <MenuItem value="Micronesia">🇫🇲 - Micronesia</MenuItem>
    <MenuItem value="Faroe Islands">🇫🇴 - Faroe Islands</MenuItem>
    <MenuItem value="France">🇫🇷 - France</MenuItem>
    <MenuItem value="Gabon">🇬🇦 - Gabon</MenuItem>
    <MenuItem value="United Kingdom">🇬🇧 - United Kingdom</MenuItem>
    <MenuItem value="Grenada">🇬🇩 - Grenada</MenuItem>
    <MenuItem value="Georgia">🇬🇪 - Georgia</MenuItem>
    <MenuItem value="French Guiana">🇬🇫 - French Guiana</MenuItem>
    <MenuItem value="Guernsey">🇬🇬 - Guernsey</MenuItem>
    <MenuItem value="Ghana">🇬🇭 - Ghana</MenuItem>
    <MenuItem value="Gibraltar">🇬🇮 - Gibraltar</MenuItem>
    <MenuItem value="Greenland">🇬🇱 - Greenland</MenuItem>
    <MenuItem value="Gambia">🇬🇲 - Gambia</MenuItem>
    <MenuItem value="Guinea">🇬🇳 - Guinea</MenuItem>
    <MenuItem value="Guadeloupe">🇬🇵 - Guadeloupe</MenuItem>
    <MenuItem value="Equatorial Guinea">🇬🇶 - Equatorial Guinea</MenuItem>
    <MenuItem value="Greece">🇬🇷 - Greece</MenuItem>
    <MenuItem value="South Georgia & South Sandwich Islands">🇬🇸 - South Georgia & South Sandwich Islands</MenuItem>
    <MenuItem value="Guatemala">🇬🇹 - Guatemala</MenuItem>
    <MenuItem value="Guam">🇬🇺 - Guam</MenuItem>
    <MenuItem value="Guinea-Bissau">🇬🇼 - Guinea-Bissau</MenuItem>
    <MenuItem value="Guyana">🇬🇾 - Guyana</MenuItem>
    <MenuItem value="Hong Kong SAR China">🇭🇰 - Hong Kong SAR China</MenuItem>
    <MenuItem value="Heard & McDonald Islands">🇭🇲 - Heard & McDonald Islands</MenuItem>
    <MenuItem value="Honduras">🇭🇳 - Honduras</MenuItem>
    <MenuItem value="Croatia">🇭🇷 - Croatia</MenuItem>
    <MenuItem value="Haiti">🇭🇹 - Haiti</MenuItem>
    <MenuItem value="Hungary">🇭🇺 - Hungary</MenuItem>
    <MenuItem value="Canary Islands">🇮🇨 - Canary Islands</MenuItem>
    <MenuItem value="Indonesia">🇮🇩 - Indonesia</MenuItem>
    <MenuItem value="Ireland">🇮🇪 - Ireland</MenuItem>
    <MenuItem value="Israel">🇮🇱 - Israel</MenuItem>
    <MenuItem value="Isle of Man">🇮🇲 - Isle of Man</MenuItem>
    <MenuItem value="India">🇮🇳 - India</MenuItem>
    <MenuItem value="British Indian Ocean Territory">🇮🇴 - British Indian Ocean Territory</MenuItem>
    <MenuItem value="Iraq">🇮🇶 - Iraq</MenuItem>
    <MenuItem value="Iran">🇮🇷 - Iran</MenuItem>
    <MenuItem value="Iceland">🇮🇸 - Iceland</MenuItem>
    <MenuItem value="Italy">🇮🇹 - Italy</MenuItem>
    <MenuItem value="Jersey">🇯🇪 - Jersey</MenuItem>
    <MenuItem value="Jamaica">🇯🇲 - Jamaica</MenuItem>
    <MenuItem value="Jordan">🇯🇴 - Jordan</MenuItem>
    <MenuItem value="Japan">🇯🇵 - Japan</MenuItem>
    <MenuItem value="Kenya">🇰🇪 - Kenya</MenuItem>
    <MenuItem value="Kyrgyzstan">🇰🇬 - Kyrgyzstan</MenuItem>
    <MenuItem value="Cambodia">🇰🇭 - Cambodia</MenuItem>
    <MenuItem value="Kiribati">🇰🇮 - Kiribati</MenuItem>
    <MenuItem value="Comoros">🇰🇲 - Comoros</MenuItem>
    <MenuItem value="St. Kitts & Nevis">🇰🇳 - St. Kitts & Nevis</MenuItem>
    <MenuItem value="North Korea">🇰🇵 - North Korea</MenuItem>
    <MenuItem value="South Korea">🇰🇷 - South Korea</MenuItem>
    <MenuItem value="Kuwait">🇰🇼 - Kuwait</MenuItem>
    <MenuItem value="Cayman Islands">🇰🇾 - Cayman Islands</MenuItem>
    <MenuItem value="Kazakhstan">🇰🇿 - Kazakhstan</MenuItem>
    <MenuItem value="Laos">🇱🇦 - Laos</MenuItem>
    <MenuItem value="Lebanon">🇱🇧 - Lebanon</MenuItem>
    <MenuItem value="St. Lucia">🇱🇨 - St. Lucia</MenuItem>
    <MenuItem value="Liechtenstein">🇱🇮 - Liechtenstein</MenuItem>
    <MenuItem value="Sri Lanka">🇱🇰 - Sri Lanka</MenuItem>
    <MenuItem value="Liberia">🇱🇷 - Liberia</MenuItem>
    <MenuItem value="Lesotho">🇱🇸 - Lesotho</MenuItem>
    <MenuItem value="Lithuania">🇱🇹 - Lithuania</MenuItem>
    <MenuItem value="Luxembourg">🇱🇺 - Luxembourg</MenuItem>
    <MenuItem value="Latvia">🇱🇻 - Latvia</MenuItem>
    <MenuItem value="Libya">🇱🇾 - Libya</MenuItem>
    <MenuItem value="Morocco">🇲🇦 - Morocco</MenuItem>
    <MenuItem value="Monaco">🇲🇨 - Monaco</MenuItem>
    <MenuItem value="Moldova">🇲🇩 - Moldova</MenuItem>
    <MenuItem value="Montenegro">🇲🇪 - Montenegro</MenuItem>
    <MenuItem value="St. Martin">🇲🇫 - St. Martin</MenuItem>
    <MenuItem value="Madagascar">🇲🇬 - Madagascar</MenuItem>
    <MenuItem value="Marshall Islands">🇲🇭 - Marshall Islands</MenuItem>
    <MenuItem value="Macedonia">🇲🇰 - Macedonia</MenuItem>
    <MenuItem value="Mali">🇲🇱 - Mali</MenuItem>
    <MenuItem value="Myanmar (Burma)">🇲🇲 - Myanmar (Burma)</MenuItem>
    <MenuItem value="Mongolia">🇲🇳 - Mongolia</MenuItem>
    <MenuItem value="Macau SAR China">🇲🇴 - Macau SAR China</MenuItem>
    <MenuItem value="Northern Mariana Islands">🇲🇵 - Northern Mariana Islands</MenuItem>
    <MenuItem value="Martinique">🇲🇶 - Martinique</MenuItem>
    <MenuItem value="Mauritania">🇲🇷 - Mauritania</MenuItem>
    <MenuItem value="Montserrat">🇲🇸 - Montserrat</MenuItem>
    <MenuItem value="Malta">🇲🇹 - Malta</MenuItem>
    <MenuItem value="Mauritius">🇲🇺 - Mauritius</MenuItem>
    <MenuItem value="Maldives">🇲🇻 - Maldives</MenuItem>
    <MenuItem value="Malawi">🇲🇼 - Malawi</MenuItem>
    <MenuItem value="Mexico">🇲🇽 - Mexico</MenuItem>
    <MenuItem value="Malaysia">🇲🇾 - Malaysia</MenuItem>
    <MenuItem value="Mozambique">🇲🇿 - Mozambique</MenuItem>
    <MenuItem value="Namibia">🇳🇦 - Namibia</MenuItem>
    <MenuItem value="New Caledonia">🇳🇨 - New Caledonia</MenuItem>
    <MenuItem value="Niger">🇳🇪 - Niger</MenuItem>
    <MenuItem value="Norfolk Island">🇳🇫 - Norfolk Island</MenuItem>
    <MenuItem value="Nigeria">🇳🇬 - Nigeria</MenuItem>
    <MenuItem value="Nicaragua">🇳🇮 - Nicaragua</MenuItem>
    <MenuItem value="Netherlands">🇳🇱 - Netherlands</MenuItem>
    <MenuItem value="Norway">🇳🇴 - Norway</MenuItem>
    <MenuItem value="Nepal">🇳🇵 - Nepal</MenuItem>
    <MenuItem value="Nauru">🇳🇷 - Nauru</MenuItem>
    <MenuItem value="Niue">🇳🇺 - Niue</MenuItem>
    <MenuItem value="New Zealand">🇳🇿 - New Zealand</MenuItem>
    <MenuItem value="Oman">🇴🇲 - Oman</MenuItem>
    <MenuItem value="Panama">🇵🇦 - Panama</MenuItem>
    <MenuItem value="Peru">🇵🇪 - Peru</MenuItem>
    <MenuItem value="French Polynesia">🇵🇫 - French Polynesia</MenuItem>
    <MenuItem value="Papua New Guinea">🇵🇬 - Papua New Guinea</MenuItem>
    <MenuItem value="Philippines">🇵🇭 - Philippines</MenuItem>
    <MenuItem value="Pakistan">🇵🇰 - Pakistan</MenuItem>
    <MenuItem value="Poland">🇵🇱 - Poland</MenuItem>
    <MenuItem value="St. Pierre & Miquelon">🇵🇲 - St. Pierre & Miquelon</MenuItem>
    <MenuItem value="Pitcairn Islands">🇵🇳 - Pitcairn Islands</MenuItem>
    <MenuItem value="Puerto Rico">🇵🇷 - Puerto Rico</MenuItem>
    <MenuItem value="Palestinian Territories">🇵🇸 - Palestinian Territories</MenuItem>
    <MenuItem value="Portugal">🇵🇹 - Portugal</MenuItem>
    <MenuItem value="Palau">🇵🇼 - Palau</MenuItem>
    <MenuItem value="Paraguay">🇵🇾 - Paraguay</MenuItem>
    <MenuItem value="Qatar">🇶🇦 - Qatar</MenuItem>
    <MenuItem value="Réunion">🇷🇪 - Réunion</MenuItem>
    <MenuItem value="Romania">🇷🇴 - Romania</MenuItem>
    <MenuItem value="Serbia">🇷🇸 - Serbia</MenuItem>
    <MenuItem value="Russia">🇷🇺 - Russia</MenuItem>
    <MenuItem value="Rwanda">🇷🇼 - Rwanda</MenuItem>
    <MenuItem value="Saudi Arabia">🇸🇦 - Saudi Arabia</MenuItem>
    <MenuItem value="Solomon Islands">🇸🇧 - Solomon Islands</MenuItem>
    <MenuItem value="Seychelles">🇸🇨 - Seychelles</MenuItem>
    <MenuItem value="Sudan">🇸🇩 - Sudan</MenuItem>
    <MenuItem value="Sweden">🇸🇪 - Sweden</MenuItem>
    <MenuItem value="Singapore">🇸🇬 - Singapore</MenuItem>
    <MenuItem value="St. Helena">🇸🇭 - St. Helena</MenuItem>
    <MenuItem value="Slovenia">🇸🇮 - Slovenia</MenuItem>
    <MenuItem value="Svalbard & Jan Mayen">🇸🇯 - Svalbard & Jan Mayen</MenuItem>
    <MenuItem value="Slovakia">🇸🇰 - Slovakia</MenuItem>
    <MenuItem value="Sierra Leone">🇸🇱 - Sierra Leone</MenuItem>
    <MenuItem value="San Marino">🇸🇲 - San Marino</MenuItem>
    <MenuItem value="Senegal">🇸🇳 - Senegal</MenuItem>
    <MenuItem value="Somalia">🇸🇴 - Somalia</MenuItem>
    <MenuItem value="Suriname">🇸🇷 - Suriname</MenuItem>
    <MenuItem value="South Sudan">🇸🇸 - South Sudan</MenuItem>
    <MenuItem value="São Tomé & Príncipe">🇸🇹 - São Tomé & Príncipe</MenuItem>
    <MenuItem value="El Salvador">🇸🇻 - El Salvador</MenuItem>
    <MenuItem value="Sint Maarten">🇸🇽 - Sint Maarten</MenuItem>
    <MenuItem value="Syria">🇸🇾 - Syria</MenuItem>
    <MenuItem value="Swaziland">🇸🇿 - Swaziland</MenuItem>
    <MenuItem value="Tristan da Cunha">🇹🇦 - Tristan da Cunha</MenuItem>
    <MenuItem value="Turks & Caicos Islands">🇹🇨 - Turks & Caicos Islands</MenuItem>
    <MenuItem value="Chad">🇹🇩 - Chad</MenuItem>
    <MenuItem value="French Southern Territories">🇹🇫 - French Southern Territories</MenuItem>
    <MenuItem value="Togo">🇹🇬 - Togo</MenuItem>
    <MenuItem value="Thailand">🇹🇭 - Thailand</MenuItem>
    <MenuItem value="Tajikistan">🇹🇯 - Tajikistan</MenuItem>
    <MenuItem value="Tokelau">🇹🇰 - Tokelau</MenuItem>
    <MenuItem value="Timor-Leste">🇹🇱 - Timor-Leste</MenuItem>
    <MenuItem value="Turkmenistan">🇹🇲 - Turkmenistan</MenuItem>
    <MenuItem value="Tunisia">🇹🇳 - Tunisia</MenuItem>
    <MenuItem value="Tonga">🇹🇴 - Tonga</MenuItem>
    <MenuItem value="Turkey">🇹🇷 - Turkey</MenuItem>
    <MenuItem value="Trinidad & Tobago">🇹🇹 - Trinidad & Tobago</MenuItem>
    <MenuItem value="Tuvalu">🇹🇻 - Tuvalu</MenuItem>
    <MenuItem value="Taiwan">🇹🇼 - Taiwan</MenuItem>
    <MenuItem value="Tanzania">🇹🇿 - Tanzania</MenuItem>
    <MenuItem value="Ukraine">🇺🇦 - Ukraine</MenuItem>
    <MenuItem value="Uganda">🇺🇬 - Uganda</MenuItem>
    <MenuItem value="U.S. Outlying Islands">🇺🇲 - U.S. Outlying Islands</MenuItem>
    <MenuItem value="United Nations">🇺🇳 - United Nations</MenuItem>
    <MenuItem value="United States">🇺🇸 - United States</MenuItem>
    <MenuItem value="Uruguay">🇺🇾 - Uruguay</MenuItem>
    <MenuItem value="Uzbekistan">🇺🇿 - Uzbekistan</MenuItem>
    <MenuItem value="Vatican City">🇻🇦 - Vatican City</MenuItem>
    <MenuItem value="St. Vincent & Grenadines">🇻🇨 - St. Vincent & Grenadines</MenuItem>
    <MenuItem value="Venezuela">🇻🇪 - Venezuela</MenuItem>
    <MenuItem value="British Virgin Islands">🇻🇬 - British Virgin Islands</MenuItem>
    <MenuItem value="U.S. Virgin Islands">🇻🇮 - U.S. Virgin Islands</MenuItem>
    <MenuItem value="Vietnam">🇻🇳 - Vietnam</MenuItem>
    <MenuItem value="Vanuatu">🇻🇺 - Vanuatu</MenuItem>
    <MenuItem value="Wallis & Futuna">🇼🇫 - Wallis & Futuna</MenuItem>
    <MenuItem value="Samoa">🇼🇸 - Samoa</MenuItem>
    <MenuItem value="Kosovo">🇽🇰 - Kosovo</MenuItem>
    <MenuItem value="Yemen">🇾🇪 - Yemen</MenuItem>
    <MenuItem value="Mayotte">🇾🇹 - Mayotte</MenuItem>
    <MenuItem value="South Africa">🇿🇦 - South Africa</MenuItem>
    <MenuItem value="Zambia">🇿🇲 - Zambia</MenuItem>
    <MenuItem value="Zimbabwe">🇿🇼 - Zimbabwe</MenuItem>
  </Select>
</FormControl>


