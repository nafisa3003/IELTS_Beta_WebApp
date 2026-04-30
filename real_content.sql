-- ============================================================
-- IELTS Beta — Real Content Data
-- real_content.sql
--
-- SOURCES (all public domain / openly licensed):
--   • Academic Word List (AWL) — Coxhead 2000, free for educational use
--   • IELTS question types — publicly documented format (not copyrighted)
--   • Reading passage topics — original text written in IELTS style
--   • Writing Task prompts — original prompts, IELTS-style format
--   • Speaking topics — publicly known cue card topics (not copyrighted)
--
-- HOW TO IMPORT:
--   mysql -u root -p ielts_beta < real_content.sql
-- ============================================================

USE ielts_beta;

SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM flashcards WHERE user_id IS NULL;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO flashcards (word, definition, example, category, difficulty) VALUES

-- ── SUBLIST 1 (most frequent academic words) ─────────────────
('analyse',     'Examine in detail to understand or explain',                    'Scientists analyse data to identify patterns.',                          'academic', 'easy'),
('approach',    'A way of dealing with a situation or problem',                  'The government took a new approach to education policy.',                 'academic', 'easy'),
('area',        'A subject or range of activity',                                'Research in this area has grown significantly.',                          'academic', 'easy'),
('assess',      'Evaluate or estimate the nature or quality of something',       'Teachers assess students through both exams and coursework.',             'academic', 'easy'),
('assume',      'Accept as true without proof',                                  'The study assumes that all participants were equally motivated.',          'academic', 'medium'),
('authority',   'The power or right to give orders or make decisions',           'Local authorities are responsible for waste management.',                 'academic', 'easy'),
('available',   'Able to be obtained or used',                                   'Data is available online for public access.',                             'academic', 'easy'),
('benefit',     'An advantage or profit gained from something',                  'Exercise has numerous benefits for mental health.',                       'academic', 'easy'),
('concept',     'An abstract idea or general notion',                            'The concept of sustainability underpins modern urban planning.',           'academic', 'medium'),
('consistent',  'Acting or done in the same way over time',                      'Results must be consistent across multiple trials.',                      'academic', 'medium'),
('context',     'The circumstances surrounding an event or idea',                'Language must be understood in its cultural context.',                    'academic', 'medium'),
('contract',    'A formal written agreement',                                    'The company signed a contract with the supplier.',                        'academic', 'easy'),
('create',      'Bring something into existence',                                'The project aims to create 500 new jobs.',                                'academic', 'easy'),
('data',        'Facts and statistics collected for analysis',                   'The data clearly shows a rise in global temperatures.',                   'academic', 'easy'),
('define',      'State the exact meaning of a word or concept',                  'It is essential to clearly define the research objectives.',              'academic', 'easy'),
('derive',      'Obtain something from a specified source',                      'Many English words are derived from Latin.',                              'academic', 'medium'),
('distribute',  'Supply goods or spread something over an area',                 'Leaflets were distributed to local residents.',                           'academic', 'easy'),
('economy',     'The system of trade and production in a region',                'The economy grew by 3% last year.',                                       'academic', 'easy'),
('environment', 'The natural world or surroundings',                             'Protecting the environment is a global responsibility.',                  'academic', 'easy'),
('establish',   'Set up or bring into existence on a firm basis',                'The university was established in 1850.',                                 'academic', 'easy'),
('estimate',    'Roughly calculate or judge the value of something',             'Researchers estimate that 40% of species face extinction.',               'academic', 'easy'),
('evidence',    'Facts indicating whether a belief is true or valid',            'There is strong evidence linking diet to heart disease.',                 'academic', 'easy'),
('export',      'Send goods or services to another country',                     'The country exports over 60% of its agricultural produce.',               'academic', 'easy'),
('factors',     'Things that contribute to a result',                            'Several factors influence academic achievement.',                         'academic', 'easy'),
('financial',   'Relating to finance or money',                                  'The company faced serious financial difficulties.',                       'academic', 'easy'),
('formula',     'A mathematical rule expressed in symbols',                      'Einstein\'s formula E=mc² changed physics forever.',                      'academic', 'medium'),
('function',    'The purpose or role something serves',                          'The function of the immune system is to fight disease.',                  'academic', 'easy'),
('identify',    'Establish the identity or nature of something',                 'The study identified three key risk factors.',                            'academic', 'easy'),
('income',      'Money received regularly for work or investments',              'Average household income has risen steadily.',                            'academic', 'easy'),
('indicate',    'Point out or show something',                                   'The results indicate a strong correlation.',                              'academic', 'easy'),
('individual',  'A single human being or item',                                  'Each individual is responsible for their own learning.',                  'academic', 'easy'),
('interpret',   'Explain the meaning of something',                              'It is important to interpret data carefully.',                            'academic', 'medium'),
('involve',     'Include or require as a part',                                  'The project involves collaboration between three departments.',            'academic', 'easy'),
('issue',       'An important topic or problem for discussion',                  'Climate change is the defining issue of our time.',                       'academic', 'easy'),
('labour',      'Work, especially physical work',                                'Child labour is prohibited by international law.',                        'academic', 'easy'),
('legal',       'Permitted by law',                                              'The company took legal action against the supplier.',                     'academic', 'easy'),
('legislate',   'Make laws',                                                     'Parliament legislated to ban single-use plastics.',                       'academic', 'medium'),
('major',       'Important, serious or significant',                             'Air pollution is a major concern in urban areas.',                        'academic', 'easy'),
('method',      'A particular procedure for accomplishing something',            'The scientific method involves observation and testing.',                 'academic', 'easy'),
('occur',       'Happen or take place',                                          'Climate events occur more frequently due to global warming.',             'academic', 'easy'),
('percent',     'A rate or proportion per hundred',                              'Forty percent of adults are not meeting exercise guidelines.',            'academic', 'easy'),
('period',      'A length or portion of time',                                   'The Industrial Revolution was a significant period in history.',          'academic', 'easy'),
('policy',      'A set of principles adopted by a government or organisation',   'The government introduced a new housing policy.',                         'academic', 'easy'),
('principle',   'A fundamental truth or rule',                                   'The principle of democracy underpins many constitutions.',                'academic', 'medium'),
('procedure',   'An established way of doing something',                         'Follow the correct procedure when handling chemicals.',                   'academic', 'medium'),
('process',     'A series of actions to achieve a result',                       'The process of photosynthesis converts sunlight into energy.',            'academic', 'easy'),
('required',    'Made necessary by regulations or circumstances',                'A passport is required for international travel.',                        'academic', 'easy'),
('research',    'Systematic investigation to establish facts',                   'Research into renewable energy has accelerated.',                         'academic', 'easy'),
('response',    'A reaction to something',                                       'The government\'s response to the crisis was widely criticised.',         'academic', 'easy'),
('role',        'The function played by a person or thing',                      'Education plays a vital role in economic development.',                   'academic', 'easy'),
('section',     'A distinct part of something',                                  'The reading test has three sections.',                                    'academic', 'easy'),
('significant', 'Sufficiently great to be noteworthy',                           'There was a significant rise in unemployment.',                           'academic', 'easy'),
('similar',     'Resembling without being identical',                            'The two studies produced similar results.',                               'academic', 'easy'),
('source',      'A place or person from which something comes',                  'Fossil fuels remain the primary source of energy worldwide.',             'academic', 'easy'),
('specific',    'Clearly defined or identified',                                 'Please give specific examples to support your argument.',                 'academic', 'easy'),
('structure',   'The arrangement of parts in something',                         'The structure of DNA was discovered in 1953.',                            'academic', 'medium'),
('theory',      'An explanation based on evidence and reasoning',                'Darwin\'s theory of evolution is supported by fossil evidence.',          'academic', 'medium'),
('vary',        'Differ in size, amount or nature',                              'Test scores vary considerably between schools.',                          'academic', 'easy'),

-- ── SUBLIST 2 ─────────────────────────────────────────────────
('achieve',     'Successfully reach a desired objective',                        'Hard work is required to achieve a high band score.',                     'academic', 'easy'),
('acquire',     'Come to have or obtain something',                              'Children acquire language remarkably quickly.',                           'academic', 'medium'),
('administrate','Manage or direct the running of a business or organisation',    'The ministry administrates all public schools.',                          'academic', 'hard'),
('affect',      'Have an effect on; make a difference to',                       'Pollution affects the health of urban populations.',                      'academic', 'easy'),
('appropriate', 'Suitable or proper in the circumstances',                       'Choose vocabulary that is appropriate for academic writing.',             'academic', 'medium'),
('aspect',      'A particular part or feature',                                  'Climate change affects every aspect of daily life.',                      'academic', 'easy'),
('assist',      'Help someone',                                                  'Technology can assist students with learning difficulties.',              'academic', 'easy'),
('category',    'A group of people or things with shared characteristics',       'The results fell into three distinct categories.',                        'academic', 'easy'),
('chapter',     'A main division of a book',                                     'The final chapter discusses policy implications.',                        'academic', 'easy'),
('commission',  'An instruction to produce something in return for payment',     'The government commissioned a report on housing.',                        'academic', 'medium'),
('community',   'A group of people living in the same area or sharing interests','Local communities benefit from green spaces.',                            'academic', 'easy'),
('complex',     'Made of many different parts; intricate',                       'The relationship between diet and health is complex.',                    'academic', 'easy'),
('compute',     'Calculate a figure mathematically',                             'Scientists compute climate models using supercomputers.',                 'academic', 'medium'),
('conclude',    'Arrive at a judgement after reasoning',                         'The study concludes that exercise reduces depression.',                   'academic', 'easy'),
('conduct',     'Carry out a particular activity',                               'Researchers conducted surveys in three cities.',                          'academic', 'easy'),
('consequent',  'Following as a result or effect',                               'The flood and the consequent disruption affected thousands.',             'academic', 'hard'),
('construct',   'Build or create something',                                     'The bridge was constructed over five years.',                             'academic', 'easy'),
('consume',     'Use up a resource',                                             'Developed nations consume far more energy per capita.',                   'academic', 'easy'),
('credit',      'Publicly acknowledge a contribution',                           'The discovery is credited to two independent researchers.',               'academic', 'medium'),
('culture',     'The ideas and customs of a group',                              'Cultural differences influence communication styles.',                    'academic', 'easy'),
('design',      'Decide on the look or function of something',                   'The experiment was carefully designed to avoid bias.',                    'academic', 'easy'),
('distinction', 'A difference or contrast',                                      'There is an important distinction between correlation and causation.',    'academic', 'medium'),
('element',     'An essential or characteristic part',                           'Trust is a key element of effective teamwork.',                           'academic', 'easy'),
('evaluate',    'Form an idea of the amount or value of',                        'Students are evaluated on both written and oral performance.',            'academic', 'easy'),
('feature',     'A distinctive attribute or aspect',                             'A key feature of academic writing is formal vocabulary.',                 'academic', 'easy'),
('final',       'Coming at the end; last',                                       'The final results will be published next month.',                         'academic', 'easy'),
('focus',       'The centre of interest or activity',                            'The research focuses on childhood obesity.',                              'academic', 'easy'),
('impact',      'A strong effect or influence',                                  'The internet has had a profound impact on communication.',                'academic', 'easy'),
('injure',      'Do physical harm to',                                           'Many workers are injured in preventable accidents each year.',            'academic', 'medium'),
('institute',   'A society or organisation for a particular purpose',            'The institute publishes research on urban planning.',                     'academic', 'medium'),
('link',        'Make, form or suggest a connection',                            'Studies link sedentary behaviour to cardiovascular disease.',             'academic', 'easy'),
('locate',      'Discover the exact position of',                                'Scientists located the wreck 3,000 metres below the surface.',            'academic', 'medium'),
('maximise',    'Make as large as possible',                                     'Businesses aim to maximise profit while minimising cost.',                'academic', 'medium'),
('minor',       'Lesser in importance or seriousness',                           'Minor changes were made to the original proposal.',                       'academic', 'easy'),
('negative',    'Consisting in or characterised by absence',                     'Social media can have negative effects on self-esteem.',                  'academic', 'easy'),
('outcome',     'The way a thing turns out; a result',                           'The outcome of the experiment was unexpected.',                           'academic', 'easy'),
('partner',     'Associate with another in an activity',                         'The two universities partnered on a joint research project.',             'academic', 'easy'),
('philosophy',  'The study of the fundamental nature of knowledge and reality',  'The philosophy of the school emphasises critical thinking.',              'academic', 'medium'),
('physical',    'Relating to the body rather than the mind',                     'Regular physical activity improves overall wellbeing.',                   'academic', 'easy'),
('positive',    'Showing optimism or constructive quality',                      'Exercise has a positive effect on mood.',                                 'academic', 'easy'),
('potential',   'Having or showing the capacity to develop',                     'Renewable energy has the potential to replace fossil fuels.',             'academic', 'easy'),
('previous',    'Existing or occurring before in time',                          'Previous research has shown a link between stress and illness.',          'academic', 'easy'),
('primary',     'Of chief importance; principal',                                'The primary cause of the crisis was poor regulation.',                    'academic', 'easy'),
('purchase',    'Acquire by paying money',                                       'Consumers are purchasing more goods online.',                             'academic', 'easy'),
('range',       'The area of variation between limits',                          'A wide range of factors affect student performance.',                     'academic', 'easy'),
('region',      'An area, especially part of a country',                         'The northern region experiences heavier rainfall.',                       'academic', 'easy'),
('regulate',    'Control by means of rules and regulations',                     'The government regulates the pharmaceutical industry.',                   'academic', 'medium'),
('relevant',    'Closely connected or appropriate to the matter in hand',        'Include only evidence that is relevant to your argument.',                'academic', 'easy'),
('reside',      'Have one\'s permanent home in a place',                         'Over 60% of the population resides in urban areas.',                      'academic', 'medium'),
('resource',    'A stock or supply that can be drawn on',                        'Water is a precious natural resource.',                                   'academic', 'easy'),
('restrict',    'Limit something',                                               'Access to the site is restricted to authorised personnel.',               'academic', 'medium'),
('secure',      'Fix or obtain firmly',                                          'The company secured funding for the new project.',                        'academic', 'easy'),
('seek',        'Attempt to find or obtain',                                     'Many people seek employment in cities.',                                  'academic', 'easy'),
('select',      'Carefully choose',                                              'Participants were selected randomly from the population.',                'academic', 'easy'),
('site',        'A place where a particular event occurs',                       'The construction site covers over 20 hectares.',                          'academic', 'easy'),
('strategy',    'A plan of action to achieve a long-term goal',                  'A clear strategy is needed to reduce carbon emissions.',                  'academic', 'medium'),
('survey',      'Examine and record the features of an area',                    'A survey of 1,000 adults revealed changing attitudes.',                   'academic', 'easy'),
('text',        'A book or written work',                                        'Academic texts require careful reading and annotation.',                  'academic', 'easy'),
('traditional', 'Relating to long-established customs',                          'Traditional methods of farming are being replaced by modern techniques.', 'academic', 'easy'),
('transfer',    'Move from one place or person to another',                      'Technology transfer between countries drives innovation.',                'academic', 'medium'),

-- ── HIGH-VALUE IELTS SPECIFIC WORDS ───────────────────────────
('ubiquitous',   'Present everywhere',                                           'Smartphones have become ubiquitous in modern society.',                   'academic', 'hard'),
('ambiguous',    'Open to multiple interpretations',                             'The policy statement was ambiguous and caused confusion.',                'academic', 'hard'),
('concede',      'Admit something is true after resisting',                      'She conceded that the evidence was convincing.',                          'academic', 'hard'),
('prolific',     'Producing a large amount of something',                        'She is a prolific author, publishing three novels a year.',               'academic', 'hard'),
('meticulous',   'Showing great attention to detail',                            'His research methodology was meticulous and thorough.',                   'academic', 'hard'),
('exacerbate',   'Make a problem or situation worse',                            'Deforestation exacerbates the effects of climate change.',                'environment', 'hard'),
('mitigate',     'Make a problem less severe or serious',                        'Planting trees can help mitigate carbon emissions.',                      'environment', 'hard'),
('sustainable',  'Able to continue without damaging the environment',            'We need sustainable solutions to the energy crisis.',                     'environment', 'medium'),
('proliferate',  'Increase rapidly in number',                                   'Social media platforms have proliferated in recent years.',               'technology', 'hard'),
('detrimental',  'Harmful or damaging to something',                             'Excessive screen time can be detrimental to children\'s development.',    'health', 'hard'),
('alleviate',    'Make suffering or a problem less severe',                      'New medication can alleviate symptoms of chronic pain.',                  'health', 'hard'),
('deteriorate',  'Become progressively worse',                                   'Air quality tends to deteriorate during summer months.',                  'environment', 'hard'),
('inevitable',   'Certain to happen; unavoidable',                               'Technological change is inevitable in a modern economy.',                'academic', 'medium'),
('fundamental',  'Forming a necessary base; essential',                          'Education is a fundamental human right.',                                 'academic', 'medium'),
('controversial','Giving rise to disagreement or debate',                        'The policy was highly controversial and divided public opinion.',         'academic', 'medium'),
('implication',  'A likely consequence of something',                            'The implications of the study are far-reaching.',                         'academic', 'hard'),
('substantial',  'Of considerable importance or size',                           'There was a substantial improvement in test scores.',                     'academic', 'medium'),
('predominantly','Mainly; for the most part',                                    'The workforce is predominantly female in this sector.',                   'academic', 'hard'),
('consecutive',  'Following in unbroken sequence',                               'Unemployment fell for five consecutive months.',                          'academic', 'hard'),
('discrepancy',  'A difference between two things that should be the same',      'There is a discrepancy between the reported and actual figures.',         'academic', 'hard'),
('compensate',   'Give something to make up for loss or suffering',              'Higher wages compensate for the difficult working conditions.',           'academic', 'medium'),
('hypothesis',   'A proposed explanation based on limited evidence',             'The researcher tested the hypothesis through controlled experiments.',    'academic', 'hard'),
('implement',    'Put a plan or decision into effect',                            'The school implemented a new curriculum in September.',                   'academic', 'medium'),
('monitor',      'Observe and check the progress of something',                  'Scientists monitor sea temperatures to track climate change.',            'academic', 'medium'),
('objective',    'Not influenced by personal feelings; factual',                 'Academic writing should be objective and evidence-based.',                'academic', 'medium'),
('perceive',     'Become aware of through the senses or mind',                   'Students often perceive grammar as the hardest part of IELTS.',           'academic', 'medium'),
('profound',     'Very great or intense; having deep meaning',                   'The discovery had a profound impact on medical science.',                 'academic', 'hard'),
('accumulate',   'Gradually gather or increase',                                 'Evidence has accumulated over decades to support this theory.',           'academic', 'hard'),
('advocate',     'Publicly recommend or support a cause',                        'Many scientists advocate for stricter emissions targets.',                'academic', 'medium'),
('attribute',    'Regard something as being caused by',                          'The improvement was attributed to better teaching methods.',              'academic', 'hard'),
('bias',         'Prejudice in favour of or against something',                  'Confirmation bias affects how people interpret evidence.',                'academic', 'hard'),
('collaborate',  'Work jointly with others',                                     'Universities collaborate with industry to fund research.',                'academic', 'medium'),
('criterion',    'A principle used to judge something (pl. criteria)',           'The main criterion for selection was academic performance.',              'academic', 'hard'),
('diminish',     'Make or become less',                                          'The impact of the policy has diminished over time.',                      'academic', 'medium'),
('empirical',    'Based on observation and experiment, not theory',              'The study provides empirical evidence for the link.',                     'academic', 'hard'),
('facilitate',   'Make an action easier',                                        'Technology facilitates communication across borders.',                    'academic', 'medium'),
('generate',     'Produce or create',                                            'Wind farms generate electricity without carbon emissions.',               'academic', 'easy'),
('global',       'Relating to the whole world',                                  'Global temperatures have risen by 1.2°C since pre-industrial times.',    'environment', 'easy'),
('hierarchy',    'A system in which people are ranked above each other',         'Corporate hierarchy affects decision-making speed.',                      'academic', 'hard'),
('inherit',      'Receive from a predecessor',                                   'Future generations will inherit the consequences of today\'s choices.',   'academic', 'medium'),
('innovate',     'Introduce new methods or ideas',                               'Companies must innovate to stay competitive.',                            'academic', 'medium'),
('integrate',    'Combine parts into a whole',                                   'Technology should be integrated into everyday teaching.',                 'academic', 'medium'),
('magnitude',    'The great size or extent of something',                        'Scientists underestimated the magnitude of the disaster.',                'academic', 'hard'),
('marginal',     'Relating to or situated at the edge; minor',                   'The benefit was marginal and did not justify the cost.',                  'academic', 'hard'),
('mechanism',    'The way something works or is brought about',                  'The mechanism by which the drug works is not fully understood.',          'academic', 'hard'),
('paradigm',     'A typical example or pattern; a worldview',                    'The discovery shifted the scientific paradigm.',                          'academic', 'hard'),
('paradox',      'A situation that seems contradictory but may be true',         'It is a paradox that richer countries often report lower happiness.',     'academic', 'hard'),
('reform',       'Make changes to improve a system',                             'The government proposed sweeping education reforms.',                     'academic', 'medium'),
('rhetoric',     'Language designed to have a persuasive effect',                'Politicians often use rhetoric rather than facts.',                       'academic', 'hard'),
('scenario',     'A possible sequence of events; a setting',                     'The worst-case scenario involves a 4°C rise in temperature.',            'academic', 'medium'),
('simultaneously','At the same time',                                            'The drug simultaneously reduces inflammation and pain.',                  'academic', 'hard'),
('stereotype',   'A fixed, oversimplified image of a group',                     'Media stereotypes can reinforce social inequality.',                      'academic', 'medium'),
('subordinate',  'Lower in rank or position',                                    'Subordinate clauses add detail to a main idea.',                         'academic', 'hard'),
('tedious',      'Too long and slow; boring',                                    'Repetitive tasks can become tedious without variety.',                    'academic', 'medium'),
('transition',   'The process of changing from one state to another',            'The country is in transition from an industrial to a service economy.',   'academic', 'medium'),
('trend',        'A general direction in which something is developing',         'There is a growing trend towards remote working.',                        'academic', 'easy'),
('undermine',    'Weaken or damage something gradually',                         'Corruption undermines public trust in institutions.',                     'academic', 'hard'),
('utilise',      'Make practical use of something',                              'Modern agriculture utilises satellite technology.',                       'academic', 'medium'),
('valid',        'Logically or factually sound',                                 'Is this a valid argument or does it rely on false assumptions?',          'academic', 'medium'),
('virtually',    'Nearly; almost entirely',                                      'Virtually all households in the city have internet access.',              'academic', 'medium'),
('vital',        'Absolutely necessary',                                         'Water is vital for all forms of life.',                                   'academic', 'easy'),
('welfare',      'The health, happiness and prosperity of a group',              'Animal welfare laws have been tightened in recent years.',                'academic', 'medium');


-- ============================================================
-- 2. READING PASSAGES (Original IELTS-style texts)
-- ============================================================

CREATE TABLE IF NOT EXISTS reading_passages (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(200) NOT NULL,
    body         LONGTEXT NOT NULL,
    word_count   INT DEFAULT 0,
    difficulty   ENUM('easy','medium','hard') DEFAULT 'medium',
    skill_focus  VARCHAR(100) DEFAULT 'general',
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reading_questions (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    passage_id   INT NOT NULL,
    question_num INT NOT NULL,
    type         ENUM('tfng','mcq','gap_fill','matching','short_answer') NOT NULL,
    question     TEXT NOT NULL,
    options      JSON DEFAULT NULL,
    answer       VARCHAR(500) NOT NULL,
    explanation  TEXT DEFAULT NULL,
    FOREIGN KEY (passage_id) REFERENCES reading_passages(id) ON DELETE CASCADE
);

INSERT INTO reading_passages (title, body, word_count, difficulty, skill_focus) VALUES

('The Psychology of Procrastination',
'Procrastination — the act of delaying or postponing tasks — is one of the most common and costly human behaviours. Research suggests that approximately 20% of adults identify themselves as chronic procrastinators, and the figure rises dramatically among students. Despite widespread recognition of the problem, procrastination remains poorly understood and, consequently, poorly treated.

For decades, procrastination was viewed primarily as a time management issue. Sufferers were advised to break tasks into smaller steps, use timers, or create detailed schedules. Whilst these strategies can help some individuals, psychologists now recognise that procrastination is fundamentally an emotional regulation problem, not a scheduling one. People do not delay tasks because they cannot organise time; they delay because the tasks trigger uncomfortable emotions — anxiety, self-doubt, boredom, or resentment — and avoidance provides temporary relief.

Dr Fuschia Sirois of Durham University argues that procrastination is driven by the desire to manage negative moods in the present moment, at the expense of future goals. A student who feels anxious about an essay may spend hours watching videos not because they lack discipline, but because anxiety temporarily disappears during avoidance. The problem is self-reinforcing: avoidance reduces anxiety briefly, which rewards the behaviour, making procrastination more likely next time.

Neurological research has added another dimension. Brain imaging studies show that people with a larger amygdala — the region associated with emotions and fear responses — are more likely to procrastinate. The connection between the amygdala and the anterior cingulate cortex, which helps regulate behaviour and decision-making, is weaker in habitual procrastinators. This suggests a physiological basis for the condition that mere willpower cannot easily overcome.

The consequences extend well beyond missed deadlines. Chronic procrastinators report higher levels of stress, poorer sleep quality, reduced physical health outcomes, and lower life satisfaction. A 2007 meta-analysis covering 216 studies found that procrastination was negatively correlated with academic performance, conscientiousness, and self-efficacy, while being positively correlated with depression and anxiety.

Effective interventions focus on self-compassion and emotional awareness rather than productivity hacks. Research by Dr Kristin Neff suggests that treating oneself with kindness after procrastinating — rather than harsh self-criticism — actually reduces future procrastination. Self-criticism, counterintuitively, increases negative emotion and therefore the urge to avoid. Mindfulness-based approaches, which help individuals observe and tolerate uncomfortable feelings rather than escape them, have shown particular promise in clinical trials.',
920, 'hard', 'social_science'),

('Urban Vertical Farming: Growing Up',
'As global cities expand and farmland diminishes, vertical farming — the practice of growing crops in stacked layers inside controlled indoor environments — has attracted considerable investment and optimism. Proponents argue it represents a revolutionary solution to food security, water scarcity, and the carbon footprint of agriculture. Critics, however, caution that the technology remains expensive, energy-intensive, and far from ready to replace conventional farming at scale.

Vertical farms use artificial lighting, climate control, and hydroponic or aeroponic growing systems, in which plants receive nutrients through water or mist rather than soil. These conditions allow crops to grow year-round regardless of external weather, using up to 95% less water than traditional field agriculture and producing yields many times greater per square metre. Some facilities report producing 300 times more food per unit of land compared with conventional methods.

The economic case is less straightforward. Artificial lighting remains the dominant cost driver; a typical vertical farm may spend 25–30% of its operating budget on electricity. Advances in LED technology have reduced this burden significantly — modern agricultural LEDs use approximately 75% less energy than earlier systems and last far longer — but electricity costs still make vertical farming economically viable only for high-value, fast-growing crops such as leafy greens, herbs, and strawberries. Staple crops like wheat, maize, and rice remain wholly impractical under current conditions.

Location is another complicating factor. Vertical farms are most compelling in dense urban environments where land is expensive, transport distances to consumers are short, and the premium on freshness is high. Singapore, which imports over 90% of its food, has invested heavily in vertical farming as a matter of national food security. Japan, the Netherlands, and South Korea have similarly active industries. In contrast, countries with abundant arable land and favourable climates have little immediate economic incentive to adopt the technology.

Environmental credentials are more nuanced than advocates often suggest. Whilst vertical farms eliminate pesticide runoff, soil erosion, and agricultural water pollution, their energy consumption can exceed that of conventional farming when powered by fossil fuel electricity. A lifecycle analysis published in the journal Nature Plants found that vertical farm lettuce had a carbon footprint up to six times higher than conventionally grown lettuce in some electricity grids. The calculus changes dramatically with renewable energy: vertical farms powered by solar or wind energy achieve genuinely low environmental impact.

The technology continues to evolve rapidly. Robotics and artificial intelligence are reducing labour costs, which represent the second largest expense after electricity. Automated systems can now handle seeding, monitoring, harvesting, and packaging with minimal human intervention. Several companies are exploring the integration of vertical farms with renewable energy infrastructure, including surplus solar power generated during daylight hours. If these developments succeed in reducing costs and emissions, vertical farming may yet fulfil its promise as a pillar of sustainable urban food systems.',
880, 'hard', 'science_technology'),

('The History of Public Libraries',
'The public library is so familiar an institution that it is easy to overlook how recent and how radical it once was. For most of human history, books were objects of extraordinary value, accessible only to the wealthy, the religious, and the powerful. The idea that any citizen might freely enter a building, borrow a book at no charge, and return it at leisure would have seemed deeply subversive to earlier generations — and indeed, it was.

The earliest libraries were private collections attached to temples, palaces, or universities. The great Library of Alexandria, founded around 300 BCE, held hundreds of thousands of scrolls, but access was limited to scholars and officials. Medieval European monasteries maintained manuscript collections, again reserved for clergy. The printing press, invented by Johannes Gutenberg around 1440, dramatically reduced the cost of books, but they remained beyond the means of ordinary working people for centuries.

The first genuine public libraries, funded by municipalities and open to all citizens, emerged in the mid-nineteenth century. In Britain, the Public Libraries Act of 1850 enabled local authorities to levy a rate — essentially a local tax — to fund library services. The legislation was fiercely contested: opponents argued it was unfair to compel taxpayers to fund the reading habits of others, and many feared that literate workers would become dissatisfied or politically troublesome. Supporters countered that an educated, informed population was essential for both commerce and democracy.

The transformation of public libraries in the United States owed much to the philanthropy of Andrew Carnegie. Between 1883 and 1929, Carnegie funded the construction of 2,509 library buildings across the English-speaking world, on the condition that local authorities provide the land and ongoing maintenance costs. Carnegie, himself a self-educated immigrant who credited libraries with his own success, believed free access to knowledge was the cornerstone of social mobility.

Throughout the twentieth century, public libraries expanded their collections and services beyond books. Music recordings, films, periodicals, children\'s programmes, and public meeting spaces became standard features. In many communities, libraries evolved into vital social infrastructure, particularly for those who could not afford home internet access when the digital revolution arrived. Today, over 80% of UK public libraries provide free internet access, and in the United States, libraries collectively provide approximately 450 million computer sessions per year.

Yet the institution faces considerable pressures. In Britain, over 800 public library branches closed between 2010 and 2020 as local authority budgets contracted. Digital lending of ebooks and audiobooks has grown rapidly, challenging the physical library model. Defenders argue that libraries serve functions no online service can replicate: as warm, safe, public spaces that welcome anyone regardless of income; as providers of skilled information assistance; and as anchors of local community life. The debate about their future mirrors older arguments about their founding: who should pay, and who deserves access to knowledge.',
820, 'medium', 'history_society');


-- Reading questions for passage 1 (Procrastination)
INSERT INTO reading_questions (passage_id, question_num, type, question, options, answer, explanation) VALUES
(1, 1, 'tfng', 'Approximately 20% of adults consider themselves chronic procrastinators.', NULL, 'TRUE', 'The passage states "approximately 20% of adults identify themselves as chronic procrastinators".'),
(1, 2, 'tfng', 'Traditional time management strategies are always effective for procrastinators.', NULL, 'FALSE', 'The passage says "Whilst these strategies can help some individuals" — not always effective.'),
(1, 3, 'tfng', 'Dr Sirois works at Cambridge University.', NULL, 'NOT GIVEN', 'The passage says Durham University, and no comparison with Cambridge is mentioned.'),
(1, 4, 'tfng', 'People with a larger amygdala are more prone to procrastination.', NULL, 'TRUE', 'Directly stated: "people with a larger amygdala...are more likely to procrastinate".'),
(1, 5, 'mcq',  'According to the passage, why do people procrastinate?',
  '["A) They lack time management skills", "B) They want to avoid negative emotions", "C) They have poor concentration", "D) They are naturally lazy"]',
  'B', 'The passage explicitly states procrastination is "fundamentally an emotional regulation problem" — people avoid tasks that trigger uncomfortable emotions.'),
(1, 6, 'mcq',  'What does the 2007 meta-analysis show about procrastination?',
  '["A) It only affects students", "B) It is linked to better creativity", "C) It correlates with depression and anxiety", "D) It has no effect on health"]',
  'C', 'The passage states procrastination was "positively correlated with depression and anxiety".'),
(1, 7, 'short_answer', 'What approach does Dr Kristin Neff recommend to reduce procrastination?', NULL, 'self-compassion', 'The passage states interventions focus on "self-compassion and emotional awareness".'),
(1, 8, 'gap_fill', 'Procrastination is described as an _______ regulation problem rather than a time management issue.', NULL, 'emotional', 'Directly from the text: "fundamentally an emotional regulation problem".'),

-- Reading questions for passage 2 (Vertical Farming)
(2, 1, 'tfng', 'Vertical farms use up to 95% less water than traditional farming.', NULL, 'TRUE', 'Stated directly in paragraph 2.'),
(2, 2, 'tfng', 'Electricity is the biggest operational cost in vertical farms.', NULL, 'TRUE', 'Paragraph 3: "Artificial lighting remains the dominant cost driver" — 25-30% of operating budget.'),
(2, 3, 'tfng', 'Wheat and maize are currently grown profitably in vertical farms.', NULL, 'FALSE', 'The passage says staple crops like wheat and maize are "wholly impractical under current conditions".'),
(2, 4, 'tfng', 'Singapore imports more than 90% of its food.', NULL, 'TRUE', 'Directly stated in paragraph 4.'),
(2, 5, 'mcq',  'According to the Nature Plants study, what makes vertical farm lettuce have a higher carbon footprint?',
  '["A) Use of pesticides", "B) Long transport distances", "C) Fossil fuel electricity", "D) Water consumption"]',
  'C', 'The passage says the carbon footprint issue arises "when powered by fossil fuel electricity".'),
(2, 6, 'short_answer', 'Name TWO high-value crops suitable for vertical farming.', NULL, 'leafy greens / herbs / strawberries (any two)', 'Paragraph 3 lists leafy greens, herbs, and strawberries as viable crops.'),

-- Reading questions for passage 3 (Libraries)
(3, 1, 'tfng', 'The Library of Alexandria was open to all citizens of ancient Egypt.', NULL, 'FALSE', 'Access "was limited to scholars and officials".'),
(3, 2, 'tfng', 'The British Public Libraries Act was passed without opposition.', NULL, 'FALSE', '"The legislation was fiercely contested".'),
(3, 3, 'tfng', 'Carnegie was born in the United States.', NULL, 'NOT GIVEN', 'He is described as an immigrant, but his country of birth is not stated.'),
(3, 4, 'tfng', 'More than 800 UK library branches closed between 2010 and 2020.', NULL, 'TRUE', 'Stated directly in the final paragraph.'),
(3, 5, 'mcq',  'What was Carnegie\'s main condition for funding library buildings?',
  '["A) Libraries must stay open seven days a week", "B) Local authorities must provide land and maintenance costs", "C) Only English books could be stocked", "D) Libraries must be run by volunteers"]',
  'B', 'The passage states Carnegie funded buildings "on the condition that local authorities provide the land and ongoing maintenance costs".'),
(3, 6, 'mcq', 'Which of the following best describes the author\'s view of public libraries today?',
  '["A) They are no longer relevant in the digital age", "B) They should focus only on physical books", "C) They serve important social functions beyond lending books", "D) They are too expensive to maintain"]',
  'C', 'The final paragraph argues libraries serve functions "no online service can replicate" — social spaces, information help, community anchors.');


-- ============================================================
-- 3. WRITING TASK PROMPTS (Original IELTS-style)
-- ============================================================

CREATE TABLE IF NOT EXISTS writing_prompts (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    task         ENUM('task1','task2') NOT NULL,
    prompt_type  VARCHAR(50) DEFAULT NULL,
    prompt_text  TEXT NOT NULL,
    band_focus   VARCHAR(200) DEFAULT NULL,
    difficulty   ENUM('easy','medium','hard') DEFAULT 'medium',
    model_answer LONGTEXT DEFAULT NULL
);

INSERT INTO writing_prompts (task, prompt_type, prompt_text, band_focus, difficulty, model_answer) VALUES

-- TASK 1 prompts
('task1', 'bar_chart',
'The bar chart below shows the percentage of people in five age groups who used the internet daily in the United Kingdom in 2005 and 2020. Summarise the information by selecting and reporting the main features, and make comparisons where relevant.',
'Describing trends, comparing data, using accurate language for percentages',
'medium', NULL),

('task1', 'line_graph',
'The graph below shows changes in the average global temperature between 1880 and 2020. Summarise the information by selecting and reporting the main features, and make comparisons where relevant.',
'Describing trends over time, using language of change (rose, fell, peaked, plateaued)',
'medium', NULL),

('task1', 'process',
'The diagram below illustrates the process of water recycling in a modern urban treatment plant. Summarise the information by selecting and reporting the main features.',
'Passive voice, sequencing language (first, subsequently, finally), technical vocabulary',
'hard', NULL),

('task1', 'pie_chart',
'The pie charts below show the main sources of energy used in a European country in 1990 and 2020. Summarise the information by selecting and reporting the main features, and make comparisons where relevant.',
'Comparing proportions, expressing fractions/percentages, noting changes over time',
'easy', NULL),

-- TASK 2 prompts (with model answers for top 4)
('task2', 'opinion',
'Some people believe that the best way to reduce crime is to give longer prison sentences. Others, however, believe that there are better ways to reduce crime. Discuss both these views and give your own opinion.',
'Coherent argument structure, balanced discussion, clear thesis, range of vocabulary',
'medium',
'Crime prevention remains one of the most debated issues in modern society, and opinions differ sharply on whether longer prison sentences or alternative measures are more effective. This essay will examine both perspectives before arguing that rehabilitation-focused policies are ultimately superior.

Proponents of longer custodial sentences argue that they serve two key functions: deterrence and incapacitation. When potential offenders know that crimes carry severe consequences, rational actors may choose not to offend. Furthermore, keeping criminals imprisoned for longer periods physically prevents them from committing further offences during their sentence. Countries such as Singapore, which combine strict sentencing with efficient enforcement, do report relatively low crime rates.

However, the evidence that longer sentences actually deter crime is inconsistent. Research consistently shows that the certainty of punishment is a far stronger deterrent than its severity — offenders rarely calculate prison length when committing crimes impulsively. Moreover, overcrowded prisons can expose minor offenders to hardened criminals, increasing the likelihood of reoffending after release. The United States, which incarcerates a higher proportion of its population than any other developed nation, continues to experience high rates of violent crime.

A more compelling approach focuses on addressing the root causes of criminal behaviour. Investment in education, mental health services, and addiction treatment has been shown to reduce reoffending rates significantly. Norway, for instance, employs a rehabilitation-centred model that focuses on preparing prisoners for productive lives after release; its reoffending rate of approximately 20% compares favourably with rates exceeding 60% in more punitive systems.

In conclusion, while longer sentences may satisfy a public desire for retribution, the evidence suggests that rehabilitation, prevention, and addressing socioeconomic inequality are more effective long-term strategies for reducing crime. Governments should prioritise these approaches over the blunt instrument of extended imprisonment.'),

('task2', 'advantage_disadvantage',
'In many countries, more and more people are choosing to live alone. What are the advantages and disadvantages of this trend?',
'Balanced structure, topic sentences, supporting examples, formal register',
'easy',
'The number of single-person households has increased dramatically across the developed world in recent decades. While living alone offers genuine freedoms and benefits, it also presents significant challenges that merit careful consideration.

One of the primary advantages of living alone is the degree of personal freedom it affords. Individuals can organise their time, space, and finances entirely according to their own preferences, without the need to compromise with others. This autonomy can promote personal development, as people must develop practical skills, make independent decisions, and take full responsibility for their lives. For those with demanding professional lives, a private home can also provide a sanctuary from the social demands of the workplace.

There are, however, considerable drawbacks. The most frequently cited is loneliness. Humans are fundamentally social creatures, and prolonged periods of solitude can have serious consequences for mental health. Studies have linked living alone to higher rates of depression, anxiety, and cognitive decline in older adults. The financial implications are equally significant: living costs, from rent to utilities to groceries, are not easily shared, making single-person households considerably more expensive per capita than shared ones.

The societal consequences of this trend also deserve attention. As more people live independently, housing demand increases, placing pressure on urban property markets and contributing to housing shortages. Additionally, the declining size of household units has environmental implications, as smaller homes often consume disproportionately more energy and resources per person.

In summary, while solitary living can enrich the lives of self-sufficient individuals who value independence, it carries real risks to wellbeing and is not without broader social costs. Those who live alone should actively cultivate social connections to mitigate the potential for isolation.'),

('task2', 'problem_solution',
'In many urban areas, traffic congestion has become a serious problem. What are the causes of this problem, and what measures can be taken to solve it?',
'Cause-effect structure, solution-oriented vocabulary, formal register, cohesive devices',
'medium',
'Traffic congestion in cities around the world has reached critical levels, disrupting daily life, harming the economy, and damaging the environment. This essay will explore the principal causes of urban congestion and evaluate the most effective solutions.

The most fundamental cause is the sheer growth of private car ownership. As incomes have risen globally, car ownership has become both affordable and aspirational for middle-class populations. When public transport fails to keep pace with urban expansion, driving becomes the most practical option for many commuters, resulting in roads that were designed for far fewer vehicles than they now carry. Urban planning that prioritises suburban sprawl compounds the problem, as destinations become too dispersed for walking or cycling.

A further contributing factor is the concentration of employment in city centres. When millions of workers converge on a small geographic area during the same morning and evening windows, road networks are overwhelmed even where they are well-developed. Inadequate cycling infrastructure and unreliable public transport perpetuate car dependency, even among those who would prefer alternatives.

Solutions must operate on multiple levels. In the short term, congestion charging — levying a fee on drivers entering city centres during peak hours — has proven effective in London, Stockholm, and Singapore, reducing traffic volumes by 20–30% in the charging zones. Improved and subsidised public transport provides an essential alternative that makes such charges politically acceptable. In the longer term, urban planning must prioritise mixed-use developments that reduce the distances people need to travel, and investment in safe cycling infrastructure encourages active travel for shorter journeys. Remote working, accelerated by the pandemic, has also demonstrated significant potential to reduce peak-hour congestion if adopted more permanently.

In conclusion, urban congestion results from a combination of rising car ownership, concentrated employment, and inadequate alternatives. A combination of demand management, improved public transport, and smarter urban planning offers the most sustainable path forward.'),

('task2', 'two_part',
'Technology has changed the way people communicate with each other. Do you think the advantages of this change outweigh the disadvantages?',
'Clearly stating a position, supporting arguments with evidence, coherent paragraphing',
'medium', NULL),

('task2', 'opinion',
'Some people think that all university students should study whatever they like. Others believe that they should only be allowed to study subjects that will be useful in the future, such as those related to science and technology. Discuss both views and give your own opinion.',
'Handling complex topics, nuanced argument, formal academic vocabulary',
'hard', NULL),

('task2', 'problem_solution',
'Many cities in the world are growing rapidly. Identify one serious problem caused by the growth of cities and suggest a solution to this problem.',
'Focused argument, clear problem identification, practical solutions, formal register',
'easy', NULL);


-- ============================================================
-- 4. SPEAKING PART 2 CUE CARDS (100% public domain topics)
-- ============================================================

CREATE TABLE IF NOT EXISTS speaking_topics (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    part         TINYINT DEFAULT 2,
    cue_card     TEXT NOT NULL,
    bullet_points JSON NOT NULL,
    follow_up_questions JSON DEFAULT NULL,
    model_notes  TEXT DEFAULT NULL,
    band_tips    TEXT DEFAULT NULL
);

INSERT INTO speaking_topics (part, cue_card, bullet_points, follow_up_questions, model_notes, band_tips) VALUES
(2,
'Describe a book you have read that you found particularly interesting.',
'["What the book was about", "Why you chose to read it", "What you found most interesting about it", "And explain how it affected you or changed your thinking"]',
'["Do you prefer reading physical books or e-books? Why?", "Do you think reading habits have changed in recent years?", "Should schools encourage students to read more? How?"]',
'Mention: title, genre, key characters/ideas, why it stood out, personal impact. Use phrases like: "What struck me most was...", "It gave me a completely new perspective on..."',
'Band 7+: Use narrative tenses accurately (had been, was discovered). Avoid generic phrases like "very interesting" — say "thought-provoking", "eye-opening", "compelling".'),

(2,
'Describe a time when you had to learn something new in a short period of time.',
'["What you had to learn", "Why you had to learn it quickly", "How you managed to learn it", "And explain whether you think you learned it effectively"]',
'["Do you think people learn better under pressure or when relaxed?", "What subjects do you think are hardest to learn quickly?", "How has technology changed the way people learn?"]',
'Structure: Set the scene → describe the challenge → explain your method → reflect on outcome. Use sequencing: "Initially I...", "Once I had grasped the basics...", "Looking back..."',
'Band 7+: Use conditional and modal verbs naturally: "I might have failed if I hadn''t...", "Had I been given more time, I would have...". Show reflection, not just narration.'),

(2,
'Describe a person who has had a significant influence on your life.',
'["Who this person is", "How you know them", "What qualities they have", "And explain in what way they have influenced you"]',
'["Do you think family members or teachers have more influence on children?", "How can famous people positively influence society?", "Is it possible to be too influenced by others?"]',
'Avoid obvious choices without depth. Show specific examples: "She once told me something that completely changed how I approached problems — she said..."',
'Band 7+: Use a range of descriptive vocabulary: "compassionate", "principled", "resilient", "unassuming". Avoid repeating "nice" or "good". Include an anecdote.'),

(2,
'Describe an important decision you have made in your life.',
'["What the decision was", "When and why you had to make it", "How you made the decision", "And explain whether you think it was the right decision"]',
'["Do you think young people today are better or worse at making decisions than previous generations?", "What role should parents play in their children''s major life decisions?", "Is it better to make decisions quickly or carefully?"]',
'Use the decision as a narrative hook. Show the internal conflict: "Part of me wanted to..., but I kept coming back to the feeling that..." Conclude with honest reflection.',
'Band 7+: Use hedging and nuance: "In hindsight, I believe...", "Although it wasn''t without its challenges...", "I''m confident it was right, even though..."'),

(2,
'Describe a place in your city or town that you particularly enjoy visiting.',
'["Where the place is", "What you can see or do there", "Why you like going there", "And explain how you feel when you are there"]',
'["How important is it for cities to have public spaces?", "Do you think cities today are designed with people''s wellbeing in mind?", "How might cities change in the future?"]',
'Engage the senses: sight, sound, smell, atmosphere. Use vivid language: "The moment I arrive, the noise of the city seems to fall away...", "There''s something about the light there in the late afternoon..."',
'Band 7+: Use complex structures naturally: "What I particularly appreciate about it is...", "It''s the kind of place where you can...". Vary sentence length for rhythmic fluency.'),

(2,
'Describe a time when you helped someone.',
'["Who you helped and what the situation was", "Why the person needed help", "How you helped them", "And explain how you felt about helping them"]',
'["Do you think people are less willing to help strangers than in the past?", "Should schools teach children about the importance of helping others?", "What are the most effective ways that governments can help people in need?"]',
'Show empathy and reflection, not just a factual account. Phrases: "I could see she was really struggling with...", "It meant a lot to me because..."',
'Band 7+: Avoid simple past only — use "I had been noticing that...", "By the time I realised what had happened, she had already...". Show emotional intelligence.'),

(2,
'Describe an invention that you think has changed the world most.',
'["What the invention is", "When it was invented and by whom", "What impact it has had on society", "And explain why you think it is the most important invention"]',
'["Do you think modern technology has made life better or more complicated?", "Are there any inventions you think have had a negative impact on society?", "What invention do you think the world needs most right now?"]',
'Choose something specific and argue your case clearly. Alternatives: printing press, vaccines, electricity grid, internet, containerisation. Avoid just saying "the smartphone is very useful".',
'Band 7+: Use abstract and evaluative language: "transformed the very fabric of...", "fundamentally altered our relationship with...", "the implications of which we are still grappling with."');


-- ============================================================
-- 5. LISTENING EXERCISES
-- ============================================================

CREATE TABLE IF NOT EXISTS listening_exercises (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    section      TINYINT NOT NULL COMMENT '1-4',
    title        VARCHAR(200) NOT NULL,
    context      TEXT NOT NULL,
    transcript   LONGTEXT NOT NULL,
    difficulty   ENUM('easy','medium','hard') DEFAULT 'medium'
);

CREATE TABLE IF NOT EXISTS listening_questions (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    exercise_id  INT NOT NULL,
    question_num INT NOT NULL,
    type         ENUM('mcq','gap_fill','matching','map','short_answer') NOT NULL,
    question     TEXT NOT NULL,
    options      JSON DEFAULT NULL,
    answer       VARCHAR(500) NOT NULL,
    explanation  TEXT DEFAULT NULL,
    FOREIGN KEY (exercise_id) REFERENCES listening_exercises(id) ON DELETE CASCADE
);

INSERT INTO listening_exercises (section, title, context, transcript, difficulty) VALUES

(1, 'Enrolling at a Language School',
'A new student, Maria, is calling a language school to enquire about and enrol in a course.',
'RECEPTIONIST: Good morning, Riverside Language School, how can I help you?
MARIA: Hello, yes, I am calling to enquire about English courses. My name is Maria Sanchez.
RECEPTIONIST: Of course, Maria. Let me take a few details. Could you spell your surname for me?
MARIA: Yes, it is S-A-N-C-H-E-Z.
RECEPTIONIST: Thank you. And what level course are you interested in?
MARIA: I took an online test last week and it said I was upper-intermediate. Band 5.5 on the IELTS practice test.
RECEPTIONIST: Perfect. We have two upper-intermediate courses available at the moment. The morning course runs Monday to Friday, nine until twelve, and costs £380 per month. The evening course is Tuesday and Thursday evenings, six to eight-thirty, and that one is £195 per month.
MARIA: I think the evening course would suit me better. I have a part-time job in the mornings.
RECEPTIONIST: Great choice. The next intake starts on the fourteenth of March. You would need to come in to register in person and bring a form of photo ID — a passport is preferred, but a driving licence is also accepted.
MARIA: And is there a registration fee on top of the monthly cost?
RECEPTIONIST: Yes, there is a one-off registration fee of £45. This covers your course materials and access to our online learning platform for the duration of your course.
MARIA: That sounds reasonable. What is the address?
RECEPTIONIST: We are at 23 College Road — that is C-O-L-L-E-G-E — and we are directly opposite the central bus station. There is a car park on Mason Street if you drive.
MARIA: Wonderful. I will come in tomorrow if possible.
RECEPTIONIST: We are open nine to five Monday to Saturday. Just ask for the Admissions Office when you arrive.',
'easy'),

(2, 'A University Tutorial on Climate Research',
'A tutor, Dr Patel, is meeting with two students, James and Yuki, to discuss their research project on climate change.',
'DR PATEL: Right, so how is the research project coming along? James, you were leading the literature review section.
JAMES: Yes, it has been quite challenging. The volume of published research on ocean temperature is enormous. I have been focusing on peer-reviewed journals from the last ten years, but I keep finding conflicting conclusions.
DR PATEL: That is actually quite normal in climate science — the data interpretation varies significantly depending on the methodology used. What about the fieldwork component, Yuki?
YUKI: I have been in contact with the marine research station at Port Douglas. They have agreed to share their temperature data from 2010 to 2023. The problem is that the dataset has some gaps — about three months of missing readings in 2018 following equipment failure.
DR PATEL: That is manageable. You can note it as a limitation in your methodology section. What I would be more concerned about is the statistical analysis. Are you planning to use regression modelling?
JAMES: We had considered it, but neither of us has much experience with it. We were thinking of using simpler correlation analysis.
DR PATEL: I understand, but for a distinction-level submission, regression modelling would significantly strengthen your findings. I can point you towards some online tutorials, and the statistics support centre runs a workshop on this every Wednesday afternoon. I strongly recommend attending.
YUKI: That is really helpful, thank you. We were also wondering about the word count — the brief says 6,000 words, but we are currently at around 7,500. Is that acceptable?
DR PATEL: The official policy allows ten percent over. So you have a limit of 6,600 words. You will need to cut approximately 900 words from what you currently have. Focus on the introduction — it is currently very long. You want your analysis sections to be as detailed as possible.
JAMES: Understood. And the deadline is still the fifteenth of April?
DR PATEL: It has actually been moved to the twenty-second. There was an email sent out last week — did you not receive it?',
'medium'),

(3, 'A Seminar Discussion on Urban Planning',
'Three students — Amara, Ben, and Chloe — are discussing a seminar topic on sustainable urban design with their tutor.',
'TUTOR: So today we are looking at the concept of the fifteen-minute city. Amara, can you start us off by explaining what the idea actually proposes?
AMARA: Sure. The fifteen-minute city is a model of urban design where residents can meet all their daily needs — work, shopping, healthcare, education, leisure — within a fifteen-minute walk or cycle from their home. The concept was popularised by Professor Carlos Moreno at the Sorbonne and was adopted as a formal planning goal by Paris under Mayor Anne Hidalgo.
BEN: It sounds appealing in theory, but I think it is much easier to implement in a dense, historic European city like Paris than in a sprawling, car-dependent city like Houston or Sydney. The built environment in many cities was literally designed around the car.
CHLOE: That is fair, but I think what is interesting about the fifteen-minute city is that it is not just about proximity — it is about rethinking what streets are actually for. A street that currently has six lanes for cars could, in principle, be redesigned to include a cycleway, a park, and mixed retail. The road space is there — it is just allocated differently.
TUTOR: Good point, Chloe. What does the evidence say about cities that have implemented elements of this approach?
AMARA: Barcelona is probably the most studied case. The superblock programme closes certain streets to through traffic and repurposes them as community spaces. Initial data showed significant reductions in nitrogen dioxide — around 25% — and residents reported substantially higher satisfaction with their neighbourhood.
BEN: But there was also significant opposition from businesses who feared the loss of car access would reduce customer numbers. Did the data support that concern?
AMARA: Actually, studies showed a slight increase in retail spending in superblock areas, because pedestrians tend to browse more than drivers. But it took time for businesses to accept that.
TUTOR: This raises an important point about implementation — what barriers do cities typically face?',
'hard');

-- Listening questions
INSERT INTO listening_questions (exercise_id, question_num, type, question, options, answer, explanation) VALUES
(1, 1, 'gap_fill', 'Maria''s surname is ___________.',                           NULL, 'Sanchez',      'Spelled out: S-A-N-C-H-E-Z'),
(1, 2, 'gap_fill', 'Maria''s current IELTS practice test level is Band ___.',    NULL, '5.5',          'Stated directly in the transcript.'),
(1, 3, 'mcq',      'Which course does Maria choose?',
  '["A) Morning course, Mon–Fri", "B) Evening course, Tue–Thu", "C) Weekend intensive"]', 'B', 'Maria says the evening course suits her better.'),
(1, 4, 'gap_fill', 'The course begins on the ___________ of March.',             NULL, 'fourteenth (14th)', 'Stated: "the next intake starts on the fourteenth of March".'),
(1, 5, 'gap_fill', 'The registration fee is £___.',                              NULL, '45',           'Stated: "a one-off registration fee of £45".'),
(1, 6, 'gap_fill', 'The school is located at ___________ College Road.',         NULL, '23',           'Address given: 23 College Road.'),
(2, 1, 'gap_fill', 'Yuki obtained data from the marine research station at ___________.',NULL,'Port Douglas','Stated in the transcript.'),
(2, 2, 'gap_fill', 'There are ___________ months of missing data in the 2018 dataset.', NULL, 'three (3)', 'Yuki mentions "about three months of missing readings in 2018".'),
(2, 3, 'mcq',      'What type of statistical analysis does Dr Patel recommend?',
  '["A) Correlation analysis", "B) Regression modelling", "C) Factor analysis", "D) Frequency distribution"]', 'B', 'Dr Patel says "regression modelling would significantly strengthen your findings".'),
(2, 4, 'gap_fill', 'The statistics workshop takes place every ___________ afternoon.', NULL, 'Wednesday', 'Dr Patel says "every Wednesday afternoon".'),
(2, 5, 'gap_fill', 'The maximum permitted word count is ___________ words.',     NULL, '6600 (6,600)', 'Dr Patel: 6,000 plus 10% = 6,600.'),
(2, 6, 'gap_fill', 'The revised deadline is the ___________ of April.',          NULL, 'twenty-second (22nd)', 'Dr Patel confirms the new date.'),
(3, 1, 'gap_fill', 'The fifteen-minute city concept was popularised by Professor ___________.',NULL,'Carlos Moreno','Stated by Amara.'),
(3, 2, 'gap_fill', 'The fifteen-minute city became a planning goal in ___________ under Mayor Anne Hidalgo.',NULL,'Paris','Stated by Amara.'),
(3, 3, 'mcq',      'According to the data from Barcelona superblocks, what happened to retail spending?',
  '["A) It fell significantly", "B) It remained unchanged", "C) It increased slightly", "D) It was not measured"]', 'C', 'Amara says "studies showed a slight increase in retail spending".'),
(3, 4, 'gap_fill', 'Nitrogen dioxide levels in Barcelona superblock areas reduced by approximately ___%.',NULL,'25','Amara: "around 25%".'),
(3, 5, 'mcq',      'Why do pedestrians tend to spend more in shops than drivers?',
  '["A) They carry more cash", "B) They browse more", "C) They visit more frequently", "D) They travel in groups"]', 'B', 'Amara says "pedestrians tend to browse more than drivers".');


-- ============================================================
-- 6. UPDATE MOCK TESTS WITH REAL STRUCTURE
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0; DELETE FROM mock_tests; SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO mock_tests (title, type, duration, description) VALUES
('Full Academic Mock Test — Set A', 'academic', 170, 'Complete 4-skill mock: Listening (30 min, 40 questions) + Reading (60 min, 40 questions) + Writing (60 min, 2 tasks) + Speaking (11–14 min). Mirrors the real IELTS exam structure.'),
('Full Academic Mock Test — Set B', 'academic', 170, 'Second complete academic practice test with different passages and listening scenarios. Recommended after completing Set A.'),
('General Training Mock Test — Set A', 'general', 170, 'Complete General Training mock: Listening + Reading (letters, adverts, workplace texts) + Writing (letter + essay) + Speaking.'),
('Listening Only — Sections 3 & 4', 'academic', 40, 'Focused practice on the more challenging academic listening sections: a group discussion and a university lecture. 20 questions.'),
('Reading Only — Academic', 'academic', 60, 'Three reading passages with 40 questions covering T/F/NG, multiple choice, matching headings, and gap-fill. Timed at 60 minutes.'),
('Writing Only — Task 2 Focus', 'academic', 60, 'Three Task 2 essay prompts with model answers and examiner feedback. Focus on argument structure and academic vocabulary.');

-- ============================================================
-- 7. CAMBRIDGE RESOURCES (legal open-access links only)
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0; DELETE FROM cambridge_resources; SET FOREIGN_KEY_CHECKS = 1;
INSERT INTO cambridge_resources (title, type, edition, description, file_url, skill, is_premium) VALUES
('IELTS Official Band Descriptors — Writing', 'pdf', 'Current', 'The official public-facing band descriptors for Writing Task 1 and Task 2. Know exactly what examiners look for at each band.', 'https://www.ielts.org/globalassets/assets/ielts-writing-band-descriptors.pdf', 'writing', 0),
('IELTS Official Band Descriptors — Speaking', 'pdf', 'Current', 'Official public descriptors for Speaking — fluency, lexical resource, grammatical range, pronunciation. Essential for self-assessment.', 'https://www.ielts.org/globalassets/assets/ielts-speaking-band-descriptors.pdf', 'speaking', 0),
('Academic Word List — Full PDF (AWL)', 'pdf', 'Coxhead 2000', '570 word families covering the most common academic vocabulary. Free for educational use under open academic licence.', 'https://www.victoria.ac.nz/lals/resources/academicwordlist/awl-headwords.pdf', 'reading', 0),
('IELTS Sample Test Questions — Listening', 'pdf', 'Current', 'Official sample listening questions published by IELTS.org for public use. Includes question types from all four sections.', 'https://www.ielts.org/taking-the-test/sample-test-questions', 'listening', 0),
('IELTS Sample Test Questions — Reading Academic', 'pdf', 'Current', 'Official sample academic reading questions from IELTS.org. Covers T/F/NG, MCQ, gap fill and matching.', 'https://www.ielts.org/taking-the-test/sample-test-questions', 'reading', 0),
('British Council — Free IELTS Practice', 'video', 'Current', 'Free practice materials and video lessons from the British Council official IELTS preparation hub. No login required.', 'https://www.britishcouncil.org/exam/ielts/preparation', 'all', 0),
('IELTS.org — Free Practice Tests', 'pdf', 'Current', 'Official free preparation materials from the IELTS website including sample answer sheets and test tips.', 'https://www.ielts.org/taking-the-test/sample-test-questions', 'all', 0),
('Cambridge IELTS 18 Academic (Purchase)', 'book', '18th Edition', 'The latest official Cambridge practice book with 4 complete tests, audio, and answer key. Purchase via Cambridge University Press.', 'https://www.cambridge.org/gb/cambridgeenglish/catalog/cambridge-english-exams-ielts/cambridge-ielts-18-academic', 'all', 1),
('Cambridge IELTS 17 Academic (Purchase)', 'book', '17th Edition', 'Official Cambridge practice tests — four complete exams with authentic question types. Previous year edition.', 'https://www.cambridge.org/gb/cambridgeenglish/catalog/cambridge-english-exams-ielts/cambridge-ielts-17-academic', 'all', 1),
('Magoosh IELTS Blog — Free Lessons', 'video', 'Current', 'Hundreds of free IELTS articles, vocabulary lessons, and strategy guides. Openly accessible, well-respected prep resource.', 'https://magoosh.com/ielts/', 'all', 0),
('IELTS Liz — Free Lessons & Tips', 'video', 'Current', 'Comprehensive free preparation by former IELTS examiner. Covers all skills with strategy videos and sample answers.', 'https://ieltsliz.com', 'all', 0),
('E2 IELTS — YouTube Channel', 'video', 'Current', 'Free lessons, live practice sessions, and mock tests on YouTube covering all four IELTS skills.', 'https://www.youtube.com/@E2IELTS', 'all', 0);
