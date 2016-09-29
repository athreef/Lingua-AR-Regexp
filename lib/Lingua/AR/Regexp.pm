use strict;
use warnings;
package Lingua::AR::Regexp;

# ABSTRACT: Regular Expression character classes for Arabic
# VERSION

use charnames ':full';
use Regexp::CharClasses::Helper;
use Carp;

=pod

=encoding utf8

=head1 NAME

Lingua::AR::Regexp - Regular Expression character classes for Arabic


=head1 SYNOPSIS

    use Lingua::AR::Regexp;
    use utf8;

    $_ = 'جزئ';
    say 'Has a Hamza' if /\P{Lingua::AR::Regexp::IsHamza}/;
    say 'Hamza fixed' if s/(?=\P{Lingua::AR::Regexp::IsSplitting})ئ/ء/;

=head1 DESCRIPTION

=head1 METHODS AND ARGUMENTS

=over 4

=item IsHamza

Check whether character is a Hamza (Including maddas)

=cut

sub IsHamza {
    return Regexp::CharClasses::Helper::fmt(
        'ARABIC HAMZA ABOVE',
        'ARABIC MADDAH ABOVE',
        'ARABIC HAMZA BELOW',
    );
}

=item IsSplitting

Matches characters that break the horizontal stroke of the word.

=cut

sub IsSplitting {
    my $str =  Regexp::CharClasses::Helper::fmt(
        'ARABIC LETTER DAL',
        'ARABIC LETTER THAL',
        'ARABIC LETTER REH',
        'ARABIC LETTER ZAIN',
        'ARABIC LETTER WAW',
        'ARABIC LETTER SEEN',
        'ARABIC LETTER WAW WITH HAMZA ABOVE',
        'ARABIC LETTER ALEF WITH MADDA ABOVE',
        'ARABIC LETTER ALEF WITH HAMZA ABOVE',
        'ARABIC LETTER ALEF WITH HAMZA BELOW',
        'ARABIC LETTER ALEF',
    );
    return $str;
}

    



1;
__END__

=back

=head1 GIT REPOSITORY

L<http://github.com/athreef/Lingua-AR-Regexp>

=head1 SEE ALSO

=head1 AUTHOR

Ahmad Fatoum C<< <athreef@cpan.org> >>, L<http://a3f.at>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 Ahmad Fatoum

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
