GIT-LOG(1)                        Git Manual                        GIT-LOG(1)

NNAAMMEE
       git-log - Show commit logs

SSYYNNOOPPSSIISS
       _g_i_t _l_o_g [<options>] [<revision range>] [[--] <path>...]

DDEESSCCRRIIPPTTIIOONN
       Shows the commit logs.

       The command takes options applicable to the ggiitt rreevv--lliisstt command to
       control what is shown and how, and options applicable to the ggiitt ddiiffff--**
       commands to control how the changes each commit introduces are shown.

OOPPTTIIOONNSS
       --follow
           Continue listing the history of a file beyond renames (works only
           for a single file).

       --no-decorate, --decorate[=short|full|auto|no]
           Print out the ref names of any commits that are shown. If _s_h_o_r_t is
           specified, the ref name prefixes _r_e_f_s_/_h_e_a_d_s_/, _r_e_f_s_/_t_a_g_s_/ and
           _r_e_f_s_/_r_e_m_o_t_e_s_/ will not be printed. If _f_u_l_l is specified, the full
           ref name (including prefix) will be printed. If _a_u_t_o is specified,
           then if the output is going to a terminal, the ref names are shown
           as if _s_h_o_r_t were given, otherwise no ref names are shown. The
           default option is _s_h_o_r_t.

       --decorate-refs=<pattern>, --decorate-refs-exclude=<pattern>
           If no ----ddeeccoorraattee--rreeffss is given, pretend as if all refs were
           included. For each candidate, do not use it for decoration if it
           matches any patterns given to ----ddeeccoorraattee--rreeffss--eexxcclluuddee or if it
           doesn’t match any of the patterns given to ----ddeeccoorraattee--rreeffss.

       --source
           Print out the ref name given on the command line by which each
           commit was reached.

       --[no-]use-mailmap
           Use mailmap file to map author and committer names and email
           addresses to canonical real names and email addresses. See ggiitt--
           sshhoorrttlloogg(1).

       --full-diff
           Without this flag, ggiitt lloogg --pp <<ppaatthh>>......  shows commits that touch
           the specified paths, and diffs about the same specified paths. With
           this, the full diff is shown for commits that touch the specified
           paths; this means that "<path>..." limits only commits, and doesn’t
           limit diff for those commits.

           Note that this affects all diff-based output types, e.g. those
           produced by ----ssttaatt, etc.

       --log-size
           Include a line “log size <number>” in the output for each commit,
           where <number> is the length of that commit’s message in bytes.
           Intended to speed up tools that read log messages from ggiitt lloogg
           output by allowing them to allocate space in advance.

       -L <start>,<end>:<file>, -L :<funcname>:<file>
           Trace the evolution of the line range given by "<start>,<end>" (or
           the function name regex <funcname>) within the <file>. You may not
           give any pathspec limiters. This is currently limited to a walk
           starting from a single revision, i.e., you may only give zero or
           one positive revision arguments, and <start> and <end> (or
           <funcname>) must exist in the starting revision. You can specify
           this option more than once. Implies ----ppaattcchh. Patch output can be
           suppressed using ----nnoo--ppaattcchh, but other diff formats (namely ----rraaww,
           ----nnuummssttaatt, ----sshhoorrttssttaatt, ----ddiirrssttaatt, ----ssuummmmaarryy, ----nnaammee--oonnllyy,
           ----nnaammee--ssttaattuuss, ----cchheecckk) are not currently implemented.

           <start> and <end> can take one of these forms:

           •   number

               If <start> or <end> is a number, it specifies an absolute line
               number (lines count from 1).

           •   /regex/

               This form will use the first line matching the given POSIX
               regex. If <start> is a regex, it will search from the end of
               the previous --LL range, if any, otherwise from the start of
               file. If <start> is “^/regex/”, it will search from the start
               of file. If <end> is a regex, it will search starting at the
               line given by <start>.

           •   +offset or -offset

               This is only valid for <end> and will specify a number of lines
               before or after the line given by <start>.

           If “:<funcname>” is given in place of <start> and <end>, it is a
           regular expression that denotes the range from the first funcname
           line that matches <funcname>, up to the next funcname line.
           “:<funcname>” searches from the end of the previous --LL range, if
           any, otherwise from the start of file. “^:<funcname>” searches from
           the start of file.

       <revision range>
           Show only commits in the specified revision range. When no
           <revision range> is specified, it defaults to HHEEAADD (i.e. the whole
           history leading to the current commit).  oorriiggiinn....HHEEAADD specifies all
           the commits reachable from the current commit (i.e.  HHEEAADD), but not
           from oorriiggiinn. For a complete list of ways to spell <revision range>,
           see the _S_p_e_c_i_f_y_i_n_g _R_a_n_g_e_s section of ggiittrreevviissiioonnss(7).

       [--] <path>...
           Show only commits that are enough to explain how the files that
           match the specified paths came to be. See _H_i_s_t_o_r_y _S_i_m_p_l_i_f_i_c_a_t_i_o_n
           below for details and other simplification modes.

           Paths may need to be prefixed with ---- to separate them from options
           or the revision range, when confusion arises.

   CCoommmmiitt LLiimmiittiinngg
       Besides specifying a range of commits that should be listed using the
       special notations explained in the description, additional commit
       limiting may be applied.

       Using more options generally further limits the output (e.g.
       ----ssiinnccee==<<ddaattee11>> limits to commits newer than <<ddaattee11>>, and using it with
       ----ggrreepp==<<ppaatttteerrnn>> further limits to commits whose log message has a line
       that matches <<ppaatttteerrnn>>), unless otherwise noted.

       Note that these are applied before commit ordering and formatting
       options, such as ----rreevveerrssee.

       -<number>, -n <number>, --max-count=<number>
           Limit the number of commits to output.

       --skip=<number>
           Skip _n_u_m_b_e_r commits before starting to show the commit output.

       --since=<date>, --after=<date>
           Show commits more recent than a specific date.

       --until=<date>, --before=<date>
           Show commits older than a specific date.

       --author=<pattern>, --committer=<pattern>
           Limit the commits output to ones with author/committer header lines
           that match the specified pattern (regular expression). With more
           than one ----aauutthhoorr==<<ppaatttteerrnn>>, commits whose author matches any of
           the given patterns are chosen (similarly for multiple
           ----ccoommmmiitttteerr==<<ppaatttteerrnn>>).

       --grep-reflog=<pattern>
           Limit the commits output to ones with reflog entries that match the
           specified pattern (regular expression). With more than one
           ----ggrreepp--rreefflloogg, commits whose reflog message matches any of the
           given patterns are chosen. It is an error to use this option unless
           ----wwaallkk--rreeffllooggss is in use.

       --grep=<pattern>
           Limit the commits output to ones with log message that matches the
           specified pattern (regular expression). With more than one
           ----ggrreepp==<<ppaatttteerrnn>>, commits whose message matches any of the given
           patterns are chosen (but see ----aallll--mmaattcchh).

           When ----nnootteess is in effect, the message from the notes is matched as
           if it were part of the log message.

       --all-match
           Limit the commits output to ones that match all given ----ggrreepp,
           instead of ones that match at least one.

       --invert-grep
           Limit the commits output to ones with log message that do not match
           the pattern specified with ----ggrreepp==<<ppaatttteerrnn>>.

       -i, --regexp-ignore-case
           Match the regular expression limiting patterns without regard to
           letter case.

       --basic-regexp
           Consider the limiting patterns to be basic regular expressions;
           this is the default.

       -E, --extended-regexp
           Consider the limiting patterns to be extended regular expressions
           instead of the default basic regular expressions.

       -F, --fixed-strings
           Consider the limiting patterns to be fixed strings (don’t interpret
           pattern as a regular expression).

       -P, --perl-regexp
           Consider the limiting patterns to be Perl-compatible regular
           expressions.

           Support for these types of regular expressions is an optional
           compile-time dependency. If Git wasn’t compiled with support for
           them providing this option will cause it to die.

       --remove-empty
           Stop when a given path disappears from the tree.

       --merges
           Print only merge commits. This is exactly the same as
           ----mmiinn--ppaarreennttss==22.

       --no-merges
           Do not print commits with more than one parent. This is exactly the
           same as ----mmaaxx--ppaarreennttss==11.

       --min-parents=<number>, --max-parents=<number>, --no-min-parents,
       --no-max-parents
           Show only commits which have at least (or at most) that many parent
           commits. In particular, ----mmaaxx--ppaarreennttss==11 is the same as ----nnoo--mmeerrggeess,
           ----mmiinn--ppaarreennttss==22 is the same as ----mmeerrggeess.  ----mmaaxx--ppaarreennttss==00 gives all
           root commits and ----mmiinn--ppaarreennttss==33 all octopus merges.

           ----nnoo--mmiinn--ppaarreennttss and ----nnoo--mmaaxx--ppaarreennttss reset these limits (to no
           limit) again. Equivalent forms are ----mmiinn--ppaarreennttss==00 (any commit has
           0 or more parents) and ----mmaaxx--ppaarreennttss==--11 (negative numbers denote no
           upper limit).

       --first-parent
           Follow only the first parent commit upon seeing a merge commit.
           This option can give a better overview when viewing the evolution
           of a particular topic branch, because merges into a topic branch
           tend to be only about adjusting to updated upstream from time to
           time, and this option allows you to ignore the individual commits
           brought in to your history by such a merge. Cannot be combined with
           --bisect.

       --not
           Reverses the meaning of the _^ prefix (or lack thereof) for all
           following revision specifiers, up to the next ----nnoott.

       --all
           Pretend as if all the refs in rreeffss//, along with HHEEAADD, are listed on
           the command line as _<_c_o_m_m_i_t_>.

       --branches[=<pattern>]
           Pretend as if all the refs in rreeffss//hheeaaddss are listed on the command
           line as _<_c_o_m_m_i_t_>. If _<_p_a_t_t_e_r_n_> is given, limit branches to ones
           matching given shell glob. If pattern lacks _?, _*, or _[, _/_* at the
           end is implied.

       --tags[=<pattern>]
           Pretend as if all the refs in rreeffss//ttaaggss are listed on the command
           line as _<_c_o_m_m_i_t_>. If _<_p_a_t_t_e_r_n_> is given, limit tags to ones
           matching given shell glob. If pattern lacks _?, _*, or _[, _/_* at the
           end is implied.

       --remotes[=<pattern>]
           Pretend as if all the refs in rreeffss//rreemmootteess are listed on the
           command line as _<_c_o_m_m_i_t_>. If _<_p_a_t_t_e_r_n_> is given, limit
           remote-tracking branches to ones matching given shell glob. If
           pattern lacks _?, _*, or _[, _/_* at the end is implied.

       --glob=<glob-pattern>
           Pretend as if all the refs matching shell glob _<_g_l_o_b_-_p_a_t_t_e_r_n_> are
           listed on the command line as _<_c_o_m_m_i_t_>. Leading _r_e_f_s_/, is
           automatically prepended if missing. If pattern lacks _?, _*, or _[, _/_*
           at the end is implied.

       --exclude=<glob-pattern>
           Do not include refs matching _<_g_l_o_b_-_p_a_t_t_e_r_n_> that the next ----aallll,
           ----bbrraanncchheess, ----ttaaggss, ----rreemmootteess, or ----gglloobb would otherwise consider.
           Repetitions of this option accumulate exclusion patterns up to the
           next ----aallll, ----bbrraanncchheess, ----ttaaggss, ----rreemmootteess, or ----gglloobb option (other
           options or arguments do not clear accumulated patterns).

           The patterns given should not begin with rreeffss//hheeaaddss, rreeffss//ttaaggss, or
           rreeffss//rreemmootteess when applied to ----bbrraanncchheess, ----ttaaggss, or ----rreemmootteess,
           respectively, and they must begin with rreeffss// when applied to ----gglloobb
           or ----aallll. If a trailing _/_* is intended, it must be given
           explicitly.

       --reflog
           Pretend as if all objects mentioned by reflogs are listed on the
           command line as <<ccoommmmiitt>>.

       --alternate-refs
           Pretend as if all objects mentioned as ref tips of alternate
           repositories were listed on the command line. An alternate
           repository is any repository whose object directory is specified in
           oobbjjeeccttss//iinnffoo//aalltteerrnnaatteess. The set of included objects may be
           modified by ccoorree..aalltteerrnnaatteeRReeffssCCoommmmaanndd, etc. See ggiitt--ccoonnffiigg(1).

       --single-worktree
           By default, all working trees will be examined by the following
           options when there are more than one (see ggiitt--wwoorrkkttrreeee(1)): ----aallll,
           ----rreefflloogg and ----iinnddeexxeedd--oobbjjeeccttss. This option forces them to examine
           the current working tree only.

       --ignore-missing
           Upon seeing an invalid object name in the input, pretend as if the
           bad input was not given.

       --bisect
           Pretend as if the bad bisection ref rreeffss//bbiisseecctt//bbaadd was listed and
           as if it was followed by ----nnoott and the good bisection refs
           rreeffss//bbiisseecctt//ggoooodd--** on the command line. Cannot be combined with
           --first-parent.

       --stdin
           In addition to the _<_c_o_m_m_i_t_> listed on the command line, read them
           from the standard input. If a ---- separator is seen, stop reading
           commits and start reading paths to limit the result.

       --cherry-mark
           Like ----cchheerrrryy--ppiicckk (see below) but mark equivalent commits with ==
           rather than omitting them, and inequivalent ones with ++.

       --cherry-pick
           Omit any commit that introduces the same change as another commit
           on the “other side” when the set of commits are limited with
           symmetric difference.

           For example, if you have two branches, AA and BB, a usual way to list
           all commits on only one side of them is with ----lleefftt--rriigghhtt (see the
           example below in the description of the ----lleefftt--rriigghhtt option).
           However, it shows the commits that were cherry-picked from the
           other branch (for example, “3rd on b” may be cherry-picked from
           branch A). With this option, such pairs of commits are excluded
           from the output.

       --left-only, --right-only
           List only commits on the respective side of a symmetric difference,
           i.e. only those which would be marked << resp.  >> by ----lleefftt--rriigghhtt.

           For example, ----cchheerrrryy--ppiicckk ----rriigghhtt--oonnllyy AA......BB omits those commits
           from BB which are in AA or are patch-equivalent to a commit in AA. In
           other words, this lists the ++ commits from ggiitt cchheerrrryy AA BB. More
           precisely, ----cchheerrrryy--ppiicckk ----rriigghhtt--oonnllyy ----nnoo--mmeerrggeess gives the exact
           list.

       --cherry
           A synonym for ----rriigghhtt--oonnllyy ----cchheerrrryy--mmaarrkk ----nnoo--mmeerrggeess; useful to
           limit the output to the commits on our side and mark those that
           have been applied to the other side of a forked history with ggiitt
           lloogg ----cchheerrrryy uuppssttrreeaamm......mmyybbrraanncchh, similar to ggiitt cchheerrrryy uuppssttrreeaamm
           mmyybbrraanncchh.

       -g, --walk-reflogs
           Instead of walking the commit ancestry chain, walk reflog entries
           from the most recent one to older ones. When this option is used
           you cannot specify commits to exclude (that is, _^_c_o_m_m_i_t,
           _c_o_m_m_i_t_1_._._c_o_m_m_i_t_2, and _c_o_m_m_i_t_1_._._._c_o_m_m_i_t_2 notations cannot be used).

           With ----pprreettttyy format other than oonneelliinnee and rreeffeerreennccee (for obvious
           reasons), this causes the output to have two extra lines of
           information taken from the reflog. The reflog designator in the
           output may be shown as rreeff@@{{NNtthh}} (where NNtthh is the
           reverse-chronological index in the reflog) or as rreeff@@{{ttiimmeessttaammpp}}
           (with the timestamp for that entry), depending on a few rules:

            1. If the starting point is specified as rreeff@@{{NNtthh}}, show the index
               format.

            2. If the starting point was specified as rreeff@@{{nnooww}}, show the
               timestamp format.

            3. If neither was used, but ----ddaattee was given on the command line,
               show the timestamp in the format requested by ----ddaattee.

            4. Otherwise, show the index format.

           Under ----pprreettttyy==oonneelliinnee, the commit message is prefixed with this
           information on the same line. This option cannot be combined with
           ----rreevveerrssee. See also ggiitt--rreefflloogg(1).

           Under ----pprreettttyy==rreeffeerreennccee, this information will not be shown at
           all.

       --merge
           After a failed merge, show refs that touch files having a conflict
           and don’t exist on all heads to merge.

       --boundary
           Output excluded boundary commits. Boundary commits are prefixed
           with --.

   HHiissttoorryy SSiimmpplliiffiiccaattiioonn
       Sometimes you are only interested in parts of the history, for example
       the commits modifying a particular <path>. But there are two parts of
       _H_i_s_t_o_r_y _S_i_m_p_l_i_f_i_c_a_t_i_o_n, one part is selecting the commits and the other
       is how to do it, as there are various strategies to simplify the
       history.

       The following options select the commits to be shown:

       <paths>
           Commits modifying the given <paths> are selected.

       --simplify-by-decoration
           Commits that are referred by some branch or tag are selected.

       Note that extra commits can be shown to give a meaningful history.

       The following options affect the way the simplification is performed:

       Default mode
           Simplifies the history to the simplest history explaining the final
           state of the tree. Simplest because it prunes some side branches if
           the end result is the same (i.e. merging branches with the same
           content)

       --full-history
           Same as the default mode, but does not prune some history.

       --dense
           Only the selected commits are shown, plus some to have a meaningful
           history.

       --sparse
           All commits in the simplified history are shown.

       --simplify-merges
           Additional option to ----ffuullll--hhiissttoorryy to remove some needless merges
           from the resulting history, as there are no selected commits
           contributing to this merge.

       --ancestry-path
           When given a range of commits to display (e.g.  _c_o_m_m_i_t_1_._._c_o_m_m_i_t_2 or
           _c_o_m_m_i_t_2 _^_c_o_m_m_i_t_1), only display commits that exist directly on the
           ancestry chain between the _c_o_m_m_i_t_1 and _c_o_m_m_i_t_2, i.e. commits that
           are both descendants of _c_o_m_m_i_t_1, and ancestors of _c_o_m_m_i_t_2.

       A more detailed explanation follows.

       Suppose you specified ffoooo as the <paths>. We shall call commits that
       modify ffoooo !TREESAME, and the rest TREESAME. (In a diff filtered for
       ffoooo, they look different and equal, respectively.)

       In the following, we will always refer to the same example history to
       illustrate the differences between simplification settings. We assume
       that you are filtering for a file ffoooo in this commit graph:

                     .-A---M---N---O---P---Q
                    /     /   /   /   /   /
                   I     B   C   D   E   Y
                    \   /   /   /   /   /
                     `-------------'   X

       The horizontal line of history A---Q is taken to be the first parent of
       each merge. The commits are:

       •   II is the initial commit, in which ffoooo exists with contents “asdf”,
           and a file qquuuuxx exists with contents “quux”. Initial commits are
           compared to an empty tree, so II is !TREESAME.

       •   In AA, ffoooo contains just “foo”.

       •   BB contains the same change as AA. Its merge MM is trivial and hence
           TREESAME to all parents.

       •   CC does not change ffoooo, but its merge NN changes it to “foobar”, so
           it is not TREESAME to any parent.

       •   DD sets ffoooo to “baz”. Its merge OO combines the strings from NN and DD
           to “foobarbaz”; i.e., it is not TREESAME to any parent.

       •   EE changes qquuuuxx to “xyzzy”, and its merge PP combines the strings to
           “quux xyzzy”.  PP is TREESAME to OO, but not to EE.

       •   XX is an independent root commit that added a new file ssiiddee, and YY
           modified it.  YY is TREESAME to XX. Its merge QQ added ssiiddee to PP, and
           QQ is TREESAME to PP, but not to YY.

       rreevv--lliisstt walks backwards through history, including or excluding
       commits based on whether ----ffuullll--hhiissttoorryy and/or parent rewriting (via
       ----ppaarreennttss or ----cchhiillddrreenn) are used. The following settings are
       available.

       Default mode
           Commits are included if they are not TREESAME to any parent (though
           this can be changed, see ----ssppaarrssee below). If the commit was a
           merge, and it was TREESAME to one parent, follow only that parent.
           (Even if there are several TREESAME parents, follow only one of
           them.) Otherwise, follow all parents.

           This results in:

                         .-A---N---O
                        /     /   /
                       I---------D

           Note how the rule to only follow the TREESAME parent, if one is
           available, removed BB from consideration entirely.  CC was considered
           via NN, but is TREESAME. Root commits are compared to an empty tree,
           so II is !TREESAME.

           Parent/child relations are only visible with ----ppaarreennttss, but that
           does not affect the commits selected in default mode, so we have
           shown the parent lines.

       --full-history without parent rewriting
           This mode differs from the default in one point: always follow all
           parents of a merge, even if it is TREESAME to one of them. Even if
           more than one side of the merge has commits that are included, this
           does not imply that the merge itself is! In the example, we get

                       I  A  B  N  D  O  P  Q

           MM was excluded because it is TREESAME to both parents.  EE, CC and BB
           were all walked, but only BB was !TREESAME, so the others do not
           appear.

           Note that without parent rewriting, it is not really possible to
           talk about the parent/child relationships between the commits, so
           we show them disconnected.

       --full-history with parent rewriting
           Ordinary commits are only included if they are !TREESAME (though
           this can be changed, see ----ssppaarrssee below).

           Merges are always included. However, their parent list is
           rewritten: Along each parent, prune away commits that are not
           included themselves. This results in

                         .-A---M---N---O---P---Q
                        /     /   /   /   /
                       I     B   /   D   /
                        \   /   /   /   /
                         `-------------'

           Compare to ----ffuullll--hhiissttoorryy without rewriting above. Note that EE was
           pruned away because it is TREESAME, but the parent list of P was
           rewritten to contain EE's parent II. The same happened for CC and NN,
           and XX, YY and QQ.

       In addition to the above settings, you can change whether TREESAME
       affects inclusion:

       --dense
           Commits that are walked are included if they are not TREESAME to
           any parent.

       --sparse
           All commits that are walked are included.

           Note that without ----ffuullll--hhiissttoorryy, this still simplifies merges: if
           one of the parents is TREESAME, we follow only that one, so the
           other sides of the merge are never walked.

       --simplify-merges
           First, build a history graph in the same way that ----ffuullll--hhiissttoorryy
           with parent rewriting does (see above).

           Then simplify each commit CC to its replacement CC'' in the final
           history according to the following rules:

           •   Set CC'' to CC.

           •   Replace each parent PP of CC'' with its simplification PP''. In the
               process, drop parents that are ancestors of other parents or
               that are root commits TREESAME to an empty tree, and remove
               duplicates, but take care to never drop all parents that we are
               TREESAME to.

           •   If after this parent rewriting, CC'' is a root or merge commit
               (has zero or >1 parents), a boundary commit, or !TREESAME, it
               remains. Otherwise, it is replaced with its only parent.

           The effect of this is best shown by way of comparing to
           ----ffuullll--hhiissttoorryy with parent rewriting. The example turns into:

                         .-A---M---N---O
                        /     /       /
                       I     B       D
                        \   /       /
                         `---------'

           Note the major differences in NN, PP, and QQ over ----ffuullll--hhiissttoorryy:

           •   NN's parent list had II removed, because it is an ancestor of the
               other parent MM. Still, NN remained because it is !TREESAME.

           •   PP's parent list similarly had II removed.  PP was then removed
               completely, because it had one parent and is TREESAME.

           •   QQ's parent list had YY simplified to XX.  XX was then removed,
               because it was a TREESAME root.  QQ was then removed completely,
               because it had one parent and is TREESAME.

       Finally, there is a fifth simplification mode available:

       --ancestry-path
           Limit the displayed commits to those directly on the ancestry chain
           between the “from” and “to” commits in the given commit range. I.e.
           only display commits that are ancestor of the “to” commit and
           descendants of the “from” commit.

           As an example use case, consider the following commit history:

                           D---E-------F
                          /     \       \
                         B---C---G---H---I---J
                        /                     \
                       A-------K---------------L--M

           A regular _D_._._M computes the set of commits that are ancestors of MM,
           but excludes the ones that are ancestors of DD. This is useful to
           see what happened to the history leading to MM since DD, in the sense
           that “what does MM have that did not exist in DD”. The result in this
           example would be all the commits, except AA and BB (and DD itself, of
           course).

           When we want to find out what commits in MM are contaminated with
           the bug introduced by DD and need fixing, however, we might want to
           view only the subset of _D_._._M that are actually descendants of DD,
           i.e. excluding CC and KK. This is exactly what the ----aanncceessttrryy--ppaatthh
           option does. Applied to the _D_._._M range, it results in:

                               E-------F
                                \       \
                                 G---H---I---J
                                              \
                                               L--M

       The ----ssiimmpplliiffyy--bbyy--ddeeccoorraattiioonn option allows you to view only the big
       picture of the topology of the history, by omitting commits that are
       not referenced by tags. Commits are marked as !TREESAME (in other
       words, kept after history simplification rules described above) if (1)
       they are referenced by tags, or (2) they change the contents of the
       paths given on the command line. All other commits are marked as
       TREESAME (subject to be simplified away).

   CCoommmmiitt OOrrddeerriinngg
       By default, the commits are shown in reverse chronological order.

       --date-order
           Show no parents before all of its children are shown, but otherwise
           show commits in the commit timestamp order.

       --author-date-order
           Show no parents before all of its children are shown, but otherwise
           show commits in the author timestamp order.

       --topo-order
           Show no parents before all of its children are shown, and avoid
           showing commits on multiple lines of history intermixed.

           For example, in a commit history like this:

                   ---1----2----4----7
                       \              \
                        3----5----6----8---

           where the numbers denote the order of commit timestamps, ggiitt
           rreevv--lliisstt and friends with ----ddaattee--oorrddeerr show the commits in the
           timestamp order: 8 7 6 5 4 3 2 1.

           With ----ttooppoo--oorrddeerr, they would show 8 6 5 3 7 4 2 1 (or 8 7 4 2 6 5
           3 1); some older commits are shown before newer ones in order to
           avoid showing the commits from two parallel development track mixed
           together.

       --reverse
           Output the commits chosen to be shown (see Commit Limiting section
           above) in reverse order. Cannot be combined with ----wwaallkk--rreeffllooggss.

   OObbjjeecctt TTrraavveerrssaall
       These options are mostly targeted for packing of Git repositories.

       --no-walk[=(sorted|unsorted)]
           Only show the given commits, but do not traverse their ancestors.
           This has no effect if a range is specified. If the argument
           uunnssoorrtteedd is given, the commits are shown in the order they were
           given on the command line. Otherwise (if ssoorrtteedd or no argument was
           given), the commits are shown in reverse chronological order by
           commit time. Cannot be combined with ----ggrraapphh.

       --do-walk
           Overrides a previous ----nnoo--wwaallkk.

   CCoommmmiitt FFoorrmmaattttiinngg
       --pretty[=<format>], --format=<format>
           Pretty-print the contents of the commit logs in a given format,
           where _<_f_o_r_m_a_t_> can be one of _o_n_e_l_i_n_e, _s_h_o_r_t, _m_e_d_i_u_m, _f_u_l_l, _f_u_l_l_e_r,
           _r_e_f_e_r_e_n_c_e, _e_m_a_i_l, _r_a_w, _f_o_r_m_a_t_:_<_s_t_r_i_n_g_> and _t_f_o_r_m_a_t_:_<_s_t_r_i_n_g_>. When
           _<_f_o_r_m_a_t_> is none of the above, and has _%_p_l_a_c_e_h_o_l_d_e_r in it, it acts
           as if _-_-_p_r_e_t_t_y_=_t_f_o_r_m_a_t_:_<_f_o_r_m_a_t_> were given.

           See the "PRETTY FORMATS" section for some additional details for
           each format. When _=_<_f_o_r_m_a_t_> part is omitted, it defaults to _m_e_d_i_u_m.

           Note: you can specify the default pretty format in the repository
           configuration (see ggiitt--ccoonnffiigg(1)).

       --abbrev-commit
           Instead of showing the full 40-byte hexadecimal commit object name,
           show only a partial prefix. Non default number of digits can be
           specified with "--abbrev=<n>" (which also modifies diff output, if
           it is displayed).

           This should make "--pretty=oneline" a whole lot more readable for
           people using 80-column terminals.

       --no-abbrev-commit
           Show the full 40-byte hexadecimal commit object name. This negates
           ----aabbbbrreevv--ccoommmmiitt and those options which imply it such as
           "--oneline". It also overrides the lloogg..aabbbbrreevvCCoommmmiitt variable.

       --oneline
           This is a shorthand for "--pretty=oneline --abbrev-commit" used
           together.

       --encoding=<encoding>
           The commit objects record the encoding used for the log message in
           their encoding header; this option can be used to tell the command
           to re-code the commit log message in the encoding preferred by the
           user. For non plumbing commands this defaults to UTF-8. Note that
           if an object claims to be encoded in XX and we are outputting in XX,
           we will output the object verbatim; this means that invalid
           sequences in the original commit may be copied to the output.

       --expand-tabs=<n>, --expand-tabs, --no-expand-tabs
           Perform a tab expansion (replace each tab with enough spaces to
           fill to the next display column that is multiple of _<_n_>) in the log
           message before showing it in the output.  ----eexxppaanndd--ttaabbss is a
           short-hand for ----eexxppaanndd--ttaabbss==88, and ----nnoo--eexxppaanndd--ttaabbss is a
           short-hand for ----eexxppaanndd--ttaabbss==00, which disables tab expansion.

           By default, tabs are expanded in pretty formats that indent the log
           message by 4 spaces (i.e.  _m_e_d_i_u_m, which is the default, _f_u_l_l, and
           _f_u_l_l_e_r).

       --notes[=<ref>]
           Show the notes (see ggiitt--nnootteess(1)) that annotate the commit, when
           showing the commit log message. This is the default for ggiitt lloogg,
           ggiitt sshhooww and ggiitt wwhhaattcchhaannggeedd commands when there is no ----pprreettttyy,
           ----ffoorrmmaatt, or ----oonneelliinnee option given on the command line.

           By default, the notes shown are from the notes refs listed in the
           ccoorree..nnootteessRReeff and nnootteess..ddiissppllaayyRReeff variables (or corresponding
           environment overrides). See ggiitt--ccoonnffiigg(1) for more details.

           With an optional _<_r_e_f_> argument, use the ref to find the notes to
           display. The ref can specify the full refname when it begins with
           rreeffss//nnootteess//; when it begins with nnootteess//, rreeffss// and otherwise
           rreeffss//nnootteess// is prefixed to form a full name of the ref.

           Multiple --notes options can be combined to control which notes are
           being displayed. Examples: "--notes=foo" will show only notes from
           "refs/notes/foo"; "--notes=foo --notes" will show both notes from
           "refs/notes/foo" and from the default notes ref(s).

       --no-notes
           Do not show notes. This negates the above ----nnootteess option, by
           resetting the list of notes refs from which notes are shown.
           Options are parsed in the order given on the command line, so e.g.
           "--notes --notes=foo --no-notes --notes=bar" will only show notes
           from "refs/notes/bar".

       --show-notes[=<ref>], --[no-]standard-notes
           These options are deprecated. Use the above --notes/--no-notes
           options instead.

       --show-signature
           Check the validity of a signed commit object by passing the
           signature to ggppgg ----vveerriiffyy and show the output.

       --relative-date
           Synonym for ----ddaattee==rreellaattiivvee.

       --date=<format>
           Only takes effect for dates shown in human-readable format, such as
           when using ----pprreettttyy.  lloogg..ddaattee config variable sets a default value
           for the log command’s ----ddaattee option. By default, dates are shown in
           the original time zone (either committer’s or author’s). If --llooccaall
           is appended to the format (e.g., iissoo--llooccaall), the user’s local time
           zone is used instead.

           ----ddaattee==rreellaattiivvee shows dates relative to the current time, e.g. “2
           hours ago”. The --llooccaall option has no effect for ----ddaattee==rreellaattiivvee.

           ----ddaattee==llooccaall is an alias for ----ddaattee==ddeeffaauulltt--llooccaall.

           ----ddaattee==iissoo (or ----ddaattee==iissoo88660011) shows timestamps in a ISO 8601-like
           format. The differences to the strict ISO 8601 format are:

           •   a space instead of the TT date/time delimiter

           •   a space between time and time zone

           •   no colon between hours and minutes of the time zone

           ----ddaattee==iissoo--ssttrriicctt (or ----ddaattee==iissoo88660011--ssttrriicctt) shows timestamps in
           strict ISO 8601 format.

           ----ddaattee==rrffcc (or ----ddaattee==rrffcc22882222) shows timestamps in RFC 2822 format,
           often found in email messages.

           ----ddaattee==sshhoorrtt shows only the date, but not the time, in YYYYYYYY--MMMM--DDDD
           format.

           ----ddaattee==rraaww shows the date as seconds since the epoch (1970-01-01
           00:00:00 UTC), followed by a space, and then the timezone as an
           offset from UTC (a ++ or -- with four digits; the first two are
           hours, and the second two are minutes). I.e., as if the timestamp
           were formatted with ssttrrffttiimmee((""%%ss %%zz""))). Note that the --llooccaall option
           does not affect the seconds-since-epoch value (which is always
           measured in UTC), but does switch the accompanying timezone value.

           ----ddaattee==hhuummaann shows the timezone if the timezone does not match the
           current time-zone, and doesn’t print the whole date if that matches
           (ie skip printing year for dates that are "this year", but also
           skip the whole date itself if it’s in the last few days and we can
           just say what weekday it was). For older dates the hour and minute
           is also omitted.

           ----ddaattee==uunniixx shows the date as a Unix epoch timestamp (seconds since
           1970). As with ----rraaww, this is always in UTC and therefore --llooccaall
           has no effect.

           ----ddaattee==ffoorrmmaatt::......  feeds the format ......  to your system ssttrrffttiimmee,
           except for %z and %Z, which are handled internally. Use
           ----ddaattee==ffoorrmmaatt::%%cc to show the date in your system locale’s preferred
           format. See the ssttrrffttiimmee manual for a complete list of format
           placeholders. When using --llooccaall, the correct syntax is
           ----ddaattee==ffoorrmmaatt--llooccaall::.......

           ----ddaattee==ddeeffaauulltt is the default format, and is similar to
           ----ddaattee==rrffcc22882222, with a few exceptions:

           •   there is no comma after the day-of-week

           •   the time zone is omitted when the local time zone is used

       --parents
           Print also the parents of the commit (in the form "commit
           parent..."). Also enables parent rewriting, see _H_i_s_t_o_r_y
           _S_i_m_p_l_i_f_i_c_a_t_i_o_n above.

       --children
           Print also the children of the commit (in the form "commit
           child..."). Also enables parent rewriting, see _H_i_s_t_o_r_y
           _S_i_m_p_l_i_f_i_c_a_t_i_o_n above.

       --left-right
           Mark which side of a symmetric difference a commit is reachable
           from. Commits from the left side are prefixed with << and those from
           the right with >>. If combined with ----bboouunnddaarryy, those commits are
           prefixed with --.

           For example, if you have this topology:

                            y---b---b  branch B
                           / \ /
                          /   .
                         /   / \
                        o---x---a---a  branch A

           you would get an output like this:

                       $ git rev-list --left-right --boundary --pretty=oneline A...B

                       >bbbbbbb... 3rd on b
                       >bbbbbbb... 2nd on b
                       <aaaaaaa... 3rd on a
                       <aaaaaaa... 2nd on a
                       -yyyyyyy... 1st on b
                       -xxxxxxx... 1st on a

       --graph
           Draw a text-based graphical representation of the commit history on
           the left hand side of the output. This may cause extra lines to be
           printed in between commits, in order for the graph history to be
           drawn properly. Cannot be combined with ----nnoo--wwaallkk.

           This enables parent rewriting, see _H_i_s_t_o_r_y _S_i_m_p_l_i_f_i_c_a_t_i_o_n above.

           This implies the ----ttooppoo--oorrddeerr option by default, but the
           ----ddaattee--oorrddeerr option may also be specified.

       --show-linear-break[=<barrier>]
           When --graph is not used, all history branches are flattened which
           can make it hard to see that the two consecutive commits do not
           belong to a linear branch. This option puts a barrier in between
           them in that case. If <<bbaarrrriieerr>> is specified, it is the string that
           will be shown instead of the default one.

   DDiiffff FFoorrmmaattttiinngg
       Listed below are options that control the formatting of diff output.
       Some of them are specific to ggiitt--rreevv--lliisstt(1), however other diff
       options may be given. See ggiitt--ddiiffff--ffiilleess(1) for more options.

       -c
           With this option, diff output for a merge commit shows the
           differences from each of the parents to the merge result
           simultaneously instead of showing pairwise diff between a parent
           and the result one at a time. Furthermore, it lists only files
           which were modified from all parents.

       --cc
           This flag implies the --cc option and further compresses the patch
           output by omitting uninteresting hunks whose contents in the
           parents have only two variants and the merge result picks one of
           them without modification.

       --combined-all-paths
           This flag causes combined diffs (used for merge commits) to list
           the name of the file from all parents. It thus only has effect when
           -c or --cc are specified, and is likely only useful if filename
           changes are detected (i.e. when either rename or copy detection
           have been requested).

       -m
           This flag makes the merge commits show the full diff like regular
           commits; for each merge parent, a separate log entry and diff is
           generated. An exception is that only diff against the first parent
           is shown when ----ffiirrsstt--ppaarreenntt option is given; in that case, the
           output represents the changes the merge brought _i_n_t_o the
           then-current branch.

       -r
           Show recursive diffs.

       -t
           Show the tree objects in the diff output. This implies --rr.

PPRREETTTTYY FFOORRMMAATTSS
       If the commit is a merge, and if the pretty-format is not _o_n_e_l_i_n_e,
       _e_m_a_i_l or _r_a_w, an additional line is inserted before the _A_u_t_h_o_r_: line.
       This line begins with "Merge: " and the hashes of ancestral commits are
       printed, separated by spaces. Note that the listed commits may not
       necessarily be the list of the ddiirreecctt parent commits if you have
       limited your view of history: for example, if you are only interested
       in changes related to a certain directory or file.

       There are several built-in formats, and you can define additional
       formats by setting a pretty.<name> config option to either another
       format name, or a _f_o_r_m_a_t_: string, as described below (see ggiitt--
       ccoonnffiigg(1)). Here are the details of the built-in formats:

       •   _o_n_e_l_i_n_e

               <hash> <title line>

           This is designed to be as compact as possible.

       •   _s_h_o_r_t

               commit <hash>
               Author: <author>

               <title line>

       •   _m_e_d_i_u_m

               commit <hash>
               Author: <author>
               Date:   <author date>

               <title line>

               <full commit message>

       •   _f_u_l_l

               commit <hash>
               Author: <author>
               Commit: <committer>

               <title line>

               <full commit message>

       •   _f_u_l_l_e_r

               commit <hash>
               Author:     <author>
               AuthorDate: <author date>
               Commit:     <committer>
               CommitDate: <committer date>

               <title line>

               <full commit message>

       •   _r_e_f_e_r_e_n_c_e

               <abbrev hash> (<title line>, <short author date>)

           This format is used to refer to another commit in a commit message
           and is the same as ----pprreettttyy==''ffoorrmmaatt::%%CC((aauuttoo))%%hh ((%%ss,, %%aadd))''. By
           default, the date is formatted with ----ddaattee==sshhoorrtt unless another
           ----ddaattee option is explicitly specified. As with any ffoorrmmaatt:: with
           format placeholders, its output is not affected by other options
           like ----ddeeccoorraattee and ----wwaallkk--rreeffllooggss.

       •   _e_m_a_i_l

               From <hash> <date>
               From: <author>
               Date: <author date>
               Subject: [PATCH] <title line>

               <full commit message>

       •   _r_a_w

           The _r_a_w format shows the entire commit exactly as stored in the
           commit object. Notably, the hashes are displayed in full,
           regardless of whether --abbrev or --no-abbrev are used, and _p_a_r_e_n_t_s
           information show the true parent commits, without taking grafts or
           history simplification into account. Note that this format affects
           the way commits are displayed, but not the way the diff is shown
           e.g. with ggiitt lloogg ----rraaww. To get full object names in a raw diff
           format, use ----nnoo--aabbbbrreevv.

       •   _f_o_r_m_a_t_:_<_s_t_r_i_n_g_>

           The _f_o_r_m_a_t_:_<_s_t_r_i_n_g_> format allows you to specify which information
           you want to show. It works a little bit like printf format, with
           the notable exception that you get a newline with _%_n instead of _\_n.

           E.g, _f_o_r_m_a_t_:_"_T_h_e _a_u_t_h_o_r _o_f _%_h _w_a_s _%_a_n_, _%_a_r_%_n_T_h_e _t_i_t_l_e _w_a_s _>_>_%_s_<_<_%_n_"
           would show something like this:

               The author of fe6e0ee was Junio C Hamano, 23 hours ago
               The title was >>t4119: test autocomputing -p<n> for traditional diff input.<<

           The placeholders are:

           •   Placeholders that expand to a single literal character:

               _%_n
                   newline

               _%_%
                   a raw _%

               _%_x_0_0
                   print a byte from a hex code

           •   Placeholders that affect formatting of later placeholders:

               _%_C_r_e_d
                   switch color to red

               _%_C_g_r_e_e_n
                   switch color to green

               _%_C_b_l_u_e
                   switch color to blue

               _%_C_r_e_s_e_t
                   reset color

               _%_C_(_._._._)
                   color specification, as described under Values in the
                   "CONFIGURATION FILE" section of ggiitt--ccoonnffiigg(1). By default,
                   colors are shown only when enabled for log output (by
                   ccoolloorr..ddiiffff, ccoolloorr..uuii, or ----ccoolloorr, and respecting the aauuttoo
                   settings of the former if we are going to a terminal).
                   %%CC((aauuttoo,,......))  is accepted as a historical synonym for the
                   default (e.g., %%CC((aauuttoo,,rreedd))). Specifying %%CC((aallwwaayyss,,......))
                   will show the colors even when color is not otherwise
                   enabled (though consider just using ----ccoolloorr==aallwwaayyss to
                   enable color for the whole output, including this format
                   and anything else git might color).  aauuttoo alone (i.e.
                   %%CC((aauuttoo))) will turn on auto coloring on the next
                   placeholders until the color is switched again.

               _%_m
                   left (<<), right (>>) or boundary (--) mark

               _%_w_(_[_<_w_>_[_,_<_i_1_>_[_,_<_i_2_>_]_]_]_)
                   switch line wrapping, like the -w option of ggiitt--
                   sshhoorrttlloogg(1).

               _%_<_(_<_N_>_[_,_t_r_u_n_c_|_l_t_r_u_n_c_|_m_t_r_u_n_c_]_)
                   make the next placeholder take at least N columns, padding
                   spaces on the right if necessary. Optionally truncate at
                   the beginning (ltrunc), the middle (mtrunc) or the end
                   (trunc) if the output is longer than N columns. Note that
                   truncating only works correctly with N >= 2.

               _%_<_|_(_<_N_>_)
                   make the next placeholder take at least until Nth columns,
                   padding spaces on the right if necessary

               _%_>_(_<_N_>_), _%_>_|_(_<_N_>_)
                   similar to _%_<_(_<_N_>_), _%_<_|_(_<_N_>_) respectively, but padding
                   spaces on the left

               _%_>_>_(_<_N_>_), _%_>_>_|_(_<_N_>_)
                   similar to _%_>_(_<_N_>_), _%_>_|_(_<_N_>_) respectively, except that if
                   the next placeholder takes more spaces than given and there
                   are spaces on its left, use those spaces

               _%_>_<_(_<_N_>_), _%_>_<_|_(_<_N_>_)
                   similar to _%_<_(_<_N_>_), _%_<_|_(_<_N_>_) respectively, but padding both
                   sides (i.e. the text is centered)

           •   Placeholders that expand to information extracted from the
               commit:

               _%_H
                   commit hash

               _%_h
                   abbreviated commit hash

               _%_T
                   tree hash

               _%_t
                   abbreviated tree hash

               _%_P
                   parent hashes

               _%_p
                   abbreviated parent hashes

               _%_a_n
                   author name

               _%_a_N
                   author name (respecting .mailmap, see ggiitt--sshhoorrttlloogg(1) or
                   ggiitt--bbllaammee(1))

               _%_a_e
                   author email

               _%_a_E
                   author email (respecting .mailmap, see ggiitt--sshhoorrttlloogg(1) or
                   ggiitt--bbllaammee(1))

               _%_a_l
                   author email local-part (the part before the _@ sign)

               _%_a_L
                   author local-part (see _%_a_l) respecting .mailmap, see ggiitt--
                   sshhoorrttlloogg(1) or ggiitt--bbllaammee(1))

               _%_a_d
                   author date (format respects --date= option)

               _%_a_D
                   author date, RFC2822 style

               _%_a_r
                   author date, relative

               _%_a_t
                   author date, UNIX timestamp

               _%_a_i
                   author date, ISO 8601-like format

               _%_a_I
                   author date, strict ISO 8601 format

               _%_a_s
                   author date, short format (YYYYYYYY--MMMM--DDDD)

               _%_c_n
                   committer name

               _%_c_N
                   committer name (respecting .mailmap, see ggiitt--sshhoorrttlloogg(1) or
                   ggiitt--bbllaammee(1))

               _%_c_e
                   committer email

               _%_c_E
                   committer email (respecting .mailmap, see ggiitt--sshhoorrttlloogg(1)
                   or ggiitt--bbllaammee(1))

               _%_c_l
                   author email local-part (the part before the _@ sign)

               _%_c_L
                   author local-part (see _%_c_l) respecting .mailmap, see ggiitt--
                   sshhoorrttlloogg(1) or ggiitt--bbllaammee(1))

               _%_c_d
                   committer date (format respects --date= option)

               _%_c_D
                   committer date, RFC2822 style

               _%_c_r
                   committer date, relative

               _%_c_t
                   committer date, UNIX timestamp

               _%_c_i
                   committer date, ISO 8601-like format

               _%_c_I
                   committer date, strict ISO 8601 format

               _%_c_s
                   committer date, short format (YYYYYYYY--MMMM--DDDD)

               _%_d
                   ref names, like the --decorate option of ggiitt--lloogg(1)

               _%_D
                   ref names without the " (", ")" wrapping.

               _%_S
                   ref name given on the command line by which the commit was
                   reached (like ggiitt lloogg ----ssoouurrccee), only works with ggiitt lloogg

               _%_e
                   encoding

               _%_s
                   subject

               _%_f
                   sanitized subject line, suitable for a filename

               _%_b
                   body

               _%_B
                   raw body (unwrapped subject and body)

               _%_N
                   commit notes

               _%_G_G
                   raw verification message from GPG for a signed commit

               _%_G_?
                   show "G" for a good (valid) signature, "B" for a bad
                   signature, "U" for a good signature with unknown validity,
                   "X" for a good signature that has expired, "Y" for a good
                   signature made by an expired key, "R" for a good signature
                   made by a revoked key, "E" if the signature cannot be
                   checked (e.g. missing key) and "N" for no signature

               _%_G_S
                   show the name of the signer for a signed commit

               _%_G_K
                   show the key used to sign a signed commit

               _%_G_F
                   show the fingerprint of the key used to sign a signed
                   commit

               _%_G_P
                   show the fingerprint of the primary key whose subkey was
                   used to sign a signed commit

               _%_g_D
                   reflog selector, e.g., rreeffss//ssttaasshh@@{{11}} or rreeffss//ssttaasshh@@{{22
                   mmiinnuutteess aaggoo}}; the format follows the rules described for
                   the --gg option. The portion before the @@ is the refname as
                   given on the command line (so ggiitt lloogg --gg rreeffss//hheeaaddss//mmaasstteerr
                   would yield rreeffss//hheeaaddss//mmaasstteerr@@{{00}}).

               _%_g_d
                   shortened reflog selector; same as %%ggDD, but the refname
                   portion is shortened for human readability (so
                   rreeffss//hheeaaddss//mmaasstteerr becomes just mmaasstteerr).

               _%_g_n
                   reflog identity name

               _%_g_N
                   reflog identity name (respecting .mailmap, see ggiitt--
                   sshhoorrttlloogg(1) or ggiitt--bbllaammee(1))

               _%_g_e
                   reflog identity email

               _%_g_E
                   reflog identity email (respecting .mailmap, see ggiitt--
                   sshhoorrttlloogg(1) or ggiitt--bbllaammee(1))

               _%_g_s
                   reflog subject

               _%_(_t_r_a_i_l_e_r_s_[_:_o_p_t_i_o_n_s_]_)
                   display the trailers of the body as interpreted by ggiitt--
                   iinntteerrpprreett--ttrraaiilleerrss(1). The ttrraaiilleerrss string may be followed
                   by a colon and zero or more comma-separated options:

                   •   _k_e_y_=_<_K_>: only show trailers with specified key.
                       Matching is done case-insensitively and trailing colon
                       is optional. If option is given multiple times trailer
                       lines matching any of the keys are shown. This option
                       automatically enables the oonnllyy option so that
                       non-trailer lines in the trailer block are hidden. If
                       that is not desired it can be disabled with oonnllyy==ffaallssee.
                       E.g., %%((ttrraaiilleerrss::kkeeyy==RReevviieewweedd--bbyy)) shows trailer lines
                       with key RReevviieewweedd--bbyy.

                   •   _o_n_l_y_[_=_v_a_l_]: select whether non-trailer lines from the
                       trailer block should be included. The oonnllyy keyword may
                       optionally be followed by an equal sign and one of
                       ttrruuee, oonn, yyeess to omit or ffaallssee, ooffff, nnoo to show the
                       non-trailer lines. If option is given without value it
                       is enabled. If given multiple times the last value is
                       used.

                   •   _s_e_p_a_r_a_t_o_r_=_<_S_E_P_>: specify a separator inserted between
                       trailer lines. When this option is not given each
                       trailer line is terminated with a line feed character.
                       The string SEP may contain the literal formatting codes
                       described above. To use comma as separator one must use
                       %%xx22CC as it would otherwise be parsed as next option. If
                       separator option is given multiple times only the last
                       one is used. E.g., %%((ttrraaiilleerrss::kkeeyy==TTiicckkeett,,sseeppaarraattoorr==%%xx22CC
                       )) shows all trailer lines whose key is "Ticket"
                       separated by a comma and a space.

                   •   _u_n_f_o_l_d_[_=_v_a_l_]: make it behave as if interpret-trailer’s
                       ----uunnffoolldd option was given. In same way as to for oonnllyy
                       it can be followed by an equal sign and explicit value.
                       E.g., %%((ttrraaiilleerrss::oonnllyy,,uunnffoolldd==ttrruuee)) unfolds and shows
                       all trailer lines.

                   •   _v_a_l_u_e_o_n_l_y_[_=_v_a_l_]: skip over the key part of the trailer
                       line and only show the value part. Also this optionally
                       allows explicit value.

           NNoottee
           Some placeholders may depend on other options given to the revision
           traversal engine. For example, the %%gg** reflog options will insert
           an empty string unless we are traversing reflog entries (e.g., by
           ggiitt lloogg --gg). The %%dd and %%DD placeholders will use the "short"
           decoration format if ----ddeeccoorraattee was not already provided on the
           command line.

       If you add a ++ (plus sign) after _% of a placeholder, a line-feed is
       inserted immediately before the expansion if and only if the
       placeholder expands to a non-empty string.

       If you add a -- (minus sign) after _% of a placeholder, all consecutive
       line-feeds immediately preceding the expansion are deleted if and only
       if the placeholder expands to an empty string.

       If you add a ` ` (space) after _% of a placeholder, a space is inserted
       immediately before the expansion if and only if the placeholder expands
       to a non-empty string.

       •   _t_f_o_r_m_a_t_:

           The _t_f_o_r_m_a_t_: format works exactly like _f_o_r_m_a_t_:, except that it
           provides "terminator" semantics instead of "separator" semantics.
           In other words, each commit has the message terminator character
           (usually a newline) appended, rather than a separator placed
           between entries. This means that the final entry of a single-line
           format will be properly terminated with a new line, just as the
           "oneline" format does. For example:

               $ git log -2 --pretty=format:%h 4da45bef \
                 | perl -pe '$_ .= " -- NO NEWLINE\n" unless /\n/'
               4da45be
               7134973 -- NO NEWLINE

               $ git log -2 --pretty=tformat:%h 4da45bef \
                 | perl -pe '$_ .= " -- NO NEWLINE\n" unless /\n/'
               4da45be
               7134973

           In addition, any unrecognized string that has a %% in it is
           interpreted as if it has ttffoorrmmaatt:: in front of it. For example,
           these two are equivalent:

               $ git log -2 --pretty=tformat:%h 4da45bef
               $ git log -2 --pretty=%h 4da45bef

CCOOMMMMOONN DDIIFFFF OOPPTTIIOONNSS
       -p, -u, --patch
           Generate patch (see section on generating patches).

       -s, --no-patch
           Suppress diff output. Useful for commands like ggiitt sshhooww that show
           the patch by default, or to cancel the effect of ----ppaattcchh.

       -U<n>, --unified=<n>
           Generate diffs with <n> lines of context instead of the usual
           three. Implies ----ppaattcchh. Implies --pp.

       --output=<file>
           Output to a specific file instead of stdout.

       --output-indicator-new=<char>, --output-indicator-old=<char>,
       --output-indicator-context=<char>
           Specify the character used to indicate new, old or context lines in
           the generated patch. Normally they are _+, _- and ' ' respectively.

       --raw
           For each commit, show a summary of changes using the raw diff
           format. See the "RAW OUTPUT FORMAT" section of ggiitt--ddiiffff(1). This is
           different from showing the log itself in raw format, which you can
           achieve with ----ffoorrmmaatt==rraaww.

       --patch-with-raw
           Synonym for --pp ----rraaww.

       --indent-heuristic
           Enable the heuristic that shifts diff hunk boundaries to make
           patches easier to read. This is the default.

       --no-indent-heuristic
           Disable the indent heuristic.

       --minimal
           Spend extra time to make sure the smallest possible diff is
           produced.

       --patience
           Generate a diff using the "patience diff" algorithm.

       --histogram
           Generate a diff using the "histogram diff" algorithm.

       --anchored=<text>
           Generate a diff using the "anchored diff" algorithm.

           This option may be specified more than once.

           If a line exists in both the source and destination, exists only
           once, and starts with this text, this algorithm attempts to prevent
           it from appearing as a deletion or addition in the output. It uses
           the "patience diff" algorithm internally.

       --diff-algorithm={patience|minimal|histogram|myers}
           Choose a diff algorithm. The variants are as follows:

           ddeeffaauulltt, mmyyeerrss
               The basic greedy diff algorithm. Currently, this is the
               default.

           mmiinniimmaall
               Spend extra time to make sure the smallest possible diff is
               produced.

           ppaattiieennccee
               Use "patience diff" algorithm when generating patches.

           hhiissttooggrraamm
               This algorithm extends the patience algorithm to "support
               low-occurrence common elements".

           For instance, if you configured the ddiiffff..aallggoorriitthhmm variable to a
           non-default value and want to use the default one, then you have to
           use ----ddiiffff--aallggoorriitthhmm==ddeeffaauulltt option.

       --stat[=<width>[,<name-width>[,<count>]]]
           Generate a diffstat. By default, as much space as necessary will be
           used for the filename part, and the rest for the graph part.
           Maximum width defaults to terminal width, or 80 columns if not
           connected to a terminal, and can be overridden by <<wwiiddtthh>>. The
           width of the filename part can be limited by giving another width
           <<nnaammee--wwiiddtthh>> after a comma. The width of the graph part can be
           limited by using ----ssttaatt--ggrraapphh--wwiiddtthh==<<wwiiddtthh>> (affects all commands
           generating a stat graph) or by setting ddiiffff..ssttaattGGrraapphhWWiiddtthh==<<wwiiddtthh>>
           (does not affect ggiitt ffoorrmmaatt--ppaattcchh). By giving a third parameter
           <<ccoouunntt>>, you can limit the output to the first <<ccoouunntt>> lines,
           followed by ......  if there are more.

           These parameters can also be set individually with
           ----ssttaatt--wwiiddtthh==<<wwiiddtthh>>, ----ssttaatt--nnaammee--wwiiddtthh==<<nnaammee--wwiiddtthh>> and
           ----ssttaatt--ccoouunntt==<<ccoouunntt>>.

       --compact-summary
           Output a condensed summary of extended header information such as
           file creations or deletions ("new" or "gone", optionally "+l" if
           it’s a symlink) and mode changes ("+x" or "-x" for adding or
           removing executable bit respectively) in diffstat. The information
           is put between the filename part and the graph part. Implies
           ----ssttaatt.

       --numstat
           Similar to ----ssttaatt, but shows number of added and deleted lines in
           decimal notation and pathname without abbreviation, to make it more
           machine friendly. For binary files, outputs two -- instead of saying
           00 00.

       --shortstat
           Output only the last line of the ----ssttaatt format containing total
           number of modified files, as well as number of added and deleted
           lines.

       -X[<param1,param2,...>], --dirstat[=<param1,param2,...>]
           Output the distribution of relative amount of changes for each
           sub-directory. The behavior of ----ddiirrssttaatt can be customized by
           passing it a comma separated list of parameters. The defaults are
           controlled by the ddiiffff..ddiirrssttaatt configuration variable (see ggiitt--
           ccoonnffiigg(1)). The following parameters are available:

           cchhaannggeess
               Compute the dirstat numbers by counting the lines that have
               been removed from the source, or added to the destination. This
               ignores the amount of pure code movements within a file. In
               other words, rearranging lines in a file is not counted as much
               as other changes. This is the default behavior when no
               parameter is given.

           lliinneess
               Compute the dirstat numbers by doing the regular line-based
               diff analysis, and summing the removed/added line counts. (For
               binary files, count 64-byte chunks instead, since binary files
               have no natural concept of lines). This is a more expensive
               ----ddiirrssttaatt behavior than the cchhaannggeess behavior, but it does count
               rearranged lines within a file as much as other changes. The
               resulting output is consistent with what you get from the other
               ----**ssttaatt options.

           ffiilleess
               Compute the dirstat numbers by counting the number of files
               changed. Each changed file counts equally in the dirstat
               analysis. This is the computationally cheapest ----ddiirrssttaatt
               behavior, since it does not have to look at the file contents
               at all.

           ccuummuullaattiivvee
               Count changes in a child directory for the parent directory as
               well. Note that when using ccuummuullaattiivvee, the sum of the
               percentages reported may exceed 100%. The default
               (non-cumulative) behavior can be specified with the
               nnoonnccuummuullaattiivvee parameter.

           <limit>
               An integer parameter specifies a cut-off percent (3% by
               default). Directories contributing less than this percentage of
               the changes are not shown in the output.

           Example: The following will count changed files, while ignoring
           directories with less than 10% of the total amount of changed
           files, and accumulating child directory counts in the parent
           directories: ----ddiirrssttaatt==ffiilleess,,1100,,ccuummuullaattiivvee.

       --cumulative
           Synonym for --dirstat=cumulative

       --dirstat-by-file[=<param1,param2>...]
           Synonym for --dirstat=files,param1,param2...

       --summary
           Output a condensed summary of extended header information such as
           creations, renames and mode changes.

       --patch-with-stat
           Synonym for --pp ----ssttaatt.

       -z
           Separate the commits with NULs instead of with new newlines.

           Also, when ----rraaww or ----nnuummssttaatt has been given, do not munge
           pathnames and use NULs as output field terminators.

           Without this option, pathnames with "unusual" characters are quoted
           as explained for the configuration variable ccoorree..qquuootteePPaatthh (see
           ggiitt--ccoonnffiigg(1)).

       --name-only
           Show only names of changed files.

       --name-status
           Show only names and status of changed files. See the description of
           the ----ddiiffff--ffiilltteerr option on what the status letters mean.

       --submodule[=<format>]
           Specify how differences in submodules are shown. When specifying
           ----ssuubbmmoodduullee==sshhoorrtt the _s_h_o_r_t format is used. This format just shows
           the names of the commits at the beginning and end of the range.
           When ----ssuubbmmoodduullee or ----ssuubbmmoodduullee==lloogg is specified, the _l_o_g format is
           used. This format lists the commits in the range like ggiitt--
           ssuubbmmoodduullee(1) ssuummmmaarryy does. When ----ssuubbmmoodduullee==ddiiffff is specified, the
           _d_i_f_f format is used. This format shows an inline diff of the
           changes in the submodule contents between the commit range.
           Defaults to ddiiffff..ssuubbmmoodduullee or the _s_h_o_r_t format if the config option
           is unset.

       --color[=<when>]
           Show colored diff.  ----ccoolloorr (i.e. without _=_<_w_h_e_n_>) is the same as
           ----ccoolloorr==aallwwaayyss.  _<_w_h_e_n_> can be one of aallwwaayyss, nneevveerr, or aauuttoo.

       --no-color
           Turn off colored diff. It is the same as ----ccoolloorr==nneevveerr.

       --color-moved[=<mode>]
           Moved lines of code are colored differently. The <mode> defaults to
           _n_o if the option is not given and to _z_e_b_r_a if the option with no
           mode is given. The mode must be one of:

           no
               Moved lines are not highlighted.

           default
               Is a synonym for zzeebbrraa. This may change to a more sensible mode
               in the future.

           plain
               Any line that is added in one location and was removed in
               another location will be colored with _c_o_l_o_r_._d_i_f_f_._n_e_w_M_o_v_e_d.
               Similarly _c_o_l_o_r_._d_i_f_f_._o_l_d_M_o_v_e_d will be used for removed lines
               that are added somewhere else in the diff. This mode picks up
               any moved line, but it is not very useful in a review to
               determine if a block of code was moved without permutation.

           blocks
               Blocks of moved text of at least 20 alphanumeric characters are
               detected greedily. The detected blocks are painted using either
               the _c_o_l_o_r_._d_i_f_f_._{_o_l_d_,_n_e_w_}_M_o_v_e_d color. Adjacent blocks cannot be
               told apart.

           zebra
               Blocks of moved text are detected as in _b_l_o_c_k_s mode. The blocks
               are painted using either the _c_o_l_o_r_._d_i_f_f_._{_o_l_d_,_n_e_w_}_M_o_v_e_d color or
               _c_o_l_o_r_._d_i_f_f_._{_o_l_d_,_n_e_w_}_M_o_v_e_d_A_l_t_e_r_n_a_t_i_v_e. The change between the
               two colors indicates that a new block was detected.

           dimmed-zebra
               Similar to _z_e_b_r_a, but additional dimming of uninteresting parts
               of moved code is performed. The bordering lines of two adjacent
               blocks are considered interesting, the rest is uninteresting.
               ddiimmmmeedd__zzeebbrraa is a deprecated synonym.

       --no-color-moved
           Turn off move detection. This can be used to override configuration
           settings. It is the same as ----ccoolloorr--mmoovveedd==nnoo.

       --color-moved-ws=<modes>
           This configures how whitespace is ignored when performing the move
           detection for ----ccoolloorr--mmoovveedd. These modes can be given as a comma
           separated list:

           no
               Do not ignore whitespace when performing move detection.

           ignore-space-at-eol
               Ignore changes in whitespace at EOL.

           ignore-space-change
               Ignore changes in amount of whitespace. This ignores whitespace
               at line end, and considers all other sequences of one or more
               whitespace characters to be equivalent.

           ignore-all-space
               Ignore whitespace when comparing lines. This ignores
               differences even if one line has whitespace where the other
               line has none.

           allow-indentation-change
               Initially ignore any whitespace in the move detection, then
               group the moved code blocks only into a block if the change in
               whitespace is the same per line. This is incompatible with the
               other modes.

       --no-color-moved-ws
           Do not ignore whitespace when performing move detection. This can
           be used to override configuration settings. It is the same as
           ----ccoolloorr--mmoovveedd--wwss==nnoo.

       --word-diff[=<mode>]
           Show a word diff, using the <mode> to delimit changed words. By
           default, words are delimited by whitespace; see ----wwoorrdd--ddiiffff--rreeggeexx
           below. The <mode> defaults to _p_l_a_i_n, and must be one of:

           color
               Highlight changed words using only colors. Implies ----ccoolloorr.

           plain
               Show words as [[--rreemmoovveedd--]] and {{++aaddddeedd++}}. Makes no attempts to
               escape the delimiters if they appear in the input, so the
               output may be ambiguous.

           porcelain
               Use a special line-based format intended for script
               consumption. Added/removed/unchanged runs are printed in the
               usual unified diff format, starting with a ++/--/` ` character at
               the beginning of the line and extending to the end of the line.
               Newlines in the input are represented by a tilde ~~ on a line of
               its own.

           none
               Disable word diff again.

           Note that despite the name of the first mode, color is used to
           highlight the changed parts in all modes if enabled.

       --word-diff-regex=<regex>
           Use <regex> to decide what a word is, instead of considering runs
           of non-whitespace to be a word. Also implies ----wwoorrdd--ddiiffff unless it
           was already enabled.

           Every non-overlapping match of the <regex> is considered a word.
           Anything between these matches is considered whitespace and
           ignored(!) for the purposes of finding differences. You may want to
           append ||[[^^[[::ssppaaccee::]]]] to your regular expression to make sure that
           it matches all non-whitespace characters. A match that contains a
           newline is silently truncated(!) at the newline.

           For example, ----wwoorrdd--ddiiffff--rreeggeexx==..  will treat each character as a
           word and, correspondingly, show differences character by character.

           The regex can also be set via a diff driver or configuration
           option, see ggiittaattttrriibbuutteess(5) or ggiitt--ccoonnffiigg(1). Giving it explicitly
           overrides any diff driver or configuration setting. Diff drivers
           override configuration settings.

       --color-words[=<regex>]
           Equivalent to ----wwoorrdd--ddiiffff==ccoolloorr plus (if a regex was specified)
           ----wwoorrdd--ddiiffff--rreeggeexx==<<rreeggeexx>>.

       --no-renames
           Turn off rename detection, even when the configuration file gives
           the default to do so.

       --[no-]rename-empty
           Whether to use empty blobs as rename source.

       --check
           Warn if changes introduce conflict markers or whitespace errors.
           What are considered whitespace errors is controlled by
           ccoorree..wwhhiitteessppaaccee configuration. By default, trailing whitespaces
           (including lines that consist solely of whitespaces) and a space
           character that is immediately followed by a tab character inside
           the initial indent of the line are considered whitespace errors.
           Exits with non-zero status if problems are found. Not compatible
           with --exit-code.

       --ws-error-highlight=<kind>
           Highlight whitespace errors in the ccoonntteexxtt, oolldd or nneeww lines of the
           diff. Multiple values are separated by comma, nnoonnee resets previous
           values, ddeeffaauulltt reset the list to nneeww and aallll is a shorthand for
           oolldd,,nneeww,,ccoonntteexxtt. When this option is not given, and the
           configuration variable ddiiffff..wwssEErrrroorrHHiigghhlliigghhtt is not set, only
           whitespace errors in nneeww lines are highlighted. The whitespace
           errors are colored with ccoolloorr..ddiiffff..wwhhiitteessppaaccee.

       --full-index
           Instead of the first handful of characters, show the full pre- and
           post-image blob object names on the "index" line when generating
           patch format output.

       --binary
           In addition to ----ffuullll--iinnddeexx, output a binary diff that can be
           applied with ggiitt--aappppllyy. Implies ----ppaattcchh.

       --abbrev[=<n>]
           Instead of showing the full 40-byte hexadecimal object name in
           diff-raw format output and diff-tree header lines, show only a
           partial prefix. This is independent of the ----ffuullll--iinnddeexx option
           above, which controls the diff-patch output format. Non default
           number of digits can be specified with ----aabbbbrreevv==<<nn>>.

       -B[<n>][/<m>], --break-rewrites[=[<n>][/<m>]]
           Break complete rewrite changes into pairs of delete and create.
           This serves two purposes:

           It affects the way a change that amounts to a total rewrite of a
           file not as a series of deletion and insertion mixed together with
           a very few lines that happen to match textually as the context, but
           as a single deletion of everything old followed by a single
           insertion of everything new, and the number mm controls this aspect
           of the -B option (defaults to 60%).  --BB//7700%% specifies that less
           than 30% of the original should remain in the result for Git to
           consider it a total rewrite (i.e. otherwise the resulting patch
           will be a series of deletion and insertion mixed together with
           context lines).

           When used with -M, a totally-rewritten file is also considered as
           the source of a rename (usually -M only considers a file that
           disappeared as the source of a rename), and the number nn controls
           this aspect of the -B option (defaults to 50%).  --BB2200%% specifies
           that a change with addition and deletion compared to 20% or more of
           the file’s size are eligible for being picked up as a possible
           source of a rename to another file.

       -M[<n>], --find-renames[=<n>]
           If generating diffs, detect and report renames for each commit. For
           following files across renames while traversing history, see
           ----ffoollllooww. If nn is specified, it is a threshold on the similarity
           index (i.e. amount of addition/deletions compared to the file’s
           size). For example, --MM9900%% means Git should consider a delete/add
           pair to be a rename if more than 90% of the file hasn’t changed.
           Without a %% sign, the number is to be read as a fraction, with a
           decimal point before it. I.e., --MM55 becomes 0.5, and is thus the
           same as --MM5500%%. Similarly, --MM0055 is the same as --MM55%%. To limit
           detection to exact renames, use --MM110000%%. The default similarity
           index is 50%.

       -C[<n>], --find-copies[=<n>]
           Detect copies as well as renames. See also ----ffiinndd--ccooppiieess--hhaarrddeerr. If
           nn is specified, it has the same meaning as for --MM<<nn>>.

       --find-copies-harder
           For performance reasons, by default, --CC option finds copies only if
           the original file of the copy was modified in the same changeset.
           This flag makes the command inspect unmodified files as candidates
           for the source of copy. This is a very expensive operation for
           large projects, so use it with caution. Giving more than one --CC
           option has the same effect.

       -D, --irreversible-delete
           Omit the preimage for deletes, i.e. print only the header but not
           the diff between the preimage and //ddeevv//nnuullll. The resulting patch is
           not meant to be applied with ppaattcchh or ggiitt aappppllyy; this is solely for
           people who want to just concentrate on reviewing the text after the
           change. In addition, the output obviously lacks enough information
           to apply such a patch in reverse, even manually, hence the name of
           the option.

           When used together with --BB, omit also the preimage in the deletion
           part of a delete/create pair.

       -l<num>
           The --MM and --CC options require O(n^2) processing time where n is the
           number of potential rename/copy targets. This option prevents
           rename/copy detection from running if the number of rename/copy
           targets exceeds the specified number.

       --diff-filter=[(A|C|D|M|R|T|U|X|B)...[*]]
           Select only files that are Added (AA), Copied (CC), Deleted (DD),
           Modified (MM), Renamed (RR), have their type (i.e. regular file,
           symlink, submodule, ...) changed (TT), are Unmerged (UU), are Unknown
           (XX), or have had their pairing Broken (BB). Any combination of the
           filter characters (including none) can be used. When **
           (All-or-none) is added to the combination, all paths are selected
           if there is any file that matches other criteria in the comparison;
           if there is no file that matches other criteria, nothing is
           selected.

           Also, these upper-case letters can be downcased to exclude. E.g.
           ----ddiiffff--ffiilltteerr==aadd excludes added and deleted paths.

           Note that not all diffs can feature all types. For instance, diffs
           from the index to the working tree can never have Added entries
           (because the set of paths included in the diff is limited by what
           is in the index). Similarly, copied and renamed entries cannot
           appear if detection for those types is disabled.

       -S<string>
           Look for differences that change the number of occurrences of the
           specified string (i.e. addition/deletion) in a file. Intended for
           the scripter’s use.

           It is useful when you’re looking for an exact block of code (like a
           struct), and want to know the history of that block since it first
           came into being: use the feature iteratively to feed the
           interesting block in the preimage back into --SS, and keep going
           until you get the very first version of the block.

           Binary files are searched as well.

       -G<regex>
           Look for differences whose patch text contains added/removed lines
           that match <regex>.

           To illustrate the difference between --SS<<rreeggeexx>> ----ppiicckkaaxxee--rreeggeexx and
           --GG<<rreeggeexx>>, consider a commit with the following diff in the same
           file:

               +    return frotz(nitfol, two->ptr, 1, 0);
               ...
               -    hit = frotz(nitfol, mf2.ptr, 1, 0);

           While ggiitt lloogg --GG""ffrroottzz\\((nniittffooll"" will show this commit, ggiitt lloogg
           --SS""ffrroottzz\\((nniittffooll"" ----ppiicckkaaxxee--rreeggeexx will not (because the number of
           occurrences of that string did not change).

           Unless ----tteexxtt is supplied patches of binary files without a
           textconv filter will be ignored.

           See the _p_i_c_k_a_x_e entry in ggiittddiiffffccoorree(7) for more information.

       --find-object=<object-id>
           Look for differences that change the number of occurrences of the
           specified object. Similar to --SS, just the argument is different in
           that it doesn’t search for a specific string but for a specific
           object id.

           The object can be a blob or a submodule commit. It implies the --tt
           option in ggiitt--lloogg to also find trees.

       --pickaxe-all
           When --SS or --GG finds a change, show all the changes in that
           changeset, not just the files that contain the change in <string>.

       --pickaxe-regex
           Treat the <string> given to --SS as an extended POSIX regular
           expression to match.

       -O<orderfile>
           Control the order in which files appear in the output. This
           overrides the ddiiffff..oorrddeerrFFiillee configuration variable (see ggiitt--
           ccoonnffiigg(1)). To cancel ddiiffff..oorrddeerrFFiillee, use --OO//ddeevv//nnuullll.

           The output order is determined by the order of glob patterns in
           <orderfile>. All files with pathnames that match the first pattern
           are output first, all files with pathnames that match the second
           pattern (but not the first) are output next, and so on. All files
           with pathnames that do not match any pattern are output last, as if
           there was an implicit match-all pattern at the end of the file. If
           multiple pathnames have the same rank (they match the same pattern
           but no earlier patterns), their output order relative to each other
           is the normal order.

           <orderfile> is parsed as follows:

           •   Blank lines are ignored, so they can be used as separators for
               readability.

           •   Lines starting with a hash ("##") are ignored, so they can be
               used for comments. Add a backslash ("\\") to the beginning of
               the pattern if it starts with a hash.

           •   Each other line contains a single pattern.

           Patterns have the same syntax and semantics as patterns used for
           fnmatch(3) without the FNM_PATHNAME flag, except a pathname also
           matches a pattern if removing any number of the final pathname
           components matches the pattern. For example, the pattern "ffoooo**bbaarr"
           matches "ffooooaassddffbbaarr" and "ffoooo//bbaarr//bbaazz//aassddff" but not "ffoooobbaarrxx".

       -R
           Swap two inputs; that is, show differences from index or on-disk
           file to tree contents.

       --relative[=<path>]
           When run from a subdirectory of the project, it can be told to
           exclude changes outside the directory and show pathnames relative
           to it with this option. When you are not in a subdirectory (e.g. in
           a bare repository), you can name which subdirectory to make the
           output relative to by giving a <path> as an argument.

       -a, --text
           Treat all files as text.

       --ignore-cr-at-eol
           Ignore carriage-return at the end of line when doing a comparison.

       --ignore-space-at-eol
           Ignore changes in whitespace at EOL.

       -b, --ignore-space-change
           Ignore changes in amount of whitespace. This ignores whitespace at
           line end, and considers all other sequences of one or more
           whitespace characters to be equivalent.

       -w, --ignore-all-space
           Ignore whitespace when comparing lines. This ignores differences
           even if one line has whitespace where the other line has none.

       --ignore-blank-lines
           Ignore changes whose lines are all blank.

       --inter-hunk-context=<lines>
           Show the context between diff hunks, up to the specified number of
           lines, thereby fusing hunks that are close to each other. Defaults
           to ddiiffff..iinntteerrHHuunnkkCCoonntteexxtt or 0 if the config option is unset.

       -W, --function-context
           Show whole surrounding functions of changes.

       --ext-diff
           Allow an external diff helper to be executed. If you set an
           external diff driver with ggiittaattttrriibbuutteess(5), you need to use this
           option with ggiitt--lloogg(1) and friends.

       --no-ext-diff
           Disallow external diff drivers.

       --textconv, --no-textconv
           Allow (or disallow) external text conversion filters to be run when
           comparing binary files. See ggiittaattttrriibbuutteess(5) for details. Because
           textconv filters are typically a one-way conversion, the resulting
           diff is suitable for human consumption, but cannot be applied. For
           this reason, textconv filters are enabled by default only for ggiitt--
           ddiiffff(1) and ggiitt--lloogg(1), but not for ggiitt--ffoorrmmaatt--ppaattcchh(1) or diff
           plumbing commands.

       --ignore-submodules[=<when>]
           Ignore changes to submodules in the diff generation. <when> can be
           either "none", "untracked", "dirty" or "all", which is the default.
           Using "none" will consider the submodule modified when it either
           contains untracked or modified files or its HEAD differs from the
           commit recorded in the superproject and can be used to override any
           settings of the _i_g_n_o_r_e option in ggiitt--ccoonnffiigg(1) or ggiittmmoodduulleess(5).
           When "untracked" is used submodules are not considered dirty when
           they only contain untracked content (but they are still scanned for
           modified content). Using "dirty" ignores all changes to the work
           tree of submodules, only changes to the commits stored in the
           superproject are shown (this was the behavior until 1.7.0). Using
           "all" hides all changes to submodules.

       --src-prefix=<prefix>
           Show the given source prefix instead of "a/".

       --dst-prefix=<prefix>
           Show the given destination prefix instead of "b/".

       --no-prefix
           Do not show any source or destination prefix.

       --line-prefix=<prefix>
           Prepend an additional prefix to every line of output.

       --ita-invisible-in-index
           By default entries added by "git add -N" appear as an existing
           empty file in "git diff" and a new file in "git diff --cached".
           This option makes the entry appear as a new file in "git diff" and
           non-existent in "git diff --cached". This option could be reverted
           with ----iittaa--vviissiibbllee--iinn--iinnddeexx. Both options are experimental and
           could be removed in future.

       For more detailed explanation on these common options, see also
       ggiittddiiffffccoorree(7).

GGEENNEERRAATTIINNGG PPAATTCCHH TTEEXXTT WWIITTHH --PP
       Running ggiitt--ddiiffff(1), ggiitt--lloogg(1), ggiitt--sshhooww(1), ggiitt--ddiiffff--iinnddeexx(1), ggiitt--
       ddiiffff--ttrreeee(1), or ggiitt--ddiiffff--ffiilleess(1) with the --pp option produces patch
       text. You can customize the creation of patch text via the
       GGIITT__EEXXTTEERRNNAALL__DDIIFFFF and the GGIITT__DDIIFFFF__OOPPTTSS environment variables.

       What the -p option produces is slightly different from the traditional
       diff format:

        1. It is preceded with a "git diff" header that looks like this:

               diff --git a/file1 b/file2

           The aa// and bb// filenames are the same unless rename/copy is
           involved. Especially, even for a creation or a deletion, //ddeevv//nnuullll
           is _n_o_t used in place of the aa// or bb// filenames.

           When rename/copy is involved, ffiillee11 and ffiillee22 show the name of the
           source file of the rename/copy and the name of the file that
           rename/copy produces, respectively.

        2. It is followed by one or more extended header lines:

               old mode <mode>
               new mode <mode>
               deleted file mode <mode>
               new file mode <mode>
               copy from <path>
               copy to <path>
               rename from <path>
               rename to <path>
               similarity index <number>
               dissimilarity index <number>
               index <hash>..<hash> <mode>

           File modes are printed as 6-digit octal numbers including the file
           type and file permission bits.

           Path names in extended headers do not include the aa// and bb//
           prefixes.

           The similarity index is the percentage of unchanged lines, and the
           dissimilarity index is the percentage of changed lines. It is a
           rounded down integer, followed by a percent sign. The similarity
           index value of 100% is thus reserved for two equal files, while
           100% dissimilarity means that no line from the old file made it
           into the new one.

           The index line includes the blob object names before and after the
           change. The <mode> is included if the file mode does not change;
           otherwise, separate lines indicate the old and the new mode.

        3. Pathnames with "unusual" characters are quoted as explained for the
           configuration variable ccoorree..qquuootteePPaatthh (see ggiitt--ccoonnffiigg(1)).

        4. All the ffiillee11 files in the output refer to files before the commit,
           and all the ffiillee22 files refer to files after the commit. It is
           incorrect to apply each change to each file sequentially. For
           example, this patch will swap a and b:

               diff --git a/a b/b
               rename from a
               rename to b
               diff --git a/b b/a
               rename from b
               rename to a

CCOOMMBBIINNEEDD DDIIFFFF FFOORRMMAATT
       Any diff-generating command can take the --cc or ----cccc option to produce a
       _c_o_m_b_i_n_e_d _d_i_f_f when showing a merge. This is the default format when
       showing merges with ggiitt--ddiiffff(1) or ggiitt--sshhooww(1). Note also that you can
       give the --mm option to any of these commands to force generation of
       diffs with individual parents of a merge.

       A "combined diff" format looks like this:

           diff --combined describe.c
           index fabadb8,cc95eb0..4866510
           --- a/describe.c
           +++ b/describe.c
           @@@ -98,20 -98,12 +98,20 @@@
                   return (a_date > b_date) ? -1 : (a_date == b_date) ? 0 : 1;
             }

           - static void describe(char *arg)
            -static void describe(struct commit *cmit, int last_one)
           ++static void describe(char *arg, int last_one)
             {
            +      unsigned char sha1[20];
            +      struct commit *cmit;
                   struct commit_list *list;
                   static int initialized = 0;
                   struct commit_name *n;

            +      if (get_sha1(arg, sha1) < 0)
            +              usage(describe_usage);
            +      cmit = lookup_commit_reference(sha1);
            +      if (!cmit)
            +              usage(describe_usage);
            +
                   if (!initialized) {
                           initialized = 1;
                           for_each_ref(get_name);

        1. It is preceded with a "git diff" header, that looks like this (when
           the --cc option is used):

               diff --combined file

           or like this (when the ----cccc option is used):

               diff --cc file

        2. It is followed by one or more extended header lines (this example
           shows a merge with two parents):

               index <hash>,<hash>..<hash>
               mode <mode>,<mode>..<mode>
               new file mode <mode>
               deleted file mode <mode>,<mode>

           The mmooddee <<mmooddee>>,,<<mmooddee>>....<<mmooddee>> line appears only if at least one of
           the <mode> is different from the rest. Extended headers with
           information about detected contents movement (renames and copying
           detection) are designed to work with diff of two <tree-ish> and are
           not used by combined diff format.

        3. It is followed by two-line from-file/to-file header

               --- a/file
               +++ b/file

           Similar to two-line header for traditional _u_n_i_f_i_e_d diff format,
           //ddeevv//nnuullll is used to signal created or deleted files.

           However, if the --combined-all-paths option is provided, instead of
           a two-line from-file/to-file you get a N+1 line from-file/to-file
           header, where N is the number of parents in the merge commit

               --- a/file
               --- a/file
               --- a/file
               +++ b/file

           This extended format can be useful if rename or copy detection is
           active, to allow you to see the original name of the file in
           different parents.

        4. Chunk header format is modified to prevent people from accidentally
           feeding it to ppaattcchh --pp11. Combined diff format was created for
           review of merge commit changes, and was not meant to be applied.
           The change is similar to the change in the extended _i_n_d_e_x header:

               @@@ <from-file-range> <from-file-range> <to-file-range> @@@

           There are (number of parents + 1) @@ characters in the chunk header
           for combined diff format.

       Unlike the traditional _u_n_i_f_i_e_d diff format, which shows two files A and
       B with a single column that has -- (minus — appears in A but removed in
       B), ++ (plus — missing in A but added to B), or "" "" (space — unchanged)
       prefix, this format compares two or more files file1, file2,... with
       one file X, and shows how X differs from each of fileN. One column for
       each of fileN is prepended to the output line to note how X’s line is
       different from it.

       A -- character in the column N means that the line appears in fileN but
       it does not appear in the result. A ++ character in the column N means
       that the line appears in the result, and fileN does not have that line
       (in other words, the line was added, from the point of view of that
       parent).

       In the above example output, the function signature was changed from
       both files (hence two -- removals from both file1 and file2, plus ++++ to
       mean one line that was added does not appear in either file1 or file2).
       Also eight other lines are the same from file1 but do not appear in
       file2 (hence prefixed with ++).

       When shown by ggiitt ddiiffff--ttrreeee --cc, it compares the parents of a merge
       commit with the merge result (i.e. file1..fileN are the parents). When
       shown by ggiitt ddiiffff--ffiilleess --cc, it compares the two unresolved merge
       parents with the working tree file (i.e. file1 is stage 2 aka "our
       version", file2 is stage 3 aka "their version").

EEXXAAMMPPLLEESS
       ggiitt lloogg ----nnoo--mmeerrggeess
           Show the whole commit history, but skip any merges

       ggiitt lloogg vv22..66..1122.... iinncclluuddee//ssccssii ddrriivveerrss//ssccssii
           Show all commits since version _v_2_._6_._1_2 that changed any file in the
           iinncclluuddee//ssccssii or ddrriivveerrss//ssccssii subdirectories

       ggiitt lloogg ----ssiinnccee==""22 wweeeekkss aaggoo"" ---- ggiittkk
           Show the changes during the last two weeks to the file _g_i_t_k. The ----
           is necessary to avoid confusion with the bbrraanncchh named _g_i_t_k

       ggiitt lloogg ----nnaammee--ssttaattuuss rreelleeaassee....tteesstt
           Show the commits that are in the "test" branch but not yet in the
           "release" branch, along with the list of paths each commit
           modifies.

       ggiitt lloogg ----ffoollllooww bbuuiillttiinn//rreevv--lliisstt..cc
           Shows the commits that changed bbuuiillttiinn//rreevv--lliisstt..cc, including those
           commits that occurred before the file was given its present name.

       ggiitt lloogg ----bbrraanncchheess ----nnoott ----rreemmootteess==oorriiggiinn
           Shows all commits that are in any of local branches but not in any
           of remote-tracking branches for _o_r_i_g_i_n (what you have that origin
           doesn’t).

       ggiitt lloogg mmaasstteerr ----nnoott ----rreemmootteess==**//mmaasstteerr
           Shows all commits that are in local master but not in any remote
           repository master branches.

       ggiitt lloogg --pp --mm ----ffiirrsstt--ppaarreenntt
           Shows the history including change diffs, but only from the “main
           branch” perspective, skipping commits that come from merged
           branches, and showing full diffs of changes introduced by the
           merges. This makes sense only when following a strict policy of
           merging all topic branches when staying on a single integration
           branch.

       ggiitt lloogg --LL ''//iinntt mmaaiinn//'',,//^^}}//::mmaaiinn..cc
           Shows how the function mmaaiinn(()) in the file mmaaiinn..cc evolved over time.

       ggiitt lloogg --33
           Limits the number of commits to show to 3.

DDIISSCCUUSSSSIIOONN
       Git is to some extent character encoding agnostic.

       •   The contents of the blob objects are uninterpreted sequences of
           bytes. There is no encoding translation at the core level.

       •   Path names are encoded in UTF-8 normalization form C. This applies
           to tree objects, the index file, ref names, as well as path names
           in command line arguments, environment variables and config files
           (..ggiitt//ccoonnffiigg (see ggiitt--ccoonnffiigg(1)), ggiittiiggnnoorree(5), ggiittaattttrriibbuutteess(5)
           and ggiittmmoodduulleess(5)).

           Note that Git at the core level treats path names simply as
           sequences of non-NUL bytes, there are no path name encoding
           conversions (except on Mac and Windows). Therefore, using non-ASCII
           path names will mostly work even on platforms and file systems that
           use legacy extended ASCII encodings. However, repositories created
           on such systems will not work properly on UTF-8-based systems (e.g.
           Linux, Mac, Windows) and vice versa. Additionally, many Git-based
           tools simply assume path names to be UTF-8 and will fail to display
           other encodings correctly.

       •   Commit log messages are typically encoded in UTF-8, but other
           extended ASCII encodings are also supported. This includes
           ISO-8859-x, CP125x and many others, but _n_o_t UTF-16/32, EBCDIC and
           CJK multi-byte encodings (GBK, Shift-JIS, Big5, EUC-x, CP9xx etc.).

       Although we encourage that the commit log messages are encoded in
       UTF-8, both the core and Git Porcelain are designed not to force UTF-8
       on projects. If all participants of a particular project find it more
       convenient to use legacy encodings, Git does not forbid it. However,
       there are a few things to keep in mind.

        1. _g_i_t _c_o_m_m_i_t and _g_i_t _c_o_m_m_i_t_-_t_r_e_e issues a warning if the commit log
           message given to it does not look like a valid UTF-8 string, unless
           you explicitly say your project uses a legacy encoding. The way to
           say this is to have i18n.commitencoding in ..ggiitt//ccoonnffiigg file, like
           this:

               [i18n]
                       commitEncoding = ISO-8859-1

           Commit objects created with the above setting record the value of
           ii1188nn..ccoommmmiittEEnnccooddiinngg in its eennccooddiinngg header. This is to help other
           people who look at them later. Lack of this header implies that the
           commit log message is encoded in UTF-8.

        2. _g_i_t _l_o_g, _g_i_t _s_h_o_w, _g_i_t _b_l_a_m_e and friends look at the eennccooddiinngg
           header of a commit object, and try to re-code the log message into
           UTF-8 unless otherwise specified. You can specify the desired
           output encoding with ii1188nn..llooggOOuuttppuuttEEnnccooddiinngg in ..ggiitt//ccoonnffiigg file,
           like this:

               [i18n]
                       logOutputEncoding = ISO-8859-1

           If you do not have this configuration variable, the value of
           ii1188nn..ccoommmmiittEEnnccooddiinngg is used instead.

       Note that we deliberately chose not to re-code the commit log message
       when a commit is made to force UTF-8 at the commit object level,
       because re-coding to UTF-8 is not necessarily a reversible operation.

CCOONNFFIIGGUURRAATTIIOONN
       See ggiitt--ccoonnffiigg(1) for core variables and ggiitt--ddiiffff(1) for settings
       related to diff generation.

       format.pretty
           Default for the ----ffoorrmmaatt option. (See _P_r_e_t_t_y _F_o_r_m_a_t_s above.)
           Defaults to mmeeddiiuumm.

       i18n.logOutputEncoding
           Encoding to use when displaying logs. (See _D_i_s_c_u_s_s_i_o_n above.)
           Defaults to the value of ii1188nn..ccoommmmiittEEnnccooddiinngg if set, and UTF-8
           otherwise.

       log.date
           Default format for human-readable dates. (Compare the ----ddaattee
           option.) Defaults to "default", which means to write dates like SSaatt
           MMaayy 88 1199::3355::3344 22001100 --00550000.

           If the format is set to "auto:foo" and the pager is in use, format
           "foo" will be the used for the date format. Otherwise "default"
           will be used.

       log.follow
           If ttrruuee, ggiitt lloogg will act as if the ----ffoollllooww option was used when a
           single <path> is given. This has the same limitations as ----ffoollllooww,
           i.e. it cannot be used to follow multiple files and does not work
           well on non-linear history.

       log.showRoot
           If ffaallssee, ggiitt lloogg and related commands will not treat the initial
           commit as a big creation event. Any root commits in ggiitt lloogg --pp
           output would be shown without a diff attached. The default is ttrruuee.

       log.showSignature
           If ttrruuee, ggiitt lloogg and related commands will act as if the
           ----sshhooww--ssiiggnnaattuurree option was passed to them.

       mailmap.*
           See ggiitt--sshhoorrttlloogg(1).

       notes.displayRef
           Which refs, in addition to the default set by ccoorree..nnootteessRReeff or
           GGIITT__NNOOTTEESS__RREEFF, to read notes from when showing commit messages with
           the lloogg family of commands. See ggiitt--nnootteess(1).

           May be an unabbreviated ref name or a glob and may be specified
           multiple times. A warning will be issued for refs that do not
           exist, but a glob that does not match any refs is silently ignored.

           This setting can be disabled by the ----nnoo--nnootteess option, overridden
           by the GGIITT__NNOOTTEESS__DDIISSPPLLAAYY__RREEFF environment variable, and overridden
           by the ----nnootteess==<<rreeff>> option.

GGIITT
       Part of the ggiitt(1) suite

Git 2.25.1                        03/04/2021                        GIT-LOG(1)
