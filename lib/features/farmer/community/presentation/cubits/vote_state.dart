enum VoteStatus { neutral, upvoted, downvoted }

class VoteState {
  final int votes;
  final VoteStatus voteStatus;

  VoteState({
    required this.votes,
    required this.voteStatus,
  });

  VoteState copyWith({
    int? votes,
    VoteStatus? voteStatus,
  }) {
    return VoteState(
      votes: votes ?? this.votes,
      voteStatus: voteStatus ?? this.voteStatus,
    );
  }
}
