# askterix
### Another stack exchange clone without credibility or user-base.

Three restful crud models: User, Question, Answer. Two weird little things : QVote, AVote.

I attempted to minimize the database load that voting would normally create. When a user looks
at a Question show page, you want to show the user what they have voted on, and in what way. To do that
you could query the AVote table to get the current user's questions, and then try to find the ones on the page in that smaller list. I suspect this is fairly slow.

I decided to get rid of the id on votes, generate a key by mapping the user id and question/answer id to
hex strings of length 16 (each) and concatenating them, and then index the tables of votes using that key. In that way, you only need to do n simple index queries if there are n voted things on the page, vs
what I think is a lot more work the other way.

But I don't really know if that is how things are. I would have liked to do it two ways and show which
one was good/bad. But, you know, one week is one week.

Also, fake ajax (redirecting back to the same show after doing crud actions on dependent objects) is probably more work than actual ajax, and it certainly is gigantically edge case ridden and hard to manage properly, especially when the before_action and after_action helpers seem to be implemented by an intoxicated marmoset who fell from a great height in infancy.
