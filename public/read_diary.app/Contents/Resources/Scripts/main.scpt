FasdUAS 1.101.10   ��   ��    k             l     ����  O       	  r     
  
 n    
    1    
��
�� 
body  4    �� 
�� 
note  m       �   "�=܉ I n j e c t i o n   d i a r y  o      ���� 0 notecontent noteContent 	 m       �                                                                                      @ alis    ,  Macintosh HD               �l�BD ����	Notes.app                                                      �����l�        ����  
 cu             Applications   /:System:Applications:Notes.app/   	 N o t e s . a p p    M a c i n t o s h   H D  System/Applications/Notes.app   / ��  ��  ��        l     ��������  ��  ��        l     ��  ��    5 / Get the current path (directory) of the script     �   ^   G e t   t h e   c u r r e n t   p a t h   ( d i r e c t o r y )   o f   t h e   s c r i p t      l    ����  O        r        c       !   n     " # " m    ��
�� 
ctnr # l    $���� $ I   �� %��
�� .earsffdralis        afdr %  f    ��  ��  ��   ! m    ��
�� 
alis  o      ���� 0 current_path    m     & &�                                                                                  MACS  alis    @  Macintosh HD               �l�BD ����
Finder.app                                                     �����l�        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��     ' ( ' l     ��������  ��  ��   (  ) * ) l     �� + ,��   + ` Z Define the file path where the note content will be saved (same as the script's location)    , � - - �   D e f i n e   t h e   f i l e   p a t h   w h e r e   t h e   n o t e   c o n t e n t   w i l l   b e   s a v e d   ( s a m e   a s   t h e   s c r i p t ' s   l o c a t i o n ) *  . / . l   & 0���� 0 r    & 1 2 1 b    $ 3 4 3 l   " 5���� 5 c    " 6 7 6 o     ���� 0 current_path   7 m     !��
�� 
ctxt��  ��   4 m   " # 8 8 � 9 9 $ I n j e c t i o n D i a r y . t x t 2 o      ���� 0 filepath filePath��  ��   /  : ; : l     ��������  ��  ��   ;  < = < l     �� > ?��   > * $ Create the file if it doesn't exist    ? � @ @ H   C r e a t e   t h e   f i l e   i f   i t   d o e s n ' t   e x i s t =  A B A l  ' 2 C���� C I  ' 2�� D��
�� .sysoexecTEXT���     TEXT D b   ' . E F E m   ' ( G G � H H  t o u c h   F n   ( - I J I 1   + -��
�� 
strq J n   ( + K L K 1   ) +��
�� 
psxp L o   ( )���� 0 filepath filePath��  ��  ��   B  M N M l     ��������  ��  ��   N  O P O l     �� Q R��   Q ; 5 Open the file for writing (with creation permission)    R � S S j   O p e n   t h e   f i l e   f o r   w r i t i n g   ( w i t h   c r e a t i o n   p e r m i s s i o n ) P  T U T l  3 Z V���� V Q   3 Z W X Y W r   6 H Z [ Z I  6 D�� \ ]
�� .rdwropenshor       file \ 4   6 <�� ^
�� 
file ^ o   : ;���� 0 filepath filePath ] �� _��
�� 
perm _ m   ? @��
�� boovtrue��   [ o      ���� 0 fileref fileRef X R      ������
�� .ascrerr ****      � ****��  ��   Y k   P Z ` `  a b a l  P P�� c d��   c ; 5 If opening the file failed, display an error message    d � e e j   I f   o p e n i n g   t h e   f i l e   f a i l e d ,   d i s p l a y   a n   e r r o r   m e s s a g e b  f g f I  P W�� h��
�� .sysodlogaskr        TEXT h m   P S i i � j j F E r r o r   o p e n i n g   t h e   f i l e   f o r   w r i t i n g .��   g  k�� k L   X Z����  ��  ��  ��   U  l m l l     ��������  ��  ��   m  n o n l     �� p q��   p ) # Write the note content to the file    q � r r F   W r i t e   t h e   n o t e   c o n t e n t   t o   t h e   f i l e o  s t s l  [ � u���� u Q   [ � v w x v k   ^ y y y  z { z I  ^ q�� | }
�� .rdwrwritnull���     **** | o   ^ _���� 0 notecontent noteContent } �� ~ 
�� 
refn ~ o   b e���� 0 fileref fileRef  �� ���
�� 
wrat � m   h k��
�� rdwreof ��   {  ��� � I  r y�� ���
�� .rdwrclosnull���     **** � o   r u���� 0 fileref fileRef��  ��   w R      �� ���
�� .ascrerr ****      � **** � o      ���� 0 errmsg errMsg��   x k   � � � �  � � � I  � ��� ���
�� .sysodlogaskr        TEXT � b   � � � � � m   � � � � � � � . E r r o r   w r i t i n g   t o   f i l e :   � o   � ����� 0 errmsg errMsg��   �  ��� � Q   � � � ��� � I  � ��� ���
�� .rdwrclosnull���     **** � o   � ����� 0 fileref fileRef��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  ��   t  ��� � l     ��������  ��  ��  ��       
�� � � � � �����������   � ����������������
�� .aevtoappnull  �   � ****�� 0 notecontent noteContent�� 0 current_path  �� 0 filepath filePath�� 0 fileref fileRef��  ��  ��   � �� ����� � ���
�� .aevtoappnull  �   � **** � k     � � �   � �   � �  . � �  A � �  T � �  s����  ��  ��   � ���� 0 errmsg errMsg � ! �� ���� &���������� 8�� G��������~�}�|�{�z i�y�x�w�v�u�t�s�r �
�� 
note
�� 
body�� 0 notecontent noteContent
�� .earsffdralis        afdr
�� 
ctnr
�� 
alis�� 0 current_path  
�� 
ctxt�� 0 filepath filePath
�� 
psxp
�� 
strq
�� .sysoexecTEXT���     TEXT
� 
file
�~ 
perm
�} .rdwropenshor       file�| 0 fileref fileRef�{  �z  
�y .sysodlogaskr        TEXT
�x 
refn
�w 
wrat
�v rdwreof �u 
�t .rdwrwritnull���     ****
�s .rdwrclosnull���     ****�r 0 errmsg errMsg�� �� 
*��/�,E�UO� )j �,�&E�UO��&�%E�O���,�,%j O *a �/a el E` W X  a j OhO  �a _ a a a  O_ j W $X  a  �%j O _ j W X  h � � � �1X < d i v > < b > < u > < h 1 >�=܉ < / h 1 > < / u > < / b > < h 1 > I n j e c t i o n   d i a r y < / h 1 > < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 1 6 / 2 5 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > a   s m a l l   d r o p   o f   b l o o d   b e a d i n g   l i k e   a   l i t t l e   r e d   p e a r l   o n   m y   l e g .   m a d e   a   s o n g   t h i s   w e e k   i m   r e a l l y   p r o u d   o f   w i t h   t h e   f i r s t   l y r i c s   i v e   d o n e   a n d   i m   s o o o o   h a p p y .   l i s t e n i n g   t o   o k l o u   x   b l a d e e   w h i l e   s h o o t i n g   u p   f e e l i n g   l i k e   a n   a n g e l i c   p r i n c e s s < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 1 0 / 2 5 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > b a c k   i n   b w i c k !   w e n t   t o   a   ( p o t e n t i a l l y   h i s   l a s t )   b a b y   m o r o c c o   c o n c e r t   l a s t   n i g h t   a n d   o n e   h e   k i s s e d   m y   h a n d   o n   s t a g e   a n d   t w o   i   g o t   a   p h o t o   w i t h   h i m   a f t e r   s o   e c s t a t i c < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 2 / 2 5 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > l o t s   o f   f i r s t   h e r e   b u t   f i r s t   s h o t   o f   2 0 2 5   ( h e r e ' s   t o   m a n y   m o r e )   a n d   a l s o   i   t h i n k   t h i s   i s   m y   f i r s t   i n t e r n a t i o n a l   s h o t   i   a m   c u r r e n t l y   i n   w i l l e m s t a d   c u r a c a o   s i t t i n g   a b o v e   t h e   b e a c h   i   t r i e d   t o   t a k e   a   p h o t o   o f   m y   s h o t   b u t   i t   w a s   u n f e a s i b l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 2 7 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > i n   e v i l   t e x a s   a g a i n   f o r   c h r i s t m a s   b u t   s e e i n g   l o v e d   o n e s < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 1 9 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > H A D   S E X   T W I C E   t h i s   w e e k   l o l   0 _ o < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 1 2 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > f o r t s   s h o t   i n   n y y y y < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 5 < / d i v > 
 < d i v > m i d   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 3 0 < / d i v > 
 < d i v > m i d   l e f t < / d i v > 
 < d i v > f u c k   t w o   d a y s   l a t e   a n d   i   w a n t   t o   d i e   ( f i g u r a t i v e l y )   b e c a u s e   m y   b o d y   w a s   d i s f i g u r e d   b y   t e s t o s t e r o n e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 2 1 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 1 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > F I L E D   M Y   L E G A L   N A M E   C H A N G E   B E C A U S E   F U C K   T E X A S < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 8 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > a l s o   o n   f r i d a y   i n s t e a d   o f   t h u r s d a y   - _ -   A L S O   J U S T   H A D   M Y   W I S D O M   T E E T H   R E M O V E D < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 1 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > o o p s   d a y   l a t e   c a u s e   o f   h a l l o w e e n   l m a o < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 2 4 < / d i v > 
 < d i v > m i d   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 1 7 < / d i v > 
 < d i v > m i d   l e f t < / d i v > 
 < d i v > s i c k   a s   a   d o g < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 1 0 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > i n   m i n n e a p o l i s   w i t h   m i c k e y   t a k i n g   c a r e   o f   h i m   a f t e r   s u r g e r y < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 3 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > w a t c h i n g   c r e e p   2 < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 2 7 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > d a y   l a t e   t o   g e t   b a c k   o n   s c h e d u l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 2 1 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > T W O   D A Y S   L A T E   A N D   S T R E S S E D < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 1 2 < / d i v > 
 < d i v > r i g h t   m i d d l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 5 < / d i v > 
 < d i v > l e f t   m i d d l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 2 9 < / d i v > 
 < d i v > r i g h t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 2 2 < / d i v > 
 < d i v > l e f t   b o t t o m < / d i v > 
 < d i v > t e x a s   i s   n o w   b l o c k i n g   a l l   g e n d e r   m a r k e r   c h a n g e s   f o r   d r i v e r s   l i c e n s e s ,   s t a b b e d   m y s e l f   w h i l e   a d m i n i s t e r i n g   m y   s h o t   i n   t e a r s < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 1 5 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 8 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 1 < / d i v > 
 < d i v > r i g h t   m i d d l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 7 / 2 5 < / d i v > 
 < d i v > l e f t   m i d d l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 7 / 1 8 < / d i v > 
 < d i v > r i g h t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 7 / 1 1 < / d i v > 
 < d i v > l e f t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 7 / 4 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 2 7 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 2 0 < / d i v > 
 < d i v > r i g h t   m i d d l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 1 3 < / d i v > 
 < d i v > l e f t   m i d d l e < / d i v > 
 < d i v > o n   t i m e   a g a i n   : 3 < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 7 < / d i v > 
 < d i v > r i g h t   b o t t o m < / d i v > 
 < d i v > L A T E   : ( ( (   A L S O   O N E   Y E A R   O F   T A K I N G   E S T R O G E N ! ! ! !   I  m   s o   f r e a k i n g   h a p p y   i t  s   a m a z i n g < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 3 0 < / d i v > 
 < d i v > l e f t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 2 3 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 1 6 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 9 < / d i v > 
 < d i v > r i g h t   m i d d l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 2 < / d i v > 
 < d i v > l e f t   m i d d l e < / d i v > 
 < d i v > p e r f e c t   e x e c u t i o n ! ! < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 4 / 2 5 < / d i v > 
 < d i v > r i g h t   b o t t o m < / d i v > 
 < d i v > n o t   p a i n f u l   y a y < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 4 / 1 8 < / d i v > 
 < d i v > l e f t   b o t t o m < / d i v > 
 < d i v > a n o t h e r   p a i n f u l   s h o t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 4 / 1 1 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > h a p p y   b i r t h d a y   2 5   y o   i n j e c t i o n !   O W   T H I S   W E E K   H U R T   S O   B A D ;   I   w e n t   a   l i t t l e   h i g h   w i t h   m y   i n j e c t i o n   s i t e   b u t   o u c h .   T r y i n g   t o   m a n a g e   t h e   p a i n   w h i l e   t h e   s h o t   i s   s t i l l   i n   m y   l e g   i s   d i f f i c u l t . < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 4 / 4 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > a l m o s t   m y   b i r t h d a y !   f e e l i n g   r e b o r n < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 3 / 2 8 < / d i v > 
 < d i v > r i g h t   m i d < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 3 / 2 1 < / d i v > 
 < d i v > l e f t   m i d < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 3 / 1 4 < / d i v > 
 < d i v > r i g h t   b o t t o m < / d i v > 
 < d i v > h a p p y   c a d e   i s   a n   i d i o t   d a y y y y ! ! ! ! < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 3 / 7 < / d i v > 
 < d i v > l e f t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 2 9 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > l e a p   d a y   i n j e c t i o n ! ! ! ! < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 2 2 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 1 5 < / d i v > 
 < d i v > r i g h t   m i d < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 8 < / d i v > 
 < d i v > l e f t   m i d < / d i v > 
 < d i v > l i l   p i n c h   : , ( < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 1 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > c r i e d   a b o u t   c o m i n g   o u t   t o   m y   m o m   a t   1 4   b u t   n o t   t r a n s i t i o n i n g   t i l l   2 3 < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 2 5 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > g r a a a a h h h h h h h < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 1 8 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 1 1 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > d o n e   i n   m a r a t h o n   F l o r i d a   l i s t e n i n g   t o   P a r a m o r e   : )   f u c k   R o n   D e S a n t i s < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 4 < / d i v > 
 < d i v > r i g h t   m i d < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 2 9 < / d i v > 
 < d i v > l e f t   m i d < / d i v > 
 < d i v > ( d a y   l a t e   : ( ) < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 2 1 < / d i v > 
 < d i v > r i g h t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 1 4 < / d i v > 
 < d i v > l e f t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 7 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 3 0 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 2 3 < / d i v > 
 < d i v > r i g h t   m i d < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 1 6 < / d i v > 
 < d i v > l e f t   m i d < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 9 < / d i v > 
 < d i v > r i g h t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 2 < / d i v > 
 < d i v > l e f t   b o t t o m < / d i v > 
 < d i v > ( b a c k   i n   s c h e d u l e ) < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 2 7 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > ( d a y   l a t e ) < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 1 9 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 1 2 < / d i v > 
 < d i v > r i g h t   m i d d l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 2 8 < / d i v > 
 < d i v > r i g h t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 2 1 < / d i v > 
 < d i v > l e f t   b o t t o m < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 1 4 < / d i v > 
 < d i v > r i g h t   t o p < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 7 < / d i v > 
 < d i v > l e f t   t o p < / d i v > 
 < d i v > ( o u c h ) < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 3 1 < / d i v > 
 < d i v > r i g h t   m i d d l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 2 4 < / d i v > 
 < d i v > l e f t   m i d d l e < / d i v > 
 � alis      Macintosh HD               �l�BD ����	Documents                                                      ������<        ����  
 cu             chloe   /:Users:chloe:Documents/   	 D o c u m e n t s    M a c i n t o s h   H D  Users/chloe/Documents   /    ��   � � � � j M a c i n t o s h   H D : U s e r s : c h l o e : D o c u m e n t s : I n j e c t i o n D i a r y . t x t�� l��  ��  ��  ascr  ��ޭ