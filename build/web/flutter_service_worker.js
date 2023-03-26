'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "bb9e37f3a2b93d660c1b15323dcc5c9a",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "a4db76db4380472631d6dcb4878c1baf",
"manifest.json": "d80ec9bffa1c2d16afce3083b40e4067",
"assets/AssetManifest.json": "e6a32717e03e75ad102189841d33c1fc",
"assets/assets/images/frosch-mittwoch.jpg": "6ba45a10acdce134a4f176d058d5d6a5",
"assets/assets/images/snowflake-koch-iter7.png": "911a050d6ff99b391d710e4cc32e9816",
"assets/assets/images/icons8-chuck-norris-100.png": "a75f21f310abe7a53b9c02a1702ba168",
"assets/assets/animations/animation-dailyrobot-v5.riv": "9da84966f714df025cd06037092fecb4",
"assets/assets/animations/animation-dailyrobot-v6.riv": "29cc8a08d40c4f3fecc6f39f7c52c0a2",
"assets/assets/animations/animation-dailyrobot-v3.riv": "a40fa5a1e00ced68895c9a5fba70fde9",
"assets/assets/animations/animation-dailyrobot-v8.riv": "43a84dfda80846fc2083e84c7cbd672e",
"assets/assets/animations/animation-dailyrobot-v5.rev": "807a0a78eb8e797f1c6713be9abe2617",
"assets/assets/animations/animation-dailyrobot-v4.riv": "7603f3f33b6ced643e68bbd58fa26544",
"assets/assets/animations/animation-robot2.riv": "d40fe16e535fb211b3f63ca75b0db130",
"assets/assets/animations/animation-robot1.riv": "a34e1ec4b093ab82e941aab0d910748f",
"assets/assets/animations/animation-dailyrobot-v7.riv": "8152f57761865c399a9ef2fc627947e4",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flag/res/4x3/si.svg": "a36053434a14a2d477934bb2c1d96dbd",
"assets/packages/flag/res/4x3/gl.svg": "c6090a99ab0402116f4ab70719eb034a",
"assets/packages/flag/res/4x3/hu.svg": "966f49336f7466efd6f8dbe19f9fc300",
"assets/packages/flag/res/4x3/ch.svg": "0d84f2aff4cb8fb5193b3e1ee407df68",
"assets/packages/flag/res/4x3/gt.svg": "c04a0caae14c36f33dddb025cc046760",
"assets/packages/flag/res/4x3/ke.svg": "3db68a6675308826f2355392d7a2db65",
"assets/packages/flag/res/4x3/tz.svg": "4cba6f3545595d585cf1c89394955c71",
"assets/packages/flag/res/4x3/tr.svg": "4dd4b60c8a5e3dad5e65fdfa9745c03f",
"assets/packages/flag/res/4x3/dm.svg": "bf34913a0215ab1971637cbbfebf53de",
"assets/packages/flag/res/4x3/jm.svg": "7c6602774a31cdc41f9ceae4ab057c3f",
"assets/packages/flag/res/4x3/hm.svg": "fb925e7c6bfe6cf54e1a16d3ecfe7227",
"assets/packages/flag/res/4x3/cm.svg": "b2723805bb88df273f2a96d5f863ae31",
"assets/packages/flag/res/4x3/ca.svg": "ad1527142564751eb7b82845333e6593",
"assets/packages/flag/res/4x3/ni.svg": "0de728cd6ac6ad41b64c02b2b8030c41",
"assets/packages/flag/res/4x3/sh.svg": "8fd775b9413f5bdaa0c7ce54deeed03c",
"assets/packages/flag/res/4x3/pl.svg": "f7adaa942c63ca98f1d2362bc67c45e3",
"assets/packages/flag/res/4x3/nf.svg": "cc20348d89f9f1702b1a6760f33697e2",
"assets/packages/flag/res/4x3/sc.svg": "cc70eda9ae0cffc1f8060a283917eff5",
"assets/packages/flag/res/4x3/mw.svg": "dc4b154514985cbac37c6023d598243f",
"assets/packages/flag/res/4x3/ac.svg": "2b54ce8a4ff7a6702147d588b30fa801",
"assets/packages/flag/res/4x3/pt.svg": "a36b3d87508ad8f6a6bc6787bbe808ed",
"assets/packages/flag/res/4x3/sl.svg": "af0884d411f36ff8e0fb199a00b70691",
"assets/packages/flag/res/4x3/ta.svg": "cfe96efb748f381d13a3bf62f6dc6cf3",
"assets/packages/flag/res/4x3/mn.svg": "3dabfbbe814a4fb8b643dfe662dde36c",
"assets/packages/flag/res/4x3/dj.svg": "583f0c784590369559b33f3cdda166e7",
"assets/packages/flag/res/4x3/in.svg": "fd8e911182680a39719929a06ae8658b",
"assets/packages/flag/res/4x3/cd.svg": "4346647bc68ddba26c8a09980a380d8a",
"assets/packages/flag/res/4x3/kz.svg": "f9c692a8dfe77b2b830997a04b57c0e9",
"assets/packages/flag/res/4x3/kg.svg": "2c2ad39a5f56cc014443be93c7d9dc88",
"assets/packages/flag/res/4x3/nz.svg": "dd987077e71e1288a73dea2b2d1f7f0d",
"assets/packages/flag/res/4x3/tj.svg": "71c18cc6c6e3f4a4df3bcd3e1fd4c8a1",
"assets/packages/flag/res/4x3/mt.svg": "f5c28c0a6c18fc4085c08a50ecfb6d6b",
"assets/packages/flag/res/4x3/ic.svg": "bdc9877c5d42dfa5adcfb488fcbf153c",
"assets/packages/flag/res/4x3/bs.svg": "f71baf489ba3415f2f0235a5997254c5",
"assets/packages/flag/res/4x3/mo.svg": "904c6c48604e2ad6cca99b955bab15a5",
"assets/packages/flag/res/4x3/is.svg": "64bcaf9743c062aba3fd9914e4abac89",
"assets/packages/flag/res/4x3/sx.svg": "63ad90518412c4bcd621122f4001c822",
"assets/packages/flag/res/4x3/gs.svg": "7df8b2cb035e8ee86d72cfde8d92091d",
"assets/packages/flag/res/4x3/gb-sct.svg": "ade55ed456211d6577b2f80c06e40c51",
"assets/packages/flag/res/4x3/om.svg": "3c3ce4b686ea6718dd6e452b17052536",
"assets/packages/flag/res/4x3/es-ga.svg": "9fae3ca28d7d20275156a35afc98552c",
"assets/packages/flag/res/4x3/ly.svg": "2fbe5cc18f3eefcf838b055980e63013",
"assets/packages/flag/res/4x3/nu.svg": "ea0da15fb78aa1beae9f10a0785b98e6",
"assets/packages/flag/res/4x3/aw.svg": "59ef02510bc7df50491a2afea7c5be62",
"assets/packages/flag/res/4x3/er.svg": "075f7d29333fde30b467add6d99b87dc",
"assets/packages/flag/res/4x3/pk.svg": "8a893a8934a1b18a440edcba41656228",
"assets/packages/flag/res/4x3/uy.svg": "a4931745a01469ef5a3ef89343a211ee",
"assets/packages/flag/res/4x3/bl.svg": "ebfec5274df662393baa89b384d53c4f",
"assets/packages/flag/res/4x3/eu.svg": "510ca6da0d406bf2e66dce7733deff41",
"assets/packages/flag/res/4x3/lk.svg": "9018cbe9a08c7c446eb40150013dc91f",
"assets/packages/flag/res/4x3/gn.svg": "f1d6c153def70087cff4f84c49ee2fb2",
"assets/packages/flag/res/4x3/sv.svg": "2e44b8d35c6d3192f072f15ae1215e29",
"assets/packages/flag/res/4x3/bm.svg": "1a85b9450c8b160f03904dbbaa2081cd",
"assets/packages/flag/res/4x3/pn.svg": "5f424354c8556fb6a57ae5efd2b7c692",
"assets/packages/flag/res/4x3/gh.svg": "b1a97938c1f961df78998f50cc3d542e",
"assets/packages/flag/res/4x3/vg.svg": "fafdd1389863679d1d649055d9aec88b",
"assets/packages/flag/res/4x3/kw.svg": "31648aa53832f0faa9a7831ac00c1acc",
"assets/packages/flag/res/4x3/tm.svg": "179f40d6dd9a3a0b4a4f33466f32b1a1",
"assets/packages/flag/res/4x3/ky.svg": "c45a605671629dab82c783732837b6b1",
"assets/packages/flag/res/4x3/um.svg": "c22e6f33f1b04f3879d4c7e35c4c391b",
"assets/packages/flag/res/4x3/ki.svg": "161cfe0396804ecee41759ef38146f76",
"assets/packages/flag/res/4x3/tg.svg": "19ba507605e81636029b3ec5ba3ee339",
"assets/packages/flag/res/4x3/ar.svg": "83514108ee282e9cf734573a360cb0c4",
"assets/packages/flag/res/4x3/gb-wls.svg": "9490411928d3db5cad64a17d7c2c9f8b",
"assets/packages/flag/res/4x3/pw.svg": "34533125088e70e7dc17eadc0f6a151c",
"assets/packages/flag/res/4x3/pr.svg": "22cf04d4b9e455467f7e946de5388f88",
"assets/packages/flag/res/4x3/kp.svg": "7120a619d091684ef84353a33a54efa9",
"assets/packages/flag/res/4x3/ga.svg": "f64e29ed68d2165d3620d53978933bb6",
"assets/packages/flag/res/4x3/ir.svg": "15222e515af31a3111010cc29c90fe18",
"assets/packages/flag/res/4x3/zw.svg": "cecaeba01a1813720cc2e021a6585921",
"assets/packages/flag/res/4x3/vu.svg": "3d642e71039fddd4f4c2ca118ecb3636",
"assets/packages/flag/res/4x3/be.svg": "6cac03795313d7c043bbdd4d27c08494",
"assets/packages/flag/res/4x3/de.svg": "78feb91bfda2ddce6bcfdcbab050995b",
"assets/packages/flag/res/4x3/dk.svg": "33bba71c12896b2df18901d98cf2b62c",
"assets/packages/flag/res/4x3/mv.svg": "44a3b21f0ab17367c095a8798f7cc4da",
"assets/packages/flag/res/4x3/cp.svg": "8a3956c6a0d0b6cc9b52d62f85b255d3",
"assets/packages/flag/res/4x3/za.svg": "e2da160e9ab8e677ecb0a95be5689e93",
"assets/packages/flag/res/4x3/pe.svg": "9336bb9fae1574a4a1dca24020fd2175",
"assets/packages/flag/res/4x3/il.svg": "519847287bb66fbec84a8233cf5597d5",
"assets/packages/flag/res/4x3/sn.svg": "091e42c6f8d95a1740ff343dcec62c7a",
"assets/packages/flag/res/4x3/bn.svg": "d5a2d91852038fab108963ea00f36712",
"assets/packages/flag/res/4x3/lc.svg": "940e9ba93eec286b5abee7657cf03283",
"assets/packages/flag/res/4x3/ls.svg": "4da8ca4f6e1c0d5486f4d6e30256c6d6",
"assets/packages/flag/res/4x3/sm.svg": "ec8d432f03040075c4166ce8b6502fa4",
"assets/packages/flag/res/4x3/sa.svg": "bdc3a5dce23da47241b81420fd5b1568",
"assets/packages/flag/res/4x3/mz.svg": "660a207e82f5b30d883f583b9bf8bff1",
"assets/packages/flag/res/4x3/md.svg": "d4e707da066346718010da32dcbf1802",
"assets/packages/flag/res/4x3/gr.svg": "32ae0eaeb746f98eb82ede027c73e539",
"assets/packages/flag/res/4x3/hk.svg": "72724f7f2754d1c2fa9a5f758d4046f0",
"assets/packages/flag/res/4x3/iq.svg": "77828901b08c8bde8d09bc969f6fe2bd",
"assets/packages/flag/res/4x3/fr.svg": "61406a35038d8bda515f096bd8e06be6",
"assets/packages/flag/res/4x3/ph.svg": "43421e89e2f84abf0d055aa78784c16e",
"assets/packages/flag/res/4x3/ps.svg": "9603fcc3025cf8719015679d1623c989",
"assets/packages/flag/res/4x3/ea.svg": "9634cedd4298c6b155d6e2c0dd5a07e5",
"assets/packages/flag/res/4x3/gb.svg": "fcfef6780b36bef537381474df9d0be9",
"assets/packages/flag/res/4x3/co.svg": "eefa6c2cd269ce7da90dc5ac0d78a48a",
"assets/packages/flag/res/4x3/my.svg": "f77adf7ffab71aa0f0f2706fdcc820e4",
"assets/packages/flag/res/4x3/gp.svg": "fb3de107960a32c4e2d25bf66a7e27ac",
"assets/packages/flag/res/4x3/va.svg": "e06e2790c52620f7ef00239f3dbc2e70",
"assets/packages/flag/res/4x3/cy.svg": "b3ef7d784e6260167591594e5c61350f",
"assets/packages/flag/res/4x3/by.svg": "a521eebe0cec830d57059207aeb47f7b",
"assets/packages/flag/res/4x3/bv.svg": "4a3cbeed34e0e6032a444b5069a94ff3",
"assets/packages/flag/res/4x3/to.svg": "cccdba4c3dfd080aeda7302c23588c7a",
"assets/packages/flag/res/4x3/mq.svg": "75f2db2f4c6bbc0d72af6b43dfc255f3",
"assets/packages/flag/res/4x3/xx.svg": "05e0208dd04ae4cb0bc1fbc17feb5174",
"assets/packages/flag/res/4x3/bb.svg": "89161f1489c1c83b696a8cd72af75f36",
"assets/packages/flag/res/4x3/ng.svg": "9eea84efdc0eb2553b9d3502feac044d",
"assets/packages/flag/res/4x3/et.svg": "1df16ee84c344d6df5e9d4db4be956f4",
"assets/packages/flag/res/4x3/nr.svg": "c3d9797ea73e2d4b760bbec3e07415a0",
"assets/packages/flag/res/4x3/tt.svg": "db362840eedbb651bff0b539e387bfb6",
"assets/packages/flag/res/4x3/li.svg": "0f6fda67daaceda3756227d9169233c0",
"assets/packages/flag/res/4x3/gu.svg": "a019590dca9fa20ee4af58cf46b9374c",
"assets/packages/flag/res/4x3/nc.svg": "8aca8cf1fff9f34a9d38209f0c25461b",
"assets/packages/flag/res/4x3/bw.svg": "8b493920bf8c0e60ff203403e668c73f",
"assets/packages/flag/res/4x3/sy.svg": "36ca8a42e9510d25dba89349f6c9f54b",
"assets/packages/flag/res/4x3/km.svg": "900d4c39253c987a77fa9e2e9f1a13f1",
"assets/packages/flag/res/4x3/bi.svg": "36146887fbe08a73e55c66502dc1bd68",
"assets/packages/flag/res/4x3/rw.svg": "e28b5d139e8f8ef57a246718fad4f773",
"assets/packages/flag/res/4x3/bo.svg": "f983aef76c5cab587c461cb6b36733c7",
"assets/packages/flag/res/4x3/vn.svg": "89c6f27e04da9d3d652950f3af0e426e",
"assets/packages/flag/res/4x3/bh.svg": "a4ca611556355096cc762f826e46c19d",
"assets/packages/flag/res/4x3/bf.svg": "4755cc0eeffc214e72703111d483703f",
"assets/packages/flag/res/4x3/mc.svg": "acbf04f75fb877d1c2aef0f553c8d629",
"assets/packages/flag/res/4x3/cl.svg": "1cc139d841f80c657a89cbcba1dcd7b7",
"assets/packages/flag/res/4x3/pm.svg": "961638db9dbaa89c01372f4d64317dad",
"assets/packages/flag/res/4x3/id.svg": "f400e736f5b8185c809a67bd965faf6e",
"assets/packages/flag/res/4x3/st.svg": "12444111a834c4924ca5a5d6c8bbb10a",
"assets/packages/flag/res/4x3/yt.svg": "50163b971dd382daa3570ab2a2939718",
"assets/packages/flag/res/4x3/mm.svg": "1d208cb91fbfa9e0542bfee14a0ac9c8",
"assets/packages/flag/res/4x3/ws.svg": "096fc50015e936e5ef310183baab82ca",
"assets/packages/flag/res/4x3/tk.svg": "5a5f29010b5758c306125f3cd2d061b0",
"assets/packages/flag/res/4x3/sz.svg": "f71239c6f956249754621d7b81d1855a",
"assets/packages/flag/res/4x3/mf.svg": "16878d203c27a0333bd7d2e453c735aa",
"assets/packages/flag/res/4x3/us.svg": "8886b28b10e3ec0756a9935a216d5bba",
"assets/packages/flag/res/4x3/im.svg": "324fc467c2aa29e4131f0a6acab88469",
"assets/packages/flag/res/4x3/ve.svg": "d358f3427b172795014e958354ad7dc4",
"assets/packages/flag/res/4x3/al.svg": "ee45ea7b84bdeea9e72a9e61549c05d1",
"assets/packages/flag/res/4x3/gm.svg": "21b07ec656b24882173b9760792b7691",
"assets/packages/flag/res/4x3/mx.svg": "d326007cf87dba95a56cb4a25b408558",
"assets/packages/flag/res/4x3/ck.svg": "bf16b1e4dc5e8f74f1456e9c97c7d37f",
"assets/packages/flag/res/4x3/gf.svg": "ac1924e75769ecb81d3ba3949f47bc30",
"assets/packages/flag/res/4x3/ma.svg": "a2e6a76e5f38058fd28b706beeb6a1b7",
"assets/packages/flag/res/4x3/ba.svg": "f7530d423d22fb5a21b1e85dce660fdd",
"assets/packages/flag/res/4x3/ec.svg": "d8b5c15adb4f81491e29980a0540b833",
"assets/packages/flag/res/4x3/sk.svg": "6363e990e97551bbabf9316bf0200d30",
"assets/packages/flag/res/4x3/qa.svg": "9dfdc1ae61fc572c4d2f7b329a3eeeb5",
"assets/packages/flag/res/4x3/es-ct.svg": "3eb3a35a978070fd4a68db545c527b54",
"assets/packages/flag/res/4x3/ax.svg": "62ea912b0e8803281b06875985d1c656",
"assets/packages/flag/res/4x3/rs.svg": "21a074040a11f7538c59d77d391ca492",
"assets/packages/flag/res/4x3/eg.svg": "34cb0b1f6dcb54334a4b2581cc7b742a",
"assets/packages/flag/res/4x3/gd.svg": "67cf83598998b9e3e9776be75a7597e9",
"assets/packages/flag/res/4x3/bq.svg": "63fa6eef889e055a5af0496cf8c8adfe",
"assets/packages/flag/res/4x3/do.svg": "638e03c0e8d8ff1e1e59187caed07674",
"assets/packages/flag/res/4x3/kn.svg": "28139a3254785fcb2c0177c91c4f2b05",
"assets/packages/flag/res/4x3/un.svg": "5232b1ea60a370c46c7e3cae2d8bd00e",
"assets/packages/flag/res/4x3/me.svg": "144e25db369a068c521780d81ee22bcb",
"assets/packages/flag/res/4x3/ht.svg": "800c2d430e2fe1a803310060c5d56a27",
"assets/packages/flag/res/4x3/lu.svg": "7f70b02c8514c31fc4de448b419ae0d6",
"assets/packages/flag/res/4x3/ml.svg": "1dd7a9ccbcd179a5a3fba550970ad75c",
"assets/packages/flag/res/4x3/br.svg": "155348d0d5ca941fc05473797fa203b8",
"assets/packages/flag/res/4x3/af.svg": "80deffc567027c82fc0dd8136826da5d",
"assets/packages/flag/res/4x3/so.svg": "a3293a25b2306f930324547134759a0a",
"assets/packages/flag/res/4x3/au.svg": "10c901181d122cec1dc47055e7732d67",
"assets/packages/flag/res/4x3/mr.svg": "4610ac53854ba558c74d5c8eccc21e2a",
"assets/packages/flag/res/4x3/gw.svg": "6241752e14e4af2b1f8c1ea22688e668",
"assets/packages/flag/res/4x3/xk.svg": "ba8a34999c06b7eb63d52bae1180bc1d",
"assets/packages/flag/res/4x3/bd.svg": "e99cb11fdae12d94bce83d228b052dc3",
"assets/packages/flag/res/4x3/pg.svg": "350974494867e834ec0fae91d98e9efd",
"assets/packages/flag/res/4x3/tw.svg": "a4b47fff88d0596123054bb88aaa2ca2",
"assets/packages/flag/res/4x3/at.svg": "8dc68995ec419a9440a25fadc2d8193d",
"assets/packages/flag/res/4x3/sd.svg": "a07e8d7a44884656f5de0a323ca6a2ef",
"assets/packages/flag/res/4x3/vi.svg": "8a74e2f6f1a5072c3cc722abcf18fb04",
"assets/packages/flag/res/4x3/cn.svg": "5c573ebe5273a73856cae1ef8b8dd88c",
"assets/packages/flag/res/4x3/bt.svg": "d35b5dd296478dbb051851d853a280f0",
"assets/packages/flag/res/4x3/wf.svg": "89479cefdd9fa38904923e30383474e6",
"assets/packages/flag/res/4x3/ug.svg": "235154128bc99f5bb71b593603795d49",
"assets/packages/flag/res/4x3/jp.svg": "7a959dca004d8aa791ed3cad37b73f44",
"assets/packages/flag/res/4x3/es.svg": "426a1551c98dbbe2a847dd8fd0e2eb5b",
"assets/packages/flag/res/4x3/ge.svg": "a397fa63e3a6dc02a99a7093aa43d3a9",
"assets/packages/flag/res/4x3/lr.svg": "babb668c5190507a37835ad407cc3e9a",
"assets/packages/flag/res/4x3/gb-nir.svg": "ed38443af5951a869b5730d5339f2f8b",
"assets/packages/flag/res/4x3/ee.svg": "2b95c4e2e07a2e7d305ae498df017b1b",
"assets/packages/flag/res/4x3/je.svg": "cbd1a7981b40ba72cece99ad23876004",
"assets/packages/flag/res/4x3/ms.svg": "e38f8b789cce2d9ee9b51fc8d8f7fdb1",
"assets/packages/flag/res/4x3/az.svg": "403e9b3f84602663476f4139b92916ea",
"assets/packages/flag/res/4x3/kr.svg": "91bdd05c8b0e8ecb3ff25843dd2e632e",
"assets/packages/flag/res/4x3/ro.svg": "e9130a28a9ba2b93433f21a2cd5971f3",
"assets/packages/flag/res/4x3/gy.svg": "6a64d2f47b268200557555ac4ffcd8dd",
"assets/packages/flag/res/4x3/cg.svg": "c1bacfa71d7a907daa88850a96ff07be",
"assets/packages/flag/res/4x3/mp.svg": "4192a32b80a9cf89083f5b81213899c4",
"assets/packages/flag/res/4x3/ai.svg": "ddacf37b25e0081e3cd28139bf79698b",
"assets/packages/flag/res/4x3/py.svg": "d3e57b21c6b9cbe61a792e6592e1811b",
"assets/packages/flag/res/4x3/cc.svg": "78a55c27fdfb24bb8e8844add13d0db4",
"assets/packages/flag/res/4x3/as.svg": "ff1f9cd799b51a29334e4b5927b2e3eb",
"assets/packages/flag/res/4x3/nl.svg": "f685765a298db5ba59fddfa6de08020e",
"assets/packages/flag/res/4x3/lt.svg": "7e7110b65bbe5cbfb8a84a0e5f68284e",
"assets/packages/flag/res/4x3/td.svg": "e092133da9e0fba424dba80e4de91d3f",
"assets/packages/flag/res/4x3/pf.svg": "02ac196d434c68c51d62da4cbbfed667",
"assets/packages/flag/res/4x3/cz.svg": "859f18a5acfd4e8d702a9b3d539dfd2d",
"assets/packages/flag/res/4x3/tl.svg": "51693b246ea176801243483d3fa69cfd",
"assets/packages/flag/res/4x3/gi.svg": "944d9dbac1f49db41d054c780b1d8dbd",
"assets/packages/flag/res/4x3/ne.svg": "5c109026a107f910512b09e208a90538",
"assets/packages/flag/res/4x3/zm.svg": "c748b3b4f4569a04530f9d676137bdaf",
"assets/packages/flag/res/4x3/eh.svg": "edba217feb3151b975aeb5053d728d52",
"assets/packages/flag/res/4x3/dg.svg": "16df7a03d86ce91be7d3faf2b56722c3",
"assets/packages/flag/res/4x3/uz.svg": "7c1bc5a1f5aee60e57380f3db156a060",
"assets/packages/flag/res/4x3/cv.svg": "1bd74d973e27c2cc0265d1f858a9b9b5",
"assets/packages/flag/res/4x3/la.svg": "da34e4818447e1f970b26accdfa69f5d",
"assets/packages/flag/res/4x3/np.svg": "3b6c910ac6f2d3c79c9e0a591fc5fe78",
"assets/packages/flag/res/4x3/fm.svg": "2b9aa7bf0231d61730914ef83e91e9fa",
"assets/packages/flag/res/4x3/ie.svg": "1c12635a2932de4b8036779933a84d97",
"assets/packages/flag/res/4x3/am.svg": "6a9de6f2c1bfbc4ea26d1b94c18d08e8",
"assets/packages/flag/res/4x3/lv.svg": "0b4e6e1a21a939a1a474341da5aee4ca",
"assets/packages/flag/res/4x3/tv.svg": "170f945330707be007f04b522c9aee89",
"assets/packages/flag/res/4x3/se.svg": "20eb11c70de22dbc091451eafeea69c2",
"assets/packages/flag/res/4x3/hr.svg": "9b7fd1f4bbdbe44a159903d73ac3a7e1",
"assets/packages/flag/res/4x3/gq.svg": "52b4ac099f46be415847f63cde06289c",
"assets/packages/flag/res/4x3/sr.svg": "07e91c157e4b9e240d9b004da3529f08",
"assets/packages/flag/res/4x3/ao.svg": "52753def72744f8ce26c003e58ac89ae",
"assets/packages/flag/res/4x3/vc.svg": "0d135a5aaa2be532208f06d7ba9f7b08",
"assets/packages/flag/res/4x3/kh.svg": "a17374375f50fae95a315cdc23913f0c",
"assets/packages/flag/res/4x3/ci.svg": "71b3f6b842edddfcbd0c964f6c45d7f1",
"assets/packages/flag/res/4x3/re.svg": "ba6ff1f775630d60fb2f9d3b1f9d75bd",
"assets/packages/flag/res/4x3/hn.svg": "b661b74a83b212cf45fb6be14332630c",
"assets/packages/flag/res/4x3/cw.svg": "5a3dad6fded7a3db21f5e13d1b5d6e0d",
"assets/packages/flag/res/4x3/sj.svg": "5b6dddaf6a82ad8090d313f3088b7e2d",
"assets/packages/flag/res/4x3/ye.svg": "d4cc9017b9793281c667ca3d305534ed",
"assets/packages/flag/res/4x3/aq.svg": "d96624823ceaf3950ba1b197e1f0b99c",
"assets/packages/flag/res/4x3/fk.svg": "6bfcb4297254d0ce1f3bfa5a9dd44c45",
"assets/packages/flag/res/4x3/ss.svg": "9a15dd43db84232e2a99b343c73dc2f0",
"assets/packages/flag/res/4x3/mg.svg": "f2d3fca1e1c5cbe4168c51d086248fc5",
"assets/packages/flag/res/4x3/sg.svg": "b8d345820ac52f8187155ff5c79ef5b0",
"assets/packages/flag/res/4x3/mk.svg": "b96b8a63c2939ef1e4cebb9585908591",
"assets/packages/flag/res/4x3/tn.svg": "aad164fdc75550913288df430193c721",
"assets/packages/flag/res/4x3/fj.svg": "94bf58dd2f569caa308c5b4f87498b78",
"assets/packages/flag/res/4x3/bg.svg": "5a32d80ff45984bc53108bc3138df0e7",
"assets/packages/flag/res/4x3/gg.svg": "453d95c72cd4fdccd241b61a839603ff",
"assets/packages/flag/res/4x3/tc.svg": "b8444065eb78717e6fda65abec71588d",
"assets/packages/flag/res/4x3/it.svg": "1d72a5dec3acd073763570e3e5fdf784",
"assets/packages/flag/res/4x3/ae.svg": "42d71570eaa84e61032f934cc8296e79",
"assets/packages/flag/res/4x3/ru.svg": "ab61f31edf4ad95b5ae00aff3be99197",
"assets/packages/flag/res/4x3/th.svg": "bcc03a3cd1a367274a2444aff71c0a68",
"assets/packages/flag/res/4x3/fi.svg": "4dc3dbe18574c3b3c8a6426938705793",
"assets/packages/flag/res/4x3/tf.svg": "b444aed98557f781c72b655c278633d6",
"assets/packages/flag/res/4x3/fo.svg": "ccfdd328027fbec17a4a07bfeedc4aee",
"assets/packages/flag/res/4x3/ag.svg": "ea764fd54e5e9944d601d17cc5258b45",
"assets/packages/flag/res/4x3/mh.svg": "63433c4cd0e5030836734de14bc1e52a",
"assets/packages/flag/res/4x3/gb-eng.svg": "7caecb785400d1cca7b319887a9d81bf",
"assets/packages/flag/res/4x3/pa.svg": "b6f6c58d78ffe67a54f46163232a8e1e",
"assets/packages/flag/res/4x3/cf.svg": "99c6b22d8c18aaab72d05274aad88b9a",
"assets/packages/flag/res/4x3/no.svg": "859a13561a1b24bfa65fb1a03835da49",
"assets/packages/flag/res/4x3/lb.svg": "a3b4e0301fde6907c57c1a5b6b143f54",
"assets/packages/flag/res/4x3/dz.svg": "b37c4fcf5782f19c46c24f834a141bb1",
"assets/packages/flag/res/4x3/sb.svg": "30f71378a6f710e849a3f39b6db78182",
"assets/packages/flag/res/4x3/mu.svg": "46514c8008dc3564e49eaa790f28e255",
"assets/packages/flag/res/4x3/ad.svg": "8c821c9a108a35aa6bb0935e6cb2d131",
"assets/packages/flag/res/4x3/bj.svg": "7f6166b56e8697232afee3eec2516b3e",
"assets/packages/flag/res/4x3/ua.svg": "f120e56639443c3abc1345d0df86406b",
"assets/packages/flag/res/4x3/cx.svg": "bbaba316c3e9a6b27ed5d6cbd9f0512c",
"assets/packages/flag/res/4x3/na.svg": "d0cf73691ed55277770d42ec1e0f8507",
"assets/packages/flag/res/4x3/cr.svg": "8f9e3dcc8f47407f57dd2eca6721d415",
"assets/packages/flag/res/4x3/jo.svg": "414c8c7ba27ed41c53c2f6826ae16aa7",
"assets/packages/flag/res/4x3/cu.svg": "f28cba69bf6b1e2cdc409cb850f93d50",
"assets/packages/flag/res/4x3/bz.svg": "10078a026b33398e760e021504be9b31",
"assets/packages/flag/res/4x3/io.svg": "d0fbb65407c65ddc786e1b68f4d93da2",
"assets/packages/flag/res/1x1/si.svg": "52f4acef80f640f31459ed26ade1ee2b",
"assets/packages/flag/res/1x1/gl.svg": "05073911834f849510d126c39b5e7e34",
"assets/packages/flag/res/1x1/hu.svg": "ac606833cdcf0da0803709ac75c75036",
"assets/packages/flag/res/1x1/ch.svg": "81904d3804b7a21fa8f16e46664b55bb",
"assets/packages/flag/res/1x1/gt.svg": "712ebee07a8d5c695eb72e1446e6c68c",
"assets/packages/flag/res/1x1/ke.svg": "56262ac0a527700ec9da374a5d6a9cc1",
"assets/packages/flag/res/1x1/tz.svg": "d19a8ee928c65adb5fb75e045b2442f5",
"assets/packages/flag/res/1x1/tr.svg": "63e4c16c4a3a5468dfcab187a831960c",
"assets/packages/flag/res/1x1/dm.svg": "4cb659a70c4b0bd8a521303e06f0a28e",
"assets/packages/flag/res/1x1/jm.svg": "a5de6786f06f1deaa135accb7b661175",
"assets/packages/flag/res/1x1/hm.svg": "e29f565b868c266bcabbcab653c82d69",
"assets/packages/flag/res/1x1/cm.svg": "3e2c5b4b4df72b7cc38e8dc8f0313a80",
"assets/packages/flag/res/1x1/ca.svg": "36a398cb91c517896a287cf4444aa675",
"assets/packages/flag/res/1x1/ni.svg": "66627f1fae160317344f50e7ca646644",
"assets/packages/flag/res/1x1/sh.svg": "32ba025d4ef67ec1c3f347d0e78006c9",
"assets/packages/flag/res/1x1/pl.svg": "8dae965602d8036252672fc2f07977eb",
"assets/packages/flag/res/1x1/nf.svg": "69e6c4256e9cb84a999e0b71d7c2a9de",
"assets/packages/flag/res/1x1/sc.svg": "a6054a5ff596f6c8b503d388de2f5b4b",
"assets/packages/flag/res/1x1/mw.svg": "5799d8d2ddd1b7c124f0872e0307d30e",
"assets/packages/flag/res/1x1/ac.svg": "41f2bc1a075c4003696bd3e8030c1dc6",
"assets/packages/flag/res/1x1/pt.svg": "23adb9fe16db7e7f840b59f3d71877d8",
"assets/packages/flag/res/1x1/sl.svg": "7fac599c42ea5816c0bb90036aeffbf6",
"assets/packages/flag/res/1x1/ta.svg": "8db2e75532dccbaf36ca4bb07f00c185",
"assets/packages/flag/res/1x1/mn.svg": "31220459588f9cfccf24897ccd4156fe",
"assets/packages/flag/res/1x1/dj.svg": "1b0a107021019235432e8dc367eb46f6",
"assets/packages/flag/res/1x1/in.svg": "7ff299bf914c980b81cf2bdac954f00c",
"assets/packages/flag/res/1x1/cd.svg": "e0101fc8a6d1187fdc578a13b1f1cbc7",
"assets/packages/flag/res/1x1/kz.svg": "173d10299ec0552f559e1b79b6ae1ba0",
"assets/packages/flag/res/1x1/kg.svg": "b38f7389f82670fd8c1fc2c26a86fd41",
"assets/packages/flag/res/1x1/nz.svg": "8d51d87f3c41a59b60cd74d68763aca4",
"assets/packages/flag/res/1x1/tj.svg": "4891f0a0f44ac4543b62a86c452ea5f6",
"assets/packages/flag/res/1x1/mt.svg": "485b92ba43322d0991016a13ac4f63c9",
"assets/packages/flag/res/1x1/ic.svg": "dc0d5bfce4986880c5066d29c0f83a2f",
"assets/packages/flag/res/1x1/bs.svg": "76c019833e07208e66384ca80b89417f",
"assets/packages/flag/res/1x1/mo.svg": "144efd007d37619d96a6bcb176ab438c",
"assets/packages/flag/res/1x1/is.svg": "cc33fe268eddcfc8238ff2b9925b6f4c",
"assets/packages/flag/res/1x1/sx.svg": "592afe48aa7e894c872a2a46d69bd0a0",
"assets/packages/flag/res/1x1/gs.svg": "161bc082be5ffd4a24c698f6e9dbe68f",
"assets/packages/flag/res/1x1/gb-sct.svg": "9506ab939d483c630b7db236ce744665",
"assets/packages/flag/res/1x1/om.svg": "083160ecacd114bd0a3bd3cbab785c7a",
"assets/packages/flag/res/1x1/es-ga.svg": "8d5a55c032f4d2829b99412b0f84e163",
"assets/packages/flag/res/1x1/ly.svg": "01216c35ae2256ecb79d83d6043f029c",
"assets/packages/flag/res/1x1/nu.svg": "20d62fc183d0adcc501525331b800515",
"assets/packages/flag/res/1x1/aw.svg": "513ef5fdfbdecaede63ab62d56d6c1e6",
"assets/packages/flag/res/1x1/er.svg": "7b2d3410782e869e40f84022b5b711a2",
"assets/packages/flag/res/1x1/pk.svg": "f0eea2745a73fcad663607f58bcc86a7",
"assets/packages/flag/res/1x1/uy.svg": "b0ab5d4c355a7c89940157bea59baf3f",
"assets/packages/flag/res/1x1/bl.svg": "8028dd1166b77764314e7494f6818469",
"assets/packages/flag/res/1x1/eu.svg": "ab50940ee94db5e6ec0db1701262a5a2",
"assets/packages/flag/res/1x1/lk.svg": "03c20243a2f8082383e0672698894aa1",
"assets/packages/flag/res/1x1/gn.svg": "b95b7a545b0fc81827a37a219024900b",
"assets/packages/flag/res/1x1/sv.svg": "b880c91335cf1668f0af1347668636b3",
"assets/packages/flag/res/1x1/bm.svg": "5d6517e16a7e3ea0a91628b0ba562fcc",
"assets/packages/flag/res/1x1/pn.svg": "12ce9b79057a5edc67930a0cdff6ca6b",
"assets/packages/flag/res/1x1/gh.svg": "9e338876783991ac58ef3d234d3d0ce9",
"assets/packages/flag/res/1x1/vg.svg": "f491676af5f5a5cf4c4c9eefd8691af6",
"assets/packages/flag/res/1x1/kw.svg": "c244f6de0c8a07185fe48fef81c18457",
"assets/packages/flag/res/1x1/tm.svg": "8e43ad9e6e20cd7898be277c36bab44f",
"assets/packages/flag/res/1x1/ky.svg": "1b4e0948deca3e7e38c0d23a27c36fe3",
"assets/packages/flag/res/1x1/um.svg": "030e7e0b164ad395e7125072acda713a",
"assets/packages/flag/res/1x1/ki.svg": "a02a4304f9934d4d90ecfc55141d0428",
"assets/packages/flag/res/1x1/tg.svg": "53ea4f1fcd9e50e55bd75f9178d8abe2",
"assets/packages/flag/res/1x1/ar.svg": "33e866d1e5903e1ca5724ce5768b8d48",
"assets/packages/flag/res/1x1/gb-wls.svg": "c488ecae68ddf5574c36b7e5782f6954",
"assets/packages/flag/res/1x1/pw.svg": "2084daff74ece4cfddef1abdf54287b3",
"assets/packages/flag/res/1x1/pr.svg": "0e5e97b93e365aa7f8c1a3c7cd944341",
"assets/packages/flag/res/1x1/kp.svg": "35e33aa7768845bf0e240c3f98e6c4a1",
"assets/packages/flag/res/1x1/ga.svg": "1aa26b2be2f1faf8c75476e95f09c453",
"assets/packages/flag/res/1x1/ir.svg": "c7f485ebc666896ab11c75a0f392352e",
"assets/packages/flag/res/1x1/zw.svg": "883b97a701dcd27077c0b01eedae04ad",
"assets/packages/flag/res/1x1/vu.svg": "f243acac55bd0a9fcf0c2e77e51de68d",
"assets/packages/flag/res/1x1/be.svg": "6fc013c9d1007c352313f021a700bb66",
"assets/packages/flag/res/1x1/de.svg": "4e64ea42c3d10fdaba69ac91b1dcc8ff",
"assets/packages/flag/res/1x1/dk.svg": "079b834714bed8a2a943d5985cd8140c",
"assets/packages/flag/res/1x1/mv.svg": "8ea7a65ef62eec34311194b49971388c",
"assets/packages/flag/res/1x1/cp.svg": "a9dec775437c2ba9d1c33641616c3d01",
"assets/packages/flag/res/1x1/za.svg": "ae23c355614edb55b99c35d64aef9508",
"assets/packages/flag/res/1x1/pe.svg": "c0d3dc9889d6ee8ecee9f05b0028ddd7",
"assets/packages/flag/res/1x1/il.svg": "5de4d676c3df0d4411ca55b899a88adf",
"assets/packages/flag/res/1x1/sn.svg": "eed2f85384a1674211601ebf35a9bc72",
"assets/packages/flag/res/1x1/bn.svg": "62e7e8c1e3668e7e8a3dfd82ab2d9233",
"assets/packages/flag/res/1x1/lc.svg": "25f4a7464ca9fe11f839731563b84b07",
"assets/packages/flag/res/1x1/ls.svg": "4e82463d0f9293120da93e234ebd6d0a",
"assets/packages/flag/res/1x1/sm.svg": "9e1878a31c2835fc5a00b18e63f9dd67",
"assets/packages/flag/res/1x1/sa.svg": "4dfb01ca0a92e7944371a02c98a8fc1c",
"assets/packages/flag/res/1x1/mz.svg": "ada074658b6e377797e87c89efb06ff3",
"assets/packages/flag/res/1x1/md.svg": "d692cd261cdb5fddab55e51cb48eba57",
"assets/packages/flag/res/1x1/gr.svg": "4a4d3e253d905d8dec14ed782df93cda",
"assets/packages/flag/res/1x1/hk.svg": "9fe816505a432695a40c731639c6cee0",
"assets/packages/flag/res/1x1/iq.svg": "fb484ddc9d7e580b181b0fbe061dad28",
"assets/packages/flag/res/1x1/fr.svg": "923011d9a6acab9cb8fe0743ba5e8553",
"assets/packages/flag/res/1x1/ph.svg": "a5cb5e63a281c9defd87294241177249",
"assets/packages/flag/res/1x1/ps.svg": "b7495d8b31616f2458f240f17bcf7224",
"assets/packages/flag/res/1x1/ea.svg": "5c0daa3ea73b54fa47be5f661f5cd52c",
"assets/packages/flag/res/1x1/gb.svg": "521ff9175692d87884eb69d15280dba1",
"assets/packages/flag/res/1x1/co.svg": "2d27993064a890abf252036cf65d3319",
"assets/packages/flag/res/1x1/my.svg": "282a8723d05a567cb7d378bedde0daa9",
"assets/packages/flag/res/1x1/gp.svg": "6419ef0d99f491c6694d8af52bcbabf3",
"assets/packages/flag/res/1x1/va.svg": "0b05f974fd49651e6471c73e2db845c5",
"assets/packages/flag/res/1x1/cy.svg": "6d82b6c7404e2df14d2b07d2210e38ed",
"assets/packages/flag/res/1x1/by.svg": "12097dbd339258ef11bc23b1568c6d6f",
"assets/packages/flag/res/1x1/bv.svg": "83e56e13ab80efe1e90c20d5584b007a",
"assets/packages/flag/res/1x1/to.svg": "ed0e1091a188b0c14c20a47d943cd29c",
"assets/packages/flag/res/1x1/mq.svg": "b1582df68eb59aca2666d06e47c875a2",
"assets/packages/flag/res/1x1/xx.svg": "06dd12d7f560f3f2347b2b929ac13e54",
"assets/packages/flag/res/1x1/bb.svg": "6eab019ed6c780cf87567124b794870c",
"assets/packages/flag/res/1x1/ng.svg": "b9197e69f00cd0f998a46b0080c23229",
"assets/packages/flag/res/1x1/et.svg": "26d0337e1a446430218173bbcf92373a",
"assets/packages/flag/res/1x1/nr.svg": "e6357f8e80628ab251c74487316c4873",
"assets/packages/flag/res/1x1/tt.svg": "cd3e7c0c1bc2a0c7ac19297ce411390f",
"assets/packages/flag/res/1x1/li.svg": "c2a0388c8134a1fa5cc3d6f9cdac15ab",
"assets/packages/flag/res/1x1/gu.svg": "ee47691a3fbffe8d5944b8552f64bc80",
"assets/packages/flag/res/1x1/nc.svg": "85447bfba6fca9221359a779cbc38c88",
"assets/packages/flag/res/1x1/bw.svg": "fee2051bfe7a4082ee62282641d7e27d",
"assets/packages/flag/res/1x1/sy.svg": "766197b3b10ff6719d3bdd4590ee61ce",
"assets/packages/flag/res/1x1/km.svg": "86e906fceba0505825764c52d90e3d31",
"assets/packages/flag/res/1x1/bi.svg": "2d210422486eded7740b7093570dc9b0",
"assets/packages/flag/res/1x1/rw.svg": "240b3961d4e64a4a7ca3242d9293ed3b",
"assets/packages/flag/res/1x1/bo.svg": "6e8b7e0f9425ef4cf2722b9df94bf206",
"assets/packages/flag/res/1x1/vn.svg": "d8159b15f7623bfb8b7534e4a43f3d21",
"assets/packages/flag/res/1x1/bh.svg": "c3102980823db2d0cb449c8fb7487bd1",
"assets/packages/flag/res/1x1/bf.svg": "7194e2401226188f053b48d5d41ba00d",
"assets/packages/flag/res/1x1/mc.svg": "585834807536af77d01bb714e142528a",
"assets/packages/flag/res/1x1/cl.svg": "53ca595c90a802097d1fb10c91cf0c7b",
"assets/packages/flag/res/1x1/pm.svg": "15c6521b421d62d6617399ed008dc903",
"assets/packages/flag/res/1x1/id.svg": "e882383568d7e08f3dd7f7a57dc01f37",
"assets/packages/flag/res/1x1/st.svg": "dafba84c6c06b87a0132aa419eb44057",
"assets/packages/flag/res/1x1/yt.svg": "38b534efcb265aa8cef377e6763009bf",
"assets/packages/flag/res/1x1/mm.svg": "7ba1a816bde00d2ef025f96147d9e875",
"assets/packages/flag/res/1x1/ws.svg": "9dcd85be09f67d107265077e58629892",
"assets/packages/flag/res/1x1/tk.svg": "a19184cd12d71fae2c2352f1cd8746af",
"assets/packages/flag/res/1x1/sz.svg": "d266727dc8d9b835888d77885776d700",
"assets/packages/flag/res/1x1/mf.svg": "df26146e63718295755e851ca1126eed",
"assets/packages/flag/res/1x1/us.svg": "7978889a8b8741d9a0163533f19c2e5d",
"assets/packages/flag/res/1x1/im.svg": "de2c825c16b63a16a1683c66e481a1cc",
"assets/packages/flag/res/1x1/ve.svg": "1f85fe92a61d6261002be73dcecf887a",
"assets/packages/flag/res/1x1/al.svg": "607650670afc9f6901f47905cdf4d212",
"assets/packages/flag/res/1x1/gm.svg": "301e054b9f8d6489cdbfa02c14fdd11b",
"assets/packages/flag/res/1x1/mx.svg": "784b49344523db879fca99142f1ff745",
"assets/packages/flag/res/1x1/ck.svg": "a734ef789d48c650e225bb56ffacdeca",
"assets/packages/flag/res/1x1/gf.svg": "c6de102f918c622674464cd0966c41c0",
"assets/packages/flag/res/1x1/ma.svg": "7fe34c1e160dc851310c1a6469a8379a",
"assets/packages/flag/res/1x1/ba.svg": "8d9a86c2b832fc125cc1f65088773b74",
"assets/packages/flag/res/1x1/ec.svg": "89c7836755e3cafbec06fab5d4695631",
"assets/packages/flag/res/1x1/sk.svg": "80d4eb69228133f72b5dcd7d0f9cb8e8",
"assets/packages/flag/res/1x1/qa.svg": "3371653310c15d2a37b649abe6e1ee70",
"assets/packages/flag/res/1x1/es-ct.svg": "e5d7fd1b2ee438320338f0866cfef135",
"assets/packages/flag/res/1x1/ax.svg": "1345aec8c48606e5b48283705894cc0e",
"assets/packages/flag/res/1x1/rs.svg": "43b012cade8883021fd7d5fd10faf245",
"assets/packages/flag/res/1x1/eg.svg": "f9ab79747dcea3d14894591f6066e0c5",
"assets/packages/flag/res/1x1/gd.svg": "5a9b5d94a8fe1ec81a88bfdaed835aec",
"assets/packages/flag/res/1x1/bq.svg": "a217e580785f179ca8c65e849cc7fce6",
"assets/packages/flag/res/1x1/do.svg": "1ace961377306f106345856f120ede0e",
"assets/packages/flag/res/1x1/kn.svg": "59d2782456a7cdaa7b1d5fba39ec3161",
"assets/packages/flag/res/1x1/un.svg": "19f1d0dff60aad9004ae476c88477ed8",
"assets/packages/flag/res/1x1/me.svg": "af7398f3281863944d779a77ea6354df",
"assets/packages/flag/res/1x1/ht.svg": "d2c21946524d38df018234c8bc96afc4",
"assets/packages/flag/res/1x1/lu.svg": "0d040ab20ca2d24321a65c76f489b04e",
"assets/packages/flag/res/1x1/ml.svg": "e264a6264f02dd9b1afba338062b2d75",
"assets/packages/flag/res/1x1/br.svg": "8bcede6133e8c04278c5ba83caa509f6",
"assets/packages/flag/res/1x1/af.svg": "7773ac255fbd01c79357cc2eded69ee5",
"assets/packages/flag/res/1x1/so.svg": "89f77f8095d9e187d2c5a01710c6583e",
"assets/packages/flag/res/1x1/au.svg": "85c0689d148fc47803506b07afd49224",
"assets/packages/flag/res/1x1/mr.svg": "d8751050310e1e022aa5ff768a8946be",
"assets/packages/flag/res/1x1/gw.svg": "be7d9fe1902e4bcb7dd511930cdb7a64",
"assets/packages/flag/res/1x1/xk.svg": "b9df535c833790aff616a87f9689652a",
"assets/packages/flag/res/1x1/bd.svg": "9a6cf43247bf4c3024eabccb5c3e6e30",
"assets/packages/flag/res/1x1/pg.svg": "63d984fd48cd675c93ee48fbef479a35",
"assets/packages/flag/res/1x1/tw.svg": "bf719cfaa4e9735e2305008798a1f970",
"assets/packages/flag/res/1x1/at.svg": "27ec5a7f28c5d0c8f02181d2ab888958",
"assets/packages/flag/res/1x1/sd.svg": "30cf87d02b9440106cc8b913cc62a69f",
"assets/packages/flag/res/1x1/vi.svg": "200395867a006c93ab3f4d8f9b857b0c",
"assets/packages/flag/res/1x1/cn.svg": "23852b0c5dc59c8d16369168ce50709b",
"assets/packages/flag/res/1x1/bt.svg": "552a870b8d0ff0782265b123c624e830",
"assets/packages/flag/res/1x1/wf.svg": "028cb14608b66efc28d4842408503953",
"assets/packages/flag/res/1x1/ug.svg": "1f14e988b2453cc3ec03ea21130ee656",
"assets/packages/flag/res/1x1/jp.svg": "cf7f05431fed51de3eaaf36e62e0ae4f",
"assets/packages/flag/res/1x1/es.svg": "dae16f90a5f06059588e6e0819792265",
"assets/packages/flag/res/1x1/ge.svg": "36380dcf41e57575a3328adb5cabfcac",
"assets/packages/flag/res/1x1/lr.svg": "0cfda4d7188f3b8fd50c7b294f35b561",
"assets/packages/flag/res/1x1/gb-nir.svg": "d70b4354759a0977baa8b0002fa30e31",
"assets/packages/flag/res/1x1/ee.svg": "fee3c7435a68eb06338c1bf5c6cfba4c",
"assets/packages/flag/res/1x1/je.svg": "aa9f272415b62cfde924a1e0ca87f84a",
"assets/packages/flag/res/1x1/ms.svg": "9e869fee02511ad200f8f5cfb3602d8e",
"assets/packages/flag/res/1x1/az.svg": "ee61daa1fd7aee4386a54db3b709160c",
"assets/packages/flag/res/1x1/kr.svg": "840ab53b13a49e264e9e6201b633af22",
"assets/packages/flag/res/1x1/ro.svg": "18358326c569c5d7584a6000ad4c87bf",
"assets/packages/flag/res/1x1/gy.svg": "c908281a23558922ef9d44ce49240372",
"assets/packages/flag/res/1x1/cg.svg": "c0adcefa0a15968c289b6b8caf62bcba",
"assets/packages/flag/res/1x1/mp.svg": "999a98e3d0aa29c23faadc276ff2b13a",
"assets/packages/flag/res/1x1/ai.svg": "7e4ee030810dee153412fa25d3baca11",
"assets/packages/flag/res/1x1/py.svg": "e16a905eb12173f7df1c0cb01d299477",
"assets/packages/flag/res/1x1/cc.svg": "91b7acfa4a5ebcf4be28ac8c9069c631",
"assets/packages/flag/res/1x1/as.svg": "1ba289b91e827b75ff64dfd19bb31a8e",
"assets/packages/flag/res/1x1/nl.svg": "09f3280d2f23aa573c15e3150d550a91",
"assets/packages/flag/res/1x1/lt.svg": "39f9399afe4e99afc7807a3614269ea6",
"assets/packages/flag/res/1x1/td.svg": "d2ea13f1a68997e5aff9aeb378d8f454",
"assets/packages/flag/res/1x1/pf.svg": "b51ab54cb00fedd475f00d4701c0056d",
"assets/packages/flag/res/1x1/cz.svg": "8ffb243fd5351444af894f75415fbf16",
"assets/packages/flag/res/1x1/tl.svg": "2f04cd3c63f8b181f5fbcec3b663eb12",
"assets/packages/flag/res/1x1/gi.svg": "0824d9dbfe7ac5aa9c7b24b93023292e",
"assets/packages/flag/res/1x1/ne.svg": "052dc6649ad238e3437d2bf997edae29",
"assets/packages/flag/res/1x1/zm.svg": "9a7407fb4ff20e1457078a1a6c8221f3",
"assets/packages/flag/res/1x1/eh.svg": "ea931ccc7685c8a20e312e61cff9a4ff",
"assets/packages/flag/res/1x1/dg.svg": "73a393c88787b15d702855358f6d1f41",
"assets/packages/flag/res/1x1/uz.svg": "a7acab2c1f5395893704084a2e062e0a",
"assets/packages/flag/res/1x1/cv.svg": "825501fd112391d6910c47b364ecfd71",
"assets/packages/flag/res/1x1/la.svg": "e0ec1b4e820fd8e73b09b83eb29d5de4",
"assets/packages/flag/res/1x1/np.svg": "e1a5b41145252ac92691644536a0f91d",
"assets/packages/flag/res/1x1/fm.svg": "d3becf4c6f7a9aa0976c6cc26ce83015",
"assets/packages/flag/res/1x1/ie.svg": "110efbf8a9a95ec3384b8b45dc5bc607",
"assets/packages/flag/res/1x1/am.svg": "ea6051ba89cfc1afad86c0f230335ade",
"assets/packages/flag/res/1x1/lv.svg": "eeafeb0fec4b2b31672ac508265f1712",
"assets/packages/flag/res/1x1/tv.svg": "94a912bd49462cbc7de707b9fd671ce0",
"assets/packages/flag/res/1x1/se.svg": "452d4e21eac136f4ec7f4db79e253a19",
"assets/packages/flag/res/1x1/hr.svg": "a7f61bab01800e41cf51756bedc0e9da",
"assets/packages/flag/res/1x1/gq.svg": "e3876a883db8f2847459cc904e44f44c",
"assets/packages/flag/res/1x1/sr.svg": "5bd4f0200ffd168102aa2e4b9a16ab83",
"assets/packages/flag/res/1x1/ao.svg": "11f61ca564da05361edd3dc9b4b6dfa6",
"assets/packages/flag/res/1x1/vc.svg": "604bb3c44ede062b803c4a32e6608ca5",
"assets/packages/flag/res/1x1/kh.svg": "684bc3d24f1fe7ec72df4456ff812b5e",
"assets/packages/flag/res/1x1/ci.svg": "4914b40504850ce7fa40aa544f981d3e",
"assets/packages/flag/res/1x1/re.svg": "36610173ad3d979401c1fad4235c8e1a",
"assets/packages/flag/res/1x1/hn.svg": "0f3d09a0ebee08cd7b071884929b0fe7",
"assets/packages/flag/res/1x1/cw.svg": "d0e9d598a52812d5e98b3b09c4e8e148",
"assets/packages/flag/res/1x1/sj.svg": "423c02479d090d9f7a4463e555e31678",
"assets/packages/flag/res/1x1/ye.svg": "c7f96a73720a46764697d8ec9fcd8b37",
"assets/packages/flag/res/1x1/aq.svg": "6f1f242caf2cdd5c64cc9577d78e7de9",
"assets/packages/flag/res/1x1/fk.svg": "1c724f0a29e16be0a7c7e25f3e0413aa",
"assets/packages/flag/res/1x1/ss.svg": "ee171740e2f8452ad2c9e7b7e00d7816",
"assets/packages/flag/res/1x1/mg.svg": "7c2254646a8dd4e39ba543c5d2c7f32e",
"assets/packages/flag/res/1x1/sg.svg": "b7c7bc4def551a148b519f64961d3122",
"assets/packages/flag/res/1x1/mk.svg": "aa4bb76fa561509b29d63cd3edd8a1a9",
"assets/packages/flag/res/1x1/tn.svg": "cefdbbdfbd3f4ab78f37d28e76e55bd6",
"assets/packages/flag/res/1x1/fj.svg": "0be05cf9d82118a2777b76c3d18e04c4",
"assets/packages/flag/res/1x1/bg.svg": "47c70d31371646e7e1823e56d769c283",
"assets/packages/flag/res/1x1/gg.svg": "ec290fee1ce859b72f166dad33a283d1",
"assets/packages/flag/res/1x1/tc.svg": "d57733da83930a3f348648f4e872e7f4",
"assets/packages/flag/res/1x1/it.svg": "5dd499d625a2415aef316563427b867a",
"assets/packages/flag/res/1x1/ae.svg": "b62c8ca639b1bdb3bafc60d1d26d54da",
"assets/packages/flag/res/1x1/ru.svg": "a36db5ee2456831a8fdd8775a4c7fc82",
"assets/packages/flag/res/1x1/th.svg": "18046547363916c7bdfe4556f7cd6989",
"assets/packages/flag/res/1x1/fi.svg": "2873b463254f2fd677bd4b539b20b88b",
"assets/packages/flag/res/1x1/tf.svg": "d82ec6441cc51a924ddaf3762c42ff4b",
"assets/packages/flag/res/1x1/fo.svg": "fcae5b2a423c94ba75e93dab51d61e10",
"assets/packages/flag/res/1x1/ag.svg": "c8adbf237572ef7f47774ccb5d14cb57",
"assets/packages/flag/res/1x1/mh.svg": "6a803acb4c81860bad1b0d7d06271ae1",
"assets/packages/flag/res/1x1/gb-eng.svg": "a877951862ba77ad974775646c0b22be",
"assets/packages/flag/res/1x1/pa.svg": "7b97403f84536e43760e6ce4832efef2",
"assets/packages/flag/res/1x1/cf.svg": "cbd95957781f73a837a6333aa980a253",
"assets/packages/flag/res/1x1/no.svg": "93a89ef2894bcbf6c82115737277da87",
"assets/packages/flag/res/1x1/lb.svg": "19d9a98db5dcfb822ea8f1eaef9a9f81",
"assets/packages/flag/res/1x1/dz.svg": "e8688062e43dbd51e6458acefd84d15f",
"assets/packages/flag/res/1x1/sb.svg": "72fc0629b5745867f636e308a9cca387",
"assets/packages/flag/res/1x1/mu.svg": "b111c44ad076945213b75dc8ec0b9ee4",
"assets/packages/flag/res/1x1/ad.svg": "b2946bd89485be3b8b641a5385634bb3",
"assets/packages/flag/res/1x1/bj.svg": "ea7e4090370e82b6a1ef029245e90bf3",
"assets/packages/flag/res/1x1/ua.svg": "133532e7a255f6dbfc5f0a1ad6c80672",
"assets/packages/flag/res/1x1/cx.svg": "2eee9616f9a7c0205b3734fe181e7bbd",
"assets/packages/flag/res/1x1/na.svg": "f5877d6e14db557e108964bd953d046c",
"assets/packages/flag/res/1x1/cr.svg": "a7d3b3129756d3ff6d8d9e0e5fc07c7c",
"assets/packages/flag/res/1x1/jo.svg": "fec997000e481e4e6f3e36b92a62a780",
"assets/packages/flag/res/1x1/cu.svg": "2e0e65e693ffe0cc755519b5809b69d2",
"assets/packages/flag/res/1x1/bz.svg": "49323c5b9a440ff75d26b90859919a8e",
"assets/packages/flag/res/1x1/io.svg": "17e7b804dcef54a965324ab9abc241c2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/NOTICES": "cdcdaea31440683af719c3cdedab3129",
"index.html": "38df4226d9801aee05638292d1c7f7b6",
"/": "38df4226d9801aee05638292d1c7f7b6",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
