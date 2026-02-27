-- Note: ZagreusHome bank can't be loaded!
-- ZagreusHome_ lines should be translated to ZagreusField_0 lines through the mod
-- To find ZagreusField/Home matches in an input text, use this regex (use global flag!): \bZagreusField_\d+\b
-- To transform ZagreusHome_ voicelines into the "ZagreusField_0xxx = true, -- Original" format, use this VSCode regex find and replace pattern:
-- ^\s*(Zagreus)Home_(\d{4})\s*$ -> $1Field_0$2 = true, -- $1Home_$2
mod.ZagreusFieldVoicelines = {
	-- #region Alecto
	ZagreusField_1408 = true,
	ZagreusField_1409 = true,
	ZagreusField_1410 = true,
	ZagreusField_1411 = true,
	ZagreusField_1412 = true,
	ZagreusField_1413 = true,
	ZagreusField_1414 = true,
	ZagreusField_1415 = true,
	ZagreusField_1416 = true,
	ZagreusField_1417 = true,
	ZagreusField_1418 = true,
	ZagreusField_1419 = true,
	ZagreusField_1420 = true,
	ZagreusField_1421 = true,
	ZagreusField_1422 = true,
	ZagreusField_1423 = true,
	ZagreusField_3806 = true,
	ZagreusField_3807 = true,
	ZagreusField_3808 = true,
	ZagreusField_3809 = true,
	ZagreusField_3810 = true,
	ZagreusField_3811 = true,
	ZagreusField_3812 = true,
	ZagreusField_3813 = true,
	ZagreusField_3814 = true,
	ZagreusField_3819 = true,
	ZagreusField_4300 = true,
	ZagreusField_4301 = true,
	ZagreusField_4302 = true,
	-- #endregion

	-- #region Megaera
	ZagreusField_0137 = true,
	ZagreusField_0461 = true,
	ZagreusField_0462 = true,
	ZagreusField_0505 = true,
	ZagreusField_0506 = true,
	ZagreusField_0508 = true,
	ZagreusField_0509 = true,
	ZagreusField_0510 = true,
	ZagreusField_0511 = true,
	ZagreusField_0512 = true,
	ZagreusField_0513 = true,
	ZagreusField_0539 = true,
	ZagreusField_1385 = true,
	ZagreusField_1386 = true,
	ZagreusField_1387 = true,
	ZagreusField_1388 = true,
	ZagreusField_1389 = true,
	ZagreusField_1390 = true,
	ZagreusField_1391 = true,
	ZagreusField_1393 = true,
	ZagreusField_1394 = true,
	ZagreusField_1395 = true,
	ZagreusField_1396 = true,
	ZagreusField_1397 = true,
	ZagreusField_1398 = true,
	ZagreusField_1399 = true,
	ZagreusField_1400 = true,
	ZagreusField_1401 = true,
	ZagreusField_1402 = true,
	ZagreusField_1403 = true,
	ZagreusField_1405 = true,
	ZagreusField_1406 = true,
	ZagreusField_1587 = true,
	ZagreusField_2735 = true,
	ZagreusField_2736 = true,
	ZagreusField_2737 = true,
	ZagreusField_2738 = true,
	ZagreusField_2739 = true,
	ZagreusField_2740 = true,
	ZagreusField_2741 = true,
	ZagreusField_2742 = true,
	ZagreusField_2743 = true,
	ZagreusField_2744 = true,
	ZagreusField_2745 = true,
	ZagreusField_2747 = true,
	ZagreusField_2748 = true,
	ZagreusField_2860 = true,
	ZagreusField_2950 = true,
	ZagreusField_4305 = true,
	ZagreusField_4306 = true,
	ZagreusField_4307 = true,
	ZagreusField_4308 = true,
	ZagreusField_4309 = true,
	ZagreusField_4310 = true,
	ZagreusField_4311 = true,
	ZagreusField_4312 = true,
	ZagreusField_4313 = true,
	ZagreusField_4314 = true,
	ZagreusField_4315 = true,
	ZagreusField_4316 = true,
	ZagreusField_4317 = true,
	ZagreusField_4654 = true,
	-- #endregion

	-- #region Tisiphone
	-- EndVoiceLines
	-- ZagreusField_3825 = true,
	-- ZagreusField_3828 = true,
	-- ZagreusField_3830 = true,
	-- ZagreusField_3832 = true,
	-- ZagreusField_3834 = true,
	-- ZagreusField_3837 = true,
	-- ZagreusField_4109 = true,
	-- ZagreusField_4545 = true,

	ZagreusField_0159 = true,
	ZagreusField_0962 = true,
	ZagreusField_0963 = true,
	ZagreusField_0964 = true,
	ZagreusField_1424 = true,
	ZagreusField_1425 = true,
	ZagreusField_1426 = true,
	ZagreusField_1427 = true,
	ZagreusField_1428 = true,
	ZagreusField_1429 = true,
	ZagreusField_1430 = true,
	ZagreusField_1431 = true,
	ZagreusField_1516 = true,
	ZagreusField_1517 = true,
	ZagreusField_1518 = true,
	ZagreusField_1519 = true,
	ZagreusField_1520 = true,
	ZagreusField_1521 = true,
	ZagreusField_1522 = true,
	ZagreusField_3824 = true,
	ZagreusField_3826 = true,
	ZagreusField_3827 = true,
	ZagreusField_3829 = true,
	ZagreusField_3831 = true,
	ZagreusField_3833 = true,
	ZagreusField_3835 = true,
	ZagreusField_3836 = true,
	ZagreusField_4108 = true,
	ZagreusField_4544 = true,
	ZagreusField_4546 = true,
	-- #endregion

	-- Hydra - none needed

	-- #region Theseus
	-- Endvoicelines
	-- ZagreusField_3881 = true,

	-- Without dialogue (in combat)
	-- ZagreusField_1778 = true,
	-- ZagreusField_1779 = true,
	-- ZagreusField_1780 = true,
	-- ZagreusField_1783 = true,
	-- ZagreusField_1784 = true,
	-- ZagreusField_1785 = true,
	-- ZagreusField_1786 = true,
	-- ZagreusField_1787 = true,
	-- ZagreusField_1794 = true,
	-- ZagreusField_1795 = true,
	-- ZagreusField_1796 = true,
	-- ZagreusField_1797 = true,
	-- ZagreusField_1798 = true,
	-- ZagreusField_1799 = true,
	-- ZagreusField_0220 = true,
	-- ZagreusField_1253 = true,
	-- ZagreusHome_0873 = true,

	ZagreusField_1763 = true,
	ZagreusField_1764 = true,
	ZagreusField_1765 = true,
	ZagreusField_1766 = true,
	ZagreusField_1767 = true,
	ZagreusField_1768 = true,
	ZagreusField_1769 = true,
	ZagreusField_1770 = true,
	ZagreusField_1771 = true,
	ZagreusField_1772 = true,
	ZagreusField_1773 = true,
	ZagreusField_1774 = true,
	ZagreusField_1775 = true,
	ZagreusField_1776 = true,
	ZagreusField_1777 = true,
	ZagreusField_2750 = true,
	ZagreusField_2751 = true,
	ZagreusField_2752 = true,
	ZagreusField_2753 = true,
	ZagreusField_2754 = true,
	ZagreusField_2755 = true,
	ZagreusField_2756 = true,
	ZagreusField_2757 = true,
	ZagreusField_2758 = true,
	ZagreusField_2759 = true,
	ZagreusField_2760 = true,
	ZagreusField_2761 = true,
	ZagreusField_3876 = true,
	ZagreusField_3877 = true,
	ZagreusField_3878 = true,
	ZagreusField_3879 = true,
	ZagreusField_3880 = true,
	ZagreusField_3882 = true,
	ZagreusField_3883 = true,
	ZagreusField_3884 = true,
	ZagreusField_3885 = true,
	ZagreusField_3886 = true,
	ZagreusField_4110 = true,
	ZagreusField_4274 = true,
	ZagreusField_4275 = true,
	-- #endregion

	-- #region Minotaur
	-- EndVoicelines
	-- ZagreusField_4264 = true,

	-- Without dialogue (in combat)
	-- ZagreusField_1778 = true,
	-- ZagreusField_1781 = true,
	-- ZagreusField_1782 = true,
	-- ZagreusField_1783 = true,
	-- ZagreusField_1784 = true,
	-- ZagreusField_1785 = true,
	-- ZagreusField_1786 = true,
	-- ZagreusField_1787 = true,
	-- ZagreusField_1800 = true,
	-- ZagreusField_1801 = true,
	-- ZagreusField_1802 = true,
	-- ZagreusField_1803 = true,
	-- ZagreusField_1804 = true,
	-- ZagreusField_1805 = true,
	-- ZagreusField_1806 = true,

	ZagreusField_1746 = true,
	ZagreusField_1747 = true,
	ZagreusField_1748 = true,
	ZagreusField_1749 = true,
	ZagreusField_1750 = true,
	ZagreusField_1751 = true,
	ZagreusField_1752 = true,
	ZagreusField_1753 = true,
	ZagreusField_1754 = true,
	ZagreusField_1755 = true,
	ZagreusField_1756 = true,
	ZagreusField_1757 = true,
	ZagreusField_1758 = true,
	ZagreusField_1759 = true,
	ZagreusField_1760 = true,
	ZagreusField_1761 = true,
	ZagreusField_1762 = true,
	ZagreusField_2897 = true,
	ZagreusField_2898 = true,
	ZagreusField_2899 = true,
	ZagreusField_2900 = true,
	ZagreusField_2901 = true,
	ZagreusField_2902 = true,
	ZagreusField_3437 = true,
	ZagreusField_3438 = true,
	ZagreusField_4111 = true,
	ZagreusField_4112 = true,
	ZagreusField_4260 = true,
	ZagreusField_4261 = true,
	ZagreusField_4262 = true,
	ZagreusField_4263 = true,
	ZagreusField_4265 = true,
	ZagreusField_4266 = true,
	ZagreusField_4267 = true,
	ZagreusField_4268 = true,
	ZagreusField_4645 = true,
	-- #endregion

	-- #region Hades enemy
	-- Cerberus assist from Hades
	-- ZagreusField_4530 = true,
	-- ZagreusField_4531 = true,
	-- ZagreusField_4532 = true,
	-- ZagreusField_4533 = true,
	-- ZagreusField_4534 = true,
	-- ZagreusField_4535 = true,
	-- ZagreusField_4536 = true,
	-- ZagreusField_4537 = true,

	-- Phase ended
	-- ZagreusField_2174 = true,
	-- ZagreusField_2340 = true,
	-- ZagreusField_2341 = true,
	-- ZagreusField_2342 = true,
	-- ZagreusField_2343 = true,
	-- ZagreusField_2344 = true,
	-- ZagreusField_2345 = true,
	-- ZagreusField_2346 = true,
	-- ZagreusField_2347 = true,
	-- ZagreusField_2348 = true,
	-- ZagreusField_2349 = true,
	-- ZagreusField_2350 = true,
	-- ZagreusField_2351 = true,
	-- ZagreusField_2352 = true,
	-- ZagreusField_2353 = true,
	-- ZagreusField_2354 = true,
	-- ZagreusField_2355 = true,
	-- ZagreusField_2356 = true,
	-- ZagreusField_2357 = true,
	-- ZagreusField_2358 = true,
	-- ZagreusField_2359 = true,

	-- EndVoicelines after conversation
	-- ZagreusField_2220 = true,
	-- ZagreusField_2226 = true,
	-- ZagreusField_4330 = true,
	-- ZagreusField_4657 = true,

	-- EndVoicelines for NextStage
	-- ZagreusField_1058 = true,
	-- ZagreusField_2175 = true,

	ZagreusField_2173 = true,
	ZagreusField_2176 = true,
	ZagreusField_2177 = true,
	ZagreusField_2214 = true,
	ZagreusField_2224 = true,
	ZagreusField_2227 = true,
	ZagreusField_2228 = true,
	ZagreusField_2229 = true,
	ZagreusField_2230 = true,
	ZagreusField_2231 = true,
	ZagreusField_2275 = true,
	ZagreusField_2276 = true,
	ZagreusField_2277 = true,
	ZagreusField_2307 = true,
	ZagreusField_2310 = true,
	ZagreusField_2454 = true,
	ZagreusField_2465 = true,
	ZagreusField_2466 = true,
	ZagreusField_2467 = true,
	ZagreusField_2968 = true,
	ZagreusField_2969 = true,
	ZagreusField_2970 = true,
	ZagreusField_3422 = true,
	ZagreusField_3518 = true,
	ZagreusField_3581 = true,
	ZagreusField_3582 = true,
	ZagreusField_3680 = true,
	ZagreusField_3681 = true,
	ZagreusField_3682 = true,
	ZagreusField_3683 = true,
	ZagreusField_3684 = true,
	ZagreusField_3685 = true,
	ZagreusField_3686 = true,
	ZagreusField_3688 = true,
	ZagreusField_3689 = true,
	ZagreusField_4324 = true,
	ZagreusField_4325 = true,
	ZagreusField_4326 = true,
	ZagreusField_4327 = true,
	ZagreusField_4329 = true,
	ZagreusField_4331 = true,
	ZagreusField_4332 = true,
	ZagreusField_4333 = true,
	ZagreusField_4334 = true,
	ZagreusField_4335 = true,
	ZagreusField_4642 = true,
	ZagreusField_4643 = true,
	ZagreusField_4644 = true,
	ZagreusField_4668 = true,
	ZagreusField_4675 = true,
	-- #endregion

	-- #region Charon fight
	-- EndVoicelines
	-- ZagreusField_3749 = true,

	-- EarlyExitVoicelines
	-- ZagreusField_3758 = true,
	-- ZagreusField_3759 = true,
	-- ZagreusField_3760 = true,
	-- ZagreusField_3761 = true,
	-- ZagreusField_3762 = true,
	-- ZagreusField_3763 = true,
	-- ZagreusField_3764 = true,
	-- ZagreusField_3765 = true,

	ZagreusField_3747 = true,
	ZagreusField_3748 = true,
	ZagreusField_3847 = true,
	ZagreusField_3848 = true,
	ZagreusField_3849 = true,
	ZagreusField_3900 = true,
	-- Charon voicelines during the fight - mapped to Megaera_1 (Megaera_0 is Storyteller)
	Charon_0010 = true,
	Charon_0011 = true,
	Charon_0019 = true,
	Charon_0028 = true,
	Charon_0029 = true,
	Charon_0030 = true,
	Charon_0031 = true,
	Charon_0032 = true,
	Charon_0033 = true,
	Charon_0034 = true,
	Charon_0035 = true,
	Charon_0038 = true,
	Charon_0040 = true,
	Charon_0045 = true,
	Charon_0046 = true,
	Charon_0047 = true,
	Charon_0048 = true,
	Charon_0049 = true,
	Charon_0050 = true,
	Charon_0051 = true,
	Charon_0054 = true,
	Charon_0055 = true,
	Charon_0056 = true,
	Charon_0057 = true,
	Charon_0058 = true,
	Charon_0059 = true,
	Charon_0060 = true,
	Charon_0061 = true,
	Charon_0062 = true,
	Charon_0063 = true,
	Charon_0069 = true,
	Charon_0070 = true,
	Charon_0071 = true,
	Charon_0073 = true,
	Charon_0074 = true,
	Charon_0075 = true,
	Charon_0076 = true,
	Charon_0077 = true,
	Charon_0078 = true,
	Charon_0079 = true,
	Charon_0080 = true,
	Charon_0081 = true,
	Charon_0082 = true,
	Charon_0083 = true,
	Charon_0084 = true,
	Charon_0085 = true,
	Charon_0086 = true,
	Charon_0087 = true,
	Charon_0088 = true,
	Charon_0089 = true,
	Charon_0090 = true,
	Charon_0091 = true,
	Charon_0092 = true,
	Charon_0093 = true,
	Charon_0094 = true,
	Charon_0095 = true,
	Charon_0096 = true,
	Charon_0097 = true,
	Charon_0098 = true,
	Charon_0099 = true,
	Charon_0100 = true,
	Charon_0101 = true,
	Charon_0102 = true,
	Charon_0103 = true,
	Charon_0104 = true,
	-- Charon attack voicelines
	Charon_0005 = true,
	Charon_0026 = true,
	-- Charon surprised voicelines - when stealing the bag
	Charon_0052 = true,
	Charon_0053 = true,
	Charon_0068 = true,
	Charon_0072 = true,
	-- #endregion

	-- #region Cerberus Styx
	ZagreusField_2063 = true,
	ZagreusField_2064 = true,
	ZagreusField_2066 = true,
	-- #endregion

	-- #region Sisyphus
	-- From CharacterInteractions.Rescue (likely when the pet is used)
	-- ZagreusField_0179 = true,
	-- ZagreusField_0485 = true,
	-- ZagreusField_2515 = true,
	-- ZagreusField_2813 = true,
	-- ZagreusField_2959 = true,
	-- ZagreusField_4035 = true,
	-- ZagreusField_4225 = true,

	-- After last gift
	-- ZagreusField_2847

	-- Gift Voicelines
	ZagreusField_00120 = true, -- ZagreusHome_0120
	ZagreusField_00523 = true, -- ZagreusHome_0523
	ZagreusField_00524 = true, --ZagreusHome_0524
	ZagreusField_0143 = true,
	ZagreusField_0465 = true,
	ZagreusField_0466 = true,
	ZagreusField_0467 = true,
	ZagreusField_0468 = true,
	ZagreusField_0469 = true,
	ZagreusField_0470 = true,
	ZagreusField_0471 = true,
	ZagreusField_0472 = true,
	ZagreusField_0473 = true,
	ZagreusField_0474 = true,
	ZagreusField_0475 = true,
	ZagreusField_0477 = true,
	ZagreusField_0478 = true,
	ZagreusField_0479 = true,
	ZagreusField_0480 = true,
	ZagreusField_0521 = true,
	ZagreusField_0522 = true,
	ZagreusField_0523 = true,
	ZagreusField_0524 = true,
	ZagreusField_0525 = true,
	ZagreusField_0526 = true,
	ZagreusField_0527 = true,
	ZagreusField_0528 = true,
	ZagreusField_0919 = true,
	ZagreusField_2832 = true,
	ZagreusField_2833 = true,
	ZagreusField_2835 = true,
	ZagreusField_2836 = true,
	ZagreusField_2837 = true,
	ZagreusField_2838 = true,
	ZagreusField_2839 = true,
	ZagreusField_2840 = true,
	ZagreusField_2841 = true,
	ZagreusField_2842 = true,
	ZagreusField_2843 = true,
	ZagreusField_2844 = true,
	ZagreusField_2845 = true,
	ZagreusField_2846 = true,
	ZagreusField_2848 = true,
	ZagreusField_2849 = true,
	ZagreusField_2850 = true,
	ZagreusField_2851 = true,
	ZagreusField_2852 = true,
	ZagreusField_2853 = true,
	ZagreusField_2854 = true,
	ZagreusField_2855 = true,
	ZagreusField_2856 = true,
	ZagreusField_2858 = true,
	ZagreusField_2859 = true,
	ZagreusField_2861 = true,
	ZagreusField_3890 = true,
	ZagreusField_3891 = true,
	ZagreusField_3892 = true,
	ZagreusField_3893 = true,
	ZagreusField_3894 = true,
	ZagreusField_3895 = true,
	ZagreusField_3896 = true,
	ZagreusField_3897 = true,
	ZagreusField_3898 = true,
	ZagreusField_3901 = true,
	ZagreusField_3902 = true,
	ZagreusField_4105 = true,
	ZagreusField_4106 = true,
	ZagreusField_4107 = true,
	ZagreusField_4318 = true,
	ZagreusField_4320 = true,
	ZagreusField_4321 = true,
	ZagreusField_4346 = true,
	ZagreusField_4639 = true,
	-- #endregion

	-- #region Bouldy
	-- EndVoiceLines
	-- ZagreusField_2808 = true,

	ZagreusField_2785 = true,
	ZagreusField_2786 = true,
	ZagreusField_2787 = true,
	ZagreusField_2788 = true,
	ZagreusField_2789 = true,
	ZagreusField_2790 = true,
	ZagreusField_2791 = true,
	ZagreusField_2792 = true,
	ZagreusField_2793 = true,
	ZagreusField_2794 = true,
	ZagreusField_2795 = true,
	ZagreusField_2796 = true,
	ZagreusField_2797 = true,
	ZagreusField_2798 = true,
	ZagreusField_2799 = true,
	ZagreusField_2800 = true,
	ZagreusField_2801 = true,
	ZagreusField_2802 = true,
	ZagreusField_2803 = true,
	ZagreusField_2804 = true,
	ZagreusField_2805 = true,
	ZagreusField_2806 = true,
	ZagreusField_2807 = true,
	ZagreusField_4215 = true,
	ZagreusField_4216 = true,
	ZagreusField_4217 = true,
	ZagreusField_4218 = true,
	ZagreusField_4219 = true,
	ZagreusField_4220 = true,
	ZagreusField_4221 = true,
	ZagreusField_4222 = true,
	ZagreusField_4223 = true,
	ZagreusField_4224 = true,
	-- #endregion

	-- #region Eurydice
	-- CharacterInteractions.Rescue voicelines
	-- ZagreusField_2513 = true,
	-- ZagreusField_2515 = true,
	-- ZagreusField_2516 = true,
	-- ZagreusField_2517 = true,
	-- ZagreusField_2518 = true,
	-- ZagreusField_2519 = true,
	-- ZagreusField_2520 = true,
	-- ZagreusField_2521 = true,

	-- GiftGivenVoiceLines
	-- ZagreusField_2514

	ZagreusField_2468 = true,
	ZagreusField_2469 = true,
	ZagreusField_2470 = true,
	ZagreusField_2471 = true,
	ZagreusField_2472 = true,
	ZagreusField_2473 = true,
	ZagreusField_2474 = true,
	ZagreusField_2475 = true,
	ZagreusField_2476 = true,
	ZagreusField_2477 = true,
	ZagreusField_2478 = true,
	ZagreusField_2479 = true,
	ZagreusField_2480 = true,
	ZagreusField_2481 = true,
	ZagreusField_2482 = true,
	ZagreusField_2483 = true,
	ZagreusField_2484 = true,
	ZagreusField_2488 = true,
	ZagreusField_2489 = true,
	ZagreusField_2490 = true,
	ZagreusField_2491 = true,
	ZagreusField_2492 = true,
	ZagreusField_2493 = true,
	ZagreusField_2494 = true,
	ZagreusField_2495 = true,
	ZagreusField_2496 = true,
	ZagreusField_2497 = true,
	ZagreusField_2498 = true,
	ZagreusField_2499 = true,
	ZagreusField_2500 = true,
	ZagreusField_2501 = true,
	ZagreusField_2502 = true,
	ZagreusField_2503 = true,
	ZagreusField_2505 = true,
	ZagreusField_2522 = true,
	ZagreusField_4276 = true,
	ZagreusField_4277 = true,
	ZagreusField_4278 = true,
	ZagreusField_4279 = true,
	ZagreusField_4280 = true,
	ZagreusField_4281 = true,
	ZagreusField_4283 = true,
	ZagreusField_4284 = true,
	ZagreusField_4285 = true,
	ZagreusField_4286 = true,
	ZagreusField_4287 = true,
	ZagreusField_4288 = true,
	ZagreusField_4289 = true,
	ZagreusField_4290 = true,
	ZagreusField_4291 = true,
	ZagreusField_4292 = true,
	ZagreusField_4293 = true,
	-- #endregion

	-- #region Patroclus
	-- CharacterInteractions.Rescue voicelines
	-- ZagreusField_1707 = true,
	-- ZagreusField_1709 = true,
	-- ZagreusField_1740 = true,
	-- ZagreusField_1741 = true,
	-- ZagreusField_1742 = true,
	-- ZagreusField_1743 = true,
	-- ZagreusField_1744 = true,
	-- ZagreusField_1745 = true,

	-- GiftGivenVoiceLines
	-- ZagreusField_1732 = true,

	ZagreusField_1704 = true,
	ZagreusField_1705 = true,
	ZagreusField_1706 = true,
	ZagreusField_1713 = true,
	ZagreusField_1714 = true,
	ZagreusField_1715 = true,
	ZagreusField_1716 = true,
	ZagreusField_1717 = true,
	ZagreusField_1718 = true,
	ZagreusField_1720 = true,
	ZagreusField_1721 = true,
	ZagreusField_1722 = true,
	ZagreusField_1723 = true,
	ZagreusField_1724 = true,
	ZagreusField_1725 = true,
	ZagreusField_1727 = true,
	ZagreusField_1728 = true,
	ZagreusField_1729 = true,
	ZagreusField_1730 = true,
	ZagreusField_1731 = true,
	ZagreusField_1733 = true,
	ZagreusField_1734 = true,
	ZagreusField_1735 = true,
	ZagreusField_1737 = true,
	ZagreusField_1738 = true,
	ZagreusField_1739 = true,
	ZagreusField_1910 = true,
	ZagreusField_1921 = true,
	ZagreusField_2867 = true,
	ZagreusField_3472 = true,
	ZagreusField_3473 = true,
	ZagreusField_3474 = true,
	ZagreusField_3475 = true,
	ZagreusField_3476 = true,
	ZagreusField_3477 = true,
	ZagreusField_3478 = true,
	ZagreusField_3479 = true,
	ZagreusField_3480 = true,
	ZagreusField_3481 = true,
	ZagreusField_3482 = true,
	ZagreusField_3483 = true,
	ZagreusField_3484 = true,
	ZagreusField_3485 = true,
	ZagreusField_3486 = true,
	ZagreusField_3487 = true,
	ZagreusField_3488 = true,
	ZagreusField_3489 = true,
	ZagreusField_3490 = true,
	ZagreusField_3492 = true,
	ZagreusField_3493 = true,
	ZagreusField_3494 = true,
	ZagreusField_3495 = true,
	ZagreusField_3496 = true,
	ZagreusField_3497 = true,
	ZagreusField_3498 = true,
	ZagreusField_3499 = true,
	ZagreusField_3500 = true,
	ZagreusField_3501 = true,
	ZagreusField_3502 = true,
	ZagreusField_3503 = true,
	ZagreusField_3504 = true,
	ZagreusField_3505 = true,
	ZagreusField_3506 = true,
	ZagreusField_3507 = true,
	ZagreusField_3508 = true,
	ZagreusField_3509 = true,
	ZagreusField_3510 = true,
	ZagreusField_4294 = true,
	ZagreusField_4295 = true,
	-- #endregion

	-- #region Surface (Rooms, Overlook, Narrator)
	-- RoomData
	ZagreusField_3588 = true,
	ZagreusField_3589 = true,
	ZagreusField_3590 = true,
	ZagreusField_3591 = true,
	ZagreusField_3596 = true,
	ZagreusField_3597 = true,
	ZagreusField_3598 = true,
	ZagreusField_3599 = true,
	ZagreusField_4322 = true,
	ZagreusField_4323 = true,
	ZagreusField_4671 = true,
	ZagreusField_4672 = true,
	ZagreusField_4699 = true,
	ZagreusField_4700 = true,
	ZagreusField_4701 = true,
	ZagreusField_4702 = true,
	ZagreusField_4703 = true,
	-- GlobalVoiceLines
	ZagreusField_3592 = true,
	ZagreusField_3593 = true,
	ZagreusField_3594 = true,
	ZagreusField_3595 = true,
	ZagreusField_3605 = true,
	ZagreusField_3672 = true,
	ZagreusField_3676 = true,
	ZagreusField_3677 = true,
	ZagreusField_4694 = true,
	ZagreusField_4695 = true,
	ZagreusField_4696 = true,
	ZagreusField_4697 = true,
	ZagreusField_4698 = true,
	-- #endregion

	-- #region Fishing (Surface)
	ZagreusField_3032 = true,
	ZagreusField_3033 = true,
	ZagreusField_3034 = true,
	ZagreusField_3035 = true,
	ZagreusField_3036 = true,
	ZagreusField_3037 = true,
	ZagreusField_3038 = true,
	ZagreusField_3039 = true,
	ZagreusField_3040 = true,
	ZagreusField_3041 = true,
	ZagreusField_3042 = true,
	ZagreusField_3043 = true,
	ZagreusField_3044 = true,
	ZagreusField_3045 = true,
	ZagreusField_3046 = true,
	ZagreusField_3047 = true,
	ZagreusField_3048 = true,
	ZagreusField_3049 = true,
	ZagreusField_3050 = true,
	ZagreusField_3051 = true,
	ZagreusField_3052 = true,
	ZagreusField_3053 = true,
	ZagreusField_3054 = true,
	ZagreusField_3055 = true,
	ZagreusField_3056 = true,
	ZagreusField_3057 = true,
	ZagreusField_3058 = true,
	ZagreusField_3109 = true,
	ZagreusField_3110 = true,
	ZagreusField_3111 = true,
	ZagreusField_3112 = true,
	ZagreusField_3113 = true,
	ZagreusField_3114 = true,
	ZagreusField_3115 = true,
	ZagreusField_3116 = true,
	ZagreusField_3117 = true,
	ZagreusField_3118 = true,
	ZagreusField_3119 = true,
	ZagreusField_3120 = true,
	ZagreusField_3121 = true,
	ZagreusField_3122 = true,
	ZagreusField_3123 = true,
	ZagreusField_3124 = true,
	ZagreusField_3125 = true,
	ZagreusField_3126 = true,
	ZagreusField_3127 = true,
	ZagreusField_3128 = true,
	ZagreusField_3129 = true,
	ZagreusField_3130 = true,
	ZagreusField_3131 = true,
	ZagreusField_3132 = true,
	ZagreusField_3133 = true,
	ZagreusField_3134 = true,
	ZagreusField_3135 = true,
	ZagreusField_3136 = true,
	ZagreusField_3137 = true,
	ZagreusField_3138 = true,
	ZagreusField_3139 = true,
	ZagreusField_3140 = true,
	ZagreusField_3217 = true,
	ZagreusField_3219 = true,
	ZagreusField_3220 = true,
	ZagreusField_3227 = true,
	ZagreusField_3228 = true,
	ZagreusField_3340 = true,
	ZagreusField_3559 = true,
	ZagreusField_3560 = true,
	ZagreusField_3561 = true,
	ZagreusField_3562 = true,
	ZagreusField_3563 = true,
	ZagreusField_3564 = true,
	-- #endregion

	-- #region Persephone (Surface)
	-- EndVoiceLines
	-- Enabled for for the Surface as we actually use the Zagreus model so this makes sense
	ZagreusField_3611 = true,
	ZagreusField_3628 = true,
	ZagreusField_3634 = true,
	ZagreusField_3639 = true,
	ZagreusField_3646 = true,
	ZagreusField_3651 = true,
	ZagreusField_3656 = true,
	ZagreusField_3662 = true,
	ZagreusField_3667 = true,
	ZagreusField_4646 = true,
	ZagreusField_4647 = true,
	ZagreusField_4649 = true,
	ZagreusField_4650 = true,
	ZagreusField_4651 = true,
	ZagreusField_4652 = true,
	ZagreusField_4653 = true,

	-- PresetEventArgs
	ZagreusField_3600 = true,
	ZagreusField_3601 = true,
	ZagreusField_3612 = true,
	ZagreusField_3613 = true,
	ZagreusField_3614 = true,
	ZagreusField_3615 = true,
	ZagreusField_3616 = true,
	ZagreusField_3617 = true,
	ZagreusField_3618 = true,
	ZagreusField_3619 = true,
	ZagreusField_3620 = true,

	ZagreusField_3602 = true,
	ZagreusField_3603 = true,
	ZagreusField_3604 = true,
	ZagreusField_3606 = true,
	ZagreusField_3607 = true,
	ZagreusField_3608 = true,
	ZagreusField_3609 = true,
	ZagreusField_3610 = true,
	ZagreusField_3622 = true,
	ZagreusField_3623 = true,
	ZagreusField_3624 = true,
	ZagreusField_3625 = true,
	ZagreusField_3626 = true,
	ZagreusField_3627 = true,
	ZagreusField_3629 = true,
	ZagreusField_3630 = true,
	ZagreusField_3631 = true,
	ZagreusField_3632 = true,
	ZagreusField_3633 = true,
	ZagreusField_3635 = true,
	ZagreusField_3636 = true,
	ZagreusField_3637 = true,
	ZagreusField_3638 = true,
	ZagreusField_3640 = true,
	ZagreusField_3641 = true,
	ZagreusField_3642 = true,
	ZagreusField_3643 = true,
	ZagreusField_3644 = true,
	ZagreusField_3645 = true,
	ZagreusField_3647 = true,
	ZagreusField_3648 = true,
	ZagreusField_3649 = true,
	ZagreusField_3650 = true,
	ZagreusField_3652 = true,
	ZagreusField_3653 = true,
	ZagreusField_3654 = true,
	ZagreusField_3655 = true,
	ZagreusField_3657 = true,
	ZagreusField_3658 = true,
	ZagreusField_3659 = true,
	ZagreusField_3660 = true,
	ZagreusField_3661 = true,
	ZagreusField_3663 = true,
	ZagreusField_3664 = true,
	ZagreusField_3665 = true,
	ZagreusField_3666 = true,
	ZagreusField_3668 = true,
	ZagreusField_3669 = true,
	ZagreusField_3670 = true,
	ZagreusField_3671 = true,
	ZagreusField_3673 = true,
	ZagreusField_3674 = true,
	ZagreusField_3675 = true,
	ZagreusField_3679 = true,
	-- #endregion

	-- #region Thanatos Field
	-- EndVoiceLines
	-- ZagreusField_0516 = true,
	-- ZagreusField_1146 = true,
	-- ZagreusField_2864 = true,
	-- ZagreusField_2866 = true,
	-- ZagreusField_3444 = true,
	-- ZagreusField_3512 = true,
	-- ZagreusField_3514 = true,
	-- ZagreusField_3517 = true,
	-- ZagreusField_4660 = true,

	-- EncounterStartVoiceLines
	-- ZagreusField_1478 = true,
	-- ZagreusField_1479 = true,
	-- ZagreusField_1480 = true,
	-- ZagreusField_1481 = true,
	-- ZagreusField_1482 = true,
	-- ZagreusField_1483 = true,
	-- ZagreusField_1484 = true,
	-- ZagreusField_1485 = true,
	-- ZagreusField_1486 = true,
	-- ZagreusField_1487 = true,
	-- ZagreusField_1488 = true,
	-- ZagreusField_1489 = true,
	-- ZagreusField_1490 = true,
	-- ZagreusField_1491 = true,
	-- ZagreusField_1492 = true,
	-- ZagreusField_1493 = true,
	-- ZagreusField_1494 = true,
	-- ZagreusField_1495 = true,
	-- ZagreusField_2903 = true,
	-- ZagreusField_2904 = true,
	-- ZagreusField_2905 = true,
	-- ZagreusField_2906 = true,
	-- ZagreusField_2907 = true,
	-- ZagreusField_2908 = true,
	-- ZagreusField_2909 = true,
	-- ZagreusField_2910 = true,
	-- ZagreusField_2911 = true,
	-- ZagreusField_2912 = true,
	-- ZagreusField_3571 = true,
	-- ZagreusField_3572 = true,
	-- ZagreusField_3573 = true,
	-- ZagreusField_3574 = true,
	-- ZagreusField_3575 = true,
	-- ZagreusField_3576 = true,
	-- ZagreusField_3577 = true,
	-- ZagreusField_3578 = true,

	ZagreusField_0514 = true,
	ZagreusField_0515 = true,
	ZagreusField_0517 = true,
	ZagreusField_0518 = true,
	ZagreusField_0519 = true,
	ZagreusField_0520 = true,
	ZagreusField_0951 = true,
	ZagreusField_1515 = true,
	ZagreusField_1523 = true,
	ZagreusField_1637 = true,
	ZagreusField_2862 = true,
	ZagreusField_2863 = true,
	ZagreusField_2865 = true,
	ZagreusField_3511 = true,
	ZagreusField_3513 = true,
	ZagreusField_3515 = true,
	ZagreusField_3516 = true,
	ZagreusField_4658 = true,
	ZagreusField_4659 = true,
	-- #endregion

	-- #region Thanatos Home (+ Field Gifting)
	-- InteractTextLineSets/RepeatableTextLineSets
	-- EndCue/EndVoiceLines
	-- ZagreusField_1146 = true,
	-- ZagreusField_1637 = true,
	-- ZagreusField_00561 = true, -- ZagreusHome_0561
	-- ZagreusField_00788 = true, -- ZagreusHome_0788
	-- ZagreusField_00812 = true, -- ZagreusHome_0812
	-- ZagreusField_00815 = true, -- ZagreusHome_0815
	-- ZagreusField_00818 = true, -- ZagreusHome_0818
	-- ZagreusField_00822 = true, -- ZagreusHome_0822
	-- ZagreusField_01446 = true, -- ZagreusHome_1446
	-- ZagreusField_01449 = true, -- ZagreusHome_1449
	-- ZagreusField_01452 = true, -- ZagreusHome_1452
	-- ZagreusField_01455 = true, -- ZagreusHome_1455
	-- ZagreusField_01459 = true, -- ZagreusHome_1459
	-- ZagreusField_01462 = true, -- ZagreusHome_1462
	-- ZagreusField_01486 = true, -- ZagreusHome_1486
	-- ZagreusField_01550 = true, -- ZagreusHome_1550
	-- ZagreusField_02485 = true, -- ZagreusHome_2485
	-- ZagreusField_02487 = true, -- ZagreusHome_2487
	-- ZagreusField_02490 = true, -- ZagreusHome_2490
	-- ZagreusField_02492 = true, -- ZagreusHome_2492
	-- ZagreusField_02494 = true, -- ZagreusHome_2494
	-- ZagreusField_02497 = true, -- ZagreusHome_2497
	-- ZagreusField_02499 = true, -- ZagreusHome_2499
	-- ZagreusField_02502 = true, -- ZagreusHome_2502
	-- ZagreusField_02504 = true, -- ZagreusHome_2504
	-- ZagreusField_02506 = true, -- ZagreusHome_2506
	-- ZagreusField_02508 = true, -- ZagreusHome_2508
	-- ZagreusField_02510 = true, -- ZagreusHome_2510
	-- ZagreusField_02512 = true, -- ZagreusHome_2512
	-- ZagreusField_02515 = true, -- ZagreusHome_2515
	-- ZagreusField_02518 = true, -- ZagreusHome_2518
	-- ZagreusField_02520 = true, -- ZagreusHome_2520
	-- ZagreusField_02523 = true, -- ZagreusHome_2523
	-- ZagreusField_02525 = true, -- ZagreusHome_2525
	-- ZagreusField_02529 = true, -- ZagreusHome_2529
	-- ZagreusField_02534 = true, -- ZagreusHome_2534
	-- ZagreusField_02537 = true, -- ZagreusHome_2537
	-- ZagreusField_02540 = true, -- ZagreusHome_2540
	-- ZagreusField_02542 = true, -- ZagreusHome_2542
	-- ZagreusField_02545 = true, -- ZagreusHome_2545
	-- ZagreusField_02548 = true, -- ZagreusHome_2548
	-- ZagreusField_02774 = true, -- ZagreusHome_2774
	-- ZagreusField_02776 = true, -- ZagreusHome_2776
	-- ZagreusField_02777 = true, -- ZagreusHome_2777
	-- ZagreusField_02807 = true, -- ZagreusHome_2807
	-- ZagreusField_03190 = true, -- ZagreusHome_3190
	-- ZagreusField_03231 = true, -- ZagreusHome_3231
	-- ZagreusField_03233 = true, -- ZagreusHome_3233
	-- ZagreusField_03235 = true, -- ZagreusHome_3235
	-- ZagreusField_03240 = true, -- ZagreusHome_3240
	-- ZagreusField_03432 = true, -- ZagreusHome_3432
	-- ZagreusField_03434 = true, -- ZagreusHome_3434

	ZagreusField_00220 = true, -- ZagreusHome_0220
	ZagreusField_00221 = true, -- ZagreusHome_0221
	ZagreusField_00222 = true, -- ZagreusHome_0222
	ZagreusField_00223 = true, -- ZagreusHome_0223
	ZagreusField_00784 = true, -- ZagreusHome_0784
	ZagreusField_00810 = true, -- ZagreusHome_0810
	ZagreusField_00811 = true, -- ZagreusHome_0811
	ZagreusField_00813 = true, -- ZagreusHome_0813
	ZagreusField_00814 = true, -- ZagreusHome_0814
	ZagreusField_00816 = true, -- ZagreusHome_0816
	ZagreusField_00817 = true, -- ZagreusHome_0817
	ZagreusField_00821 = true, -- ZagreusHome_0821
	ZagreusField_01444 = true, -- ZagreusHome_1444
	ZagreusField_01445 = true, -- ZagreusHome_1445
	ZagreusField_01447 = true, -- ZagreusHome_1447
	ZagreusField_01448 = true, -- ZagreusHome_1448
	ZagreusField_01450 = true, -- ZagreusHome_1450
	ZagreusField_01451 = true, -- ZagreusHome_1451
	ZagreusField_01453 = true, -- ZagreusHome_1453
	ZagreusField_01454 = true, -- ZagreusHome_1454
	ZagreusField_01456 = true, -- ZagreusHome_1456
	ZagreusField_01457 = true, -- ZagreusHome_1457
	ZagreusField_01458 = true, -- ZagreusHome_1458
	ZagreusField_01460 = true, -- ZagreusHome_1460
	ZagreusField_01461 = true, -- ZagreusHome_1461
	ZagreusField_01463 = true, -- ZagreusHome_1463
	ZagreusField_01464 = true, -- ZagreusHome_1464
	ZagreusField_01483 = true, -- ZagreusHome_1483
	ZagreusField_01484 = true, -- ZagreusHome_1484
	ZagreusField_01485 = true, -- ZagreusHome_1485
	ZagreusField_01549 = true, -- ZagreusHome_1549
	ZagreusField_02483 = true, -- ZagreusHome_2483
	ZagreusField_02484 = true, -- ZagreusHome_2484
	ZagreusField_02486 = true, -- ZagreusHome_2486
	ZagreusField_02488 = true, -- ZagreusHome_2488
	ZagreusField_02489 = true, -- ZagreusHome_2489
	ZagreusField_02491 = true, -- ZagreusHome_2491
	ZagreusField_02493 = true, -- ZagreusHome_2493
	ZagreusField_02495 = true, -- ZagreusHome_2495
	ZagreusField_02496 = true, -- ZagreusHome_2496
	ZagreusField_02498 = true, -- ZagreusHome_2498
	ZagreusField_02500 = true, -- ZagreusHome_2500
	ZagreusField_02501 = true, -- ZagreusHome_2501
	ZagreusField_02503 = true, -- ZagreusHome_2503
	ZagreusField_02505 = true, -- ZagreusHome_2505
	ZagreusField_02507 = true, -- ZagreusHome_2507
	ZagreusField_02509 = true, -- ZagreusHome_2509
	ZagreusField_02511 = true, -- ZagreusHome_2511
	ZagreusField_02513 = true, -- ZagreusHome_2513
	ZagreusField_02514 = true, -- ZagreusHome_2514
	ZagreusField_02516 = true, -- ZagreusHome_2516
	ZagreusField_02517 = true, -- ZagreusHome_2517
	ZagreusField_02519 = true, -- ZagreusHome_2519
	ZagreusField_02521 = true, -- ZagreusHome_2521
	ZagreusField_02522 = true, -- ZagreusHome_2522
	ZagreusField_02524 = true, -- ZagreusHome_2524
	ZagreusField_02526 = true, -- ZagreusHome_2526
	ZagreusField_02527 = true, -- ZagreusHome_2527
	ZagreusField_02528 = true, -- ZagreusHome_2528
	ZagreusField_02532 = true, -- ZagreusHome_2532
	ZagreusField_02533 = true, -- ZagreusHome_2533
	ZagreusField_02535 = true, -- ZagreusHome_2535
	ZagreusField_02536 = true, -- ZagreusHome_2536
	ZagreusField_02538 = true, -- ZagreusHome_2538
	ZagreusField_02539 = true, -- ZagreusHome_2539
	ZagreusField_02541 = true, -- ZagreusHome_2541
	ZagreusField_02543 = true, -- ZagreusHome_2543
	ZagreusField_02544 = true, -- ZagreusHome_2544
	ZagreusField_02546 = true, -- ZagreusHome_2546
	ZagreusField_02547 = true, -- ZagreusHome_2547
	ZagreusField_02805 = true, -- ZagreusHome_2805
	ZagreusField_02806 = true, -- ZagreusHome_2806
	ZagreusField_03228 = true, -- ZagreusHome_3228
	ZagreusField_03229 = true, -- ZagreusHome_3229
	ZagreusField_03230 = true, -- ZagreusHome_3230
	ZagreusField_03232 = true, -- ZagreusHome_3232
	ZagreusField_03234 = true, -- ZagreusHome_3234
	ZagreusField_03236 = true, -- ZagreusHome_3236
	ZagreusField_03238 = true, -- ZagreusHome_3238
	ZagreusField_03239 = true, -- ZagreusHome_3239
	ZagreusField_03429 = true, -- ZagreusHome_3429
	ZagreusField_03431 = true, -- ZagreusHome_3431
	ZagreusField_03433 = true, -- ZagreusHome_3433

	-- Relationship
	ZagreusField_00822 = true, -- ZagreusHome_0822
	ZagreusField_01476 = true, -- ZagreusHome_1476
	ZagreusField_01477 = true, -- ZagreusHome_1477
	ZagreusField_01478 = true, -- ZagreusHome_1478
	ZagreusField_01479 = true, -- ZagreusHome_1479
	ZagreusField_01480 = true, -- ZagreusHome_1480
	ZagreusField_01481 = true, -- ZagreusHome_1481
	ZagreusField_01482 = true, -- ZagreusHome_1482
	ZagreusField_01520 = true, -- ZagreusHome_1520
	ZagreusField_02531 = true, -- ZagreusHome_2531

	-- GiftTextLineSets
	-- EndVoiceLines
	-- ZagreusField_01470 = true,
	-- ZagreusField_01475 = true,
	-- ZagreusField_02482 = true,

	ZagreusField_00116 = true, -- ZagreusHome_0116
	ZagreusField_00224 = true, -- ZagreusHome_0224
	ZagreusField_00225 = true, -- ZagreusHome_0225
	ZagreusField_00779 = true, -- ZagreusHome_0779
	ZagreusField_00780 = true, -- ZagreusHome_0780
	ZagreusField_00781 = true, -- ZagreusHome_0781
	ZagreusField_00782 = true, -- ZagreusHome_0782
	ZagreusField_01465 = true, -- ZagreusHome_1465
	ZagreusField_01467 = true, -- ZagreusHome_1467
	ZagreusField_01468 = true, -- ZagreusHome_1468
	ZagreusField_01469 = true, -- ZagreusHome_1469
	ZagreusField_01471 = true, -- ZagreusHome_1471
	ZagreusField_01472 = true, -- ZagreusHome_1472
	ZagreusField_01473 = true, -- ZagreusHome_1473
	ZagreusField_01474 = true, -- ZagreusHome_1474
	ZagreusField_02479 = true, -- ZagreusHome_2479
	ZagreusField_02480 = true, -- ZagreusHome_2480
	ZagreusField_02481 = true, -- ZagreusHome_2481
	-- #endregion

	-- #region Orpheus (Tartarus/Home)
	-- EndCue
	-- ZagreusHome_0258 = true,
	-- ZagreusHome_0334 = true,
	-- ZagreusHome_0553 = true,
	-- ZagreusHome_0554 = true,
	-- ZagreusHome_0723 = true,
	-- ZagreusHome_0724 = true,
	-- ZagreusHome_0725 = true,
	-- ZagreusHome_0726 = true,
	-- ZagreusHome_0727 = true,
	-- ZagreusHome_0732 = true,
	-- ZagreusHome_0991 = true,
	-- ZagreusHome_1001 = true,
	-- ZagreusHome_1006 = true,
	-- ZagreusHome_1008 = true,
	-- ZagreusHome_1011 = true,
	-- ZagreusHome_1013 = true,
	-- ZagreusHome_1015 = true,
	-- ZagreusHome_1017 = true,
	-- ZagreusHome_1019 = true,
	-- ZagreusHome_1021 = true,
	-- ZagreusHome_1029 = true,
	-- ZagreusHome_1031 = true,
	-- ZagreusHome_1033 = true,
	-- ZagreusHome_1035 = true,
	-- ZagreusHome_1040 = true,
	-- ZagreusHome_1043 = true,
	-- ZagreusHome_1045 = true,
	-- ZagreusHome_1051 = true,
	-- ZagreusHome_1053 = true,
	-- ZagreusHome_1240 = true,
	-- ZagreusHome_2617 = true,
	-- ZagreusHome_2626 = true,
	-- ZagreusHome_3458 = true,

	-- EndVoiceLines
	-- ZagreusHome_0990 = true,
	-- ZagreusHome_1026 = true,
	-- ZagreusHome_1049 = true,
	-- ZagreusHome_2618 = true,
	-- ZagreusHome_2621 = true,
	-- ZagreusHome_2624 = true,
	-- ZagreusHome_3121 = true,
	-- ZagreusHome_3266 = true,

	-- GiftTextLineSets
	-- EndVoiceLines
	-- ZagreusHome_3058 = true,

	ZagreusHome_0082 = true,
	ZagreusHome_0115 = true,
	ZagreusHome_0202 = true,
	ZagreusHome_0203 = true,
	ZagreusHome_0204 = true,
	ZagreusHome_0205 = true,
	ZagreusHome_0206 = true,
	ZagreusHome_0209 = true,
	ZagreusHome_0210 = true,
	ZagreusHome_0211 = true,
	ZagreusHome_0213 = true,
	ZagreusHome_0214 = true,
	ZagreusHome_0215 = true,
	ZagreusHome_0216 = true,
	ZagreusHome_0217 = true,
	ZagreusHome_0218 = true,
	ZagreusHome_0219 = true,
	ZagreusHome_0239 = true,
	ZagreusHome_0240 = true,
	ZagreusHome_0321 = true,
	ZagreusHome_0414 = true,
	ZagreusHome_0522 = true,
	ZagreusHome_0566 = true,
	ZagreusHome_0567 = true,
	ZagreusHome_0568 = true,
	ZagreusHome_0730 = true,
	ZagreusHome_0731 = true,
	ZagreusHome_0998 = true,
	ZagreusHome_0999 = true,
	ZagreusHome_1000 = true,
	ZagreusHome_1002 = true,
	ZagreusHome_1003 = true,
	ZagreusHome_1004 = true,
	ZagreusHome_1005 = true,
	ZagreusHome_1007 = true,
	ZagreusHome_1009 = true,
	ZagreusHome_1010 = true,
	ZagreusHome_1012 = true,
	ZagreusHome_1014 = true,
	ZagreusHome_1016 = true,
	ZagreusHome_1018 = true,
	ZagreusHome_1020 = true,
	ZagreusHome_1022 = true,
	ZagreusHome_1023 = true,
	ZagreusHome_1024 = true,
	ZagreusHome_1025 = true,
	ZagreusHome_1027 = true,
	ZagreusHome_1028 = true,
	ZagreusHome_1030 = true,
	ZagreusHome_1032 = true,
	ZagreusHome_1034 = true,
	ZagreusHome_1036 = true,
	ZagreusHome_1037 = true,
	ZagreusHome_1038 = true,
	ZagreusHome_1039 = true,
	ZagreusHome_1041 = true,
	ZagreusHome_1042 = true,
	ZagreusHome_1044 = true,
	ZagreusHome_1046 = true,
	ZagreusHome_1047 = true,
	ZagreusHome_1048 = true,
	ZagreusHome_1050 = true,
	ZagreusHome_1052 = true,
	ZagreusHome_1238 = true,
	ZagreusHome_1239 = true,
	ZagreusHome_1511 = true,
	ZagreusHome_1619 = true,
	ZagreusHome_1859 = true,
	ZagreusHome_2319 = true,
	ZagreusHome_2320 = true,
	ZagreusHome_2322 = true,
	ZagreusHome_2323 = true,
	ZagreusHome_2349 = true,
	ZagreusHome_2350 = true,
	ZagreusHome_2351 = true,
	ZagreusHome_2616 = true,
	ZagreusHome_2619 = true,
	ZagreusHome_2620 = true,
	ZagreusHome_2622 = true,
	ZagreusHome_2623 = true,
	ZagreusHome_2625 = true,
	ZagreusHome_3117 = true,
	ZagreusHome_3120 = true,
	ZagreusHome_3259 = true,
	ZagreusHome_3260 = true,
	ZagreusHome_3263 = true,
	ZagreusHome_3264 = true,
	ZagreusHome_3265 = true,
	ZagreusHome_3472 = true,
	ZagreusHome_3547 = true,
	ZagreusHome_3548 = true,
	ZagreusHome_3549 = true,
	ZagreusHome_3550 = true,
	ZagreusHome_3572 = true,
	-- #endregion

	-- #region Orpheus (with Eurydice)
	ZagreusField_2485 = true,
	ZagreusField_2486 = true,
	ZagreusHome_3261 = true,
	-- #endregion

	-- #region LootData/Boon pickup/InteractTextLineSets
	-- #region Chaos/TrialUpgrade
	ZagreusField_3804 = true,
	-- #endregion
	-- #endregion
}
