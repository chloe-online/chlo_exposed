FasdUAS 1.101.10   ��   ��    k             l     ����  O       	  r     
  
 n    
    1    
��
�� 
body  4    �� 
�� 
note  m       �   "�=܉ I n j e c t i o n   d i a r y  o      ���� 0 notecontent noteContent 	 m       �                                                                                      @ alis    ,  Macintosh HD               �l�BD ����	Notes.app                                                      �����l�        ����  
 cu             Applications   /:System:Applications:Notes.app/   	 N o t e s . a p p    M a c i n t o s h   H D  System/Applications/Notes.app   / ��  ��  ��        l     ��������  ��  ��        l   . ����  O    .    k    -       l   ��  ��    2 , Convert "path to me" into a text path first     �   X   C o n v e r t   " p a t h   t o   m e "   i n t o   a   t e x t   p a t h   f i r s t       r     ! " ! c     # $ # l    %���� % I   �� &��
�� .earsffdralis        afdr &  f    ��  ��  ��   $ m    ��
�� 
ctxt " o      ���� $0 scriptfileastext scriptFileAsText    ' ( ' l   ��������  ��  ��   (  ) * ) l   �� + ,��   + = 7 Now ask the Finder for the container of that text path    , � - - n   N o w   a s k   t h e   F i n d e r   f o r   t h e   c o n t a i n e r   o f   t h a t   t e x t   p a t h *  . / . r    # 0 1 0 n    ! 2 3 2 m    !��
�� 
ctnr 3 l    4���� 4 c     5 6 5 o    ���� $0 scriptfileastext scriptFileAsText 6 m    ��
�� 
alis��  ��   1 o      ���� 0 scriptfolder scriptFolder /  7 8 7 l  $ $��������  ��  ��   8  9 : 9 l  $ $�� ; <��   ; F @ Finally coerce it to an alias if you need an alias specifically    < � = = �   F i n a l l y   c o e r c e   i t   t o   a n   a l i a s   i f   y o u   n e e d   a n   a l i a s   s p e c i f i c a l l y :  >�� > r   $ - ? @ ? c   $ + A B A b   $ ) C D C l  $ ' E���� E c   $ ' F G F o   $ %���� 0 scriptfolder scriptFolder G m   % &��
�� 
ctxt��  ��   D m   ' ( H H � I I  p u b l i c B m   ) *��
�� 
alis @ o      ���� 0 current_path  ��    m     J J�                                                                                  MACS  alis    @  Macintosh HD               �l�BD ����
Finder.app                                                     �����l�        ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��  ��     K L K l     ��������  ��  ��   L  M N M l     �� O P��   O @ : Define the file path where the note content will be saved    P � Q Q t   D e f i n e   t h e   f i l e   p a t h   w h e r e   t h e   n o t e   c o n t e n t   w i l l   b e   s a v e d N  R S R l  / 6 T���� T r   / 6 U V U b   / 4 W X W l  / 2 Y���� Y c   / 2 Z [ Z o   / 0���� 0 current_path   [ m   0 1��
�� 
ctxt��  ��   X m   2 3 \ \ � ] ] $ I n j e c t i o n D i a r y . t x t V o      ���� 0 filepath filePath��  ��   S  ^ _ ^ l     ��������  ��  ��   _  ` a ` l     �� b c��   b * $ Create the file if it doesn't exist    c � d d H   C r e a t e   t h e   f i l e   i f   i t   d o e s n ' t   e x i s t a  e f e l  7 H g���� g I  7 H�� h��
�� .sysoexecTEXT���     TEXT h b   7 D i j i m   7 : k k � l l  t o u c h   j n   : C m n m 1   ? C��
�� 
strq n n   : ? o p o 1   ; ?��
�� 
psxp p o   : ;���� 0 filepath filePath��  ��  ��   f  q r q l     ��������  ��  ��   r  s t s l     �� u v��   u ; 5 Open the file for writing (with creation permission)    v � w w j   O p e n   t h e   f i l e   f o r   w r i t i n g   ( w i t h   c r e a t i o n   p e r m i s s i o n ) t  x y x l  I p z���� z Q   I p { | } { r   L ^ ~  ~ I  L Z�� � �
�� .rdwropenshor       file � 4   L R�� �
�� 
file � o   P Q���� 0 filepath filePath � �� ���
�� 
perm � m   U V��
�� boovtrue��    o      ���� 0 fileref fileRef | R      ������
�� .ascrerr ****      � ****��  ��   } k   f p � �  � � � I  f m�� ���
�� .sysodlogaskr        TEXT � m   f i � � � � � F E r r o r   o p e n i n g   t h e   f i l e   f o r   w r i t i n g .��   �  ��� � L   n p����  ��  ��  ��   y  � � � l     ��������  ��  ��   �  � � � l  q v ����� � r   q v � � � o   q r���� 0 notecontent noteContent � o      ����  0 encodedcontent encodedContent��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � %  Overwrite the existing content    � � � � >   O v e r w r i t e   t h e   e x i s t i n g   c o n t e n t �  � � � l  w � ����� � Q   w � � � � � k   z � � �  � � � l  z z�� � ���   � = 7 Clear the file�s existing contents by setting EOF to 0    � � � � n   C l e a r   t h e   f i l e  s   e x i s t i n g   c o n t e n t s   b y   s e t t i n g   E O F   t o   0 �  � � � I  z ��� � �
�� .rdwrseofnull���     **** � o   z }���� 0 fileref fileRef � �� ���
�� 
set2 � m   � �����  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � / ) Write the new content from the beginning    � � � � R   W r i t e   t h e   n e w   c o n t e n t   f r o m   t h e   b e g i n n i n g �  � � � I  � ��� � �
�� .rdwrwritnull���     **** � o   � �����  0 encodedcontent encodedContent � �� � �
�� 
refn � o   � ����� 0 fileref fileRef � �� � �
�� 
wrat � m   � �����   � �� ���
�� 
as   � m   � ���
�� 
utf8��   �  � � � l  � ���������  ��  ��   �  � � � l  � ���������  ��  ��   �  ��� � I  � ��� ���
�� .rdwrclosnull���     **** � o   � ����� 0 fileref fileRef��  ��   � R      �� ���
�� .ascrerr ****      � **** � o      ���� 0 errmsg errMsg��   � k   � � � �  � � � I  � ��� ���
�� .sysodlogaskr        TEXT � b   � � � � � m   � � � � � � � . E r r o r   w r i t i n g   t o   f i l e :   � o   � ��� 0 errmsg errMsg��   �  ��~ � Q   � � � ��} � I  � ��| ��{
�| .rdwrclosnull���     **** � o   � ��z�z 0 fileref fileRef�{   � R      �y�x�w
�y .ascrerr ****      � ****�x  �w  �}  �~  ��  ��   �  ��v � l     �u�t�s�u  �t  �s  �v       
�r � � � � � � ��q ��r   � �p�o�n�m�l�k�j�i
�p .aevtoappnull  �   � ****�o 0 notecontent noteContent�n $0 scriptfileastext scriptFileAsText�m 0 scriptfolder scriptFolder�l 0 current_path  �k 0 filepath filePath�j 0 fileref fileRef�i  0 encodedcontent encodedContent � �h ��g�f � ��e
�h .aevtoappnull  �   � **** � k     � � �   � �   � �  R � �  e � �  x � �  � � �  ��d�d  �g  �f   � �c�c 0 errmsg errMsg � ( �b �a�` J�_�^�]�\�[�Z H�Y \�X k�W�V�U�T�S�R�Q�P�O ��N�M�L�K�J�I�H�G�F�E�D�C �
�b 
note
�a 
body�` 0 notecontent noteContent
�_ .earsffdralis        afdr
�^ 
ctxt�] $0 scriptfileastext scriptFileAsText
�\ 
alis
�[ 
ctnr�Z 0 scriptfolder scriptFolder�Y 0 current_path  �X 0 filepath filePath
�W 
psxp
�V 
strq
�U .sysoexecTEXT���     TEXT
�T 
file
�S 
perm
�R .rdwropenshor       file�Q 0 fileref fileRef�P  �O  
�N .sysodlogaskr        TEXT�M  0 encodedcontent encodedContent
�L 
set2
�K .rdwrseofnull���     ****
�J 
refn
�I 
wrat
�H 
as  
�G 
utf8�F 
�E .rdwrwritnull���     ****
�D .rdwrclosnull���     ****�C 0 errmsg errMsg�e �� 
*��/�,E�UO� )j �&E�O��&�,E�O��&�%�&E�UO��&�%E�Oa �a ,a ,%j O *a �/a el E` W X  a j OhO�E` O 2_ a jl O_ a _ a  ja !a "a # $O_ j %W $X & a '�%j O _ j %W X  h � � � �7� < d i v > < b > < u > < h 1 >�=܉ < / h 1 > < / u > < / b > < h 1 > I n j e c t i o n   d i a r y < / h 1 > < / d i v > 
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
 < d i v > m e t   a   g i r l   o n   t h e   t r a i n   a n d   w e   h a d   a   d a t e   t h a t   n i g h t   0 _ o   w o w o w o w o w < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 1 2 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > f o r t s   s h o t   i n   n y y y y < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 5 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 3 0 / 2 4 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > f u c k   t w o   d a y s   l a t e   a n d   i   w a n t   t o   d i e   ( f i g u r a t i v e l y )   b e c a u s e   m y   b o d y   w a s   d i s f i g u r e d   b y   t e s t o s t e r o n e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 2 1 / 2 4 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 1 4 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > F I L E D   M Y   L E G A L   N A M E   C H A N G E   B E C A U S E   F U C K   T E X A S < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 8 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > a l s o   o n   f r i d a y   i n s t e a d   o f   t h u r s d a y   - _ -   A L S O   J U S T   H A D   M Y   W I S D O M   T E E T H   R E M O V E D < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 1 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > o o p s   d a y   l a t e   c a u s e   o f   h a l l o w e e n   l m a o < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 2 4 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 1 7 / 2 4 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > s i c k   a s   a   d o g < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 1 0 / 2 4 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > i n   m i n n e a p o l i s   w i t h   m i c k e y   t a k i n g   c a r e   o f   h i m   a f t e r   s u r g e r y < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 3 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > w a t c h i n g   c r e e p   2 < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 2 7 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > d a y   l a t e   t o   g e t   b a c k   o n   s c h e d u l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 2 1 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > T W O   D A Y S   L A T E   A N D   S T R E S S E D < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 1 2 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 5 / 2 4 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 2 9 / 2 4 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 2 2 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > t e x a s   i s   n o w   b l o c k i n g   a l l   g e n d e r   m a r k e r   c h a n g e s   f o r   d r i v e r s   l i c e n s e s ,   s t a b b e d   m y s e l f   w h i l e   a d m i n i s t e r i n g   m y   s h o t   i n   t e a r s < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 1 5 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 8 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 1 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 7 / 2 5 / 2 4 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 7 / 1 8 / 2 4 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 7 / 1 1 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 7 / 4 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 2 7 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 2 0 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 1 3 / 2 4 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > o n   t i m e   a g a i n   : 3 < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 7 / 2 4 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > L A T E   : ( ( (   A L S O   O N E   Y E A R   O F   T A K I N G   E S T R O G E N ! ! ! !   I  m   s o   f r e a k i n g   h a p p y   i t  s   a m a z i n g < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 3 0 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 2 3 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 1 6 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 9 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 5 / 2 / 2 4 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > p e r f e c t   e x e c u t i o n ! ! < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 4 / 2 5 / 2 4 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > n o t   p a i n f u l   y a y < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 4 / 1 8 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > a n o t h e r   p a i n f u l   s h o t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 4 / 1 1 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > h a p p y   b i r t h d a y   2 5   y o   i n j e c t i o n !   O W   T H I S   W E E K   H U R T   S O   B A D ;   I   w e n t   a   l i t t l e   h i g h   w i t h   m y   i n j e c t i o n   s i t e   b u t   o u c h .   T r y i n g   t o   m a n a g e   t h e   p a i n   w h i l e   t h e   s h o t   i s   s t i l l   i n   m y   l e g   i s   d i f f i c u l t . < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 4 / 4 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > a l m o s t   m y   b i r t h d a y !   f e e l i n g   r e b o r n < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 3 / 2 8 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 3 / 2 1 / 2 4 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 3 / 1 4 / 2 4 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > h a p p y   c a d e   i s   a n   i d i o t   d a y y y y ! ! ! ! < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 3 / 7 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 2 9 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > l e a p   d a y   i n j e c t i o n ! ! ! ! < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 2 2 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 1 5 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 8 / 2 4 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > l i l   p i n c h   : , ( < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 2 / 1 / 2 4 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > c r i e d   a b o u t   c o m i n g   o u t   t o   m y   m o m   a t   1 4   b u t   n o t   t r a n s i t i o n i n g   t i l l   2 3 < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 2 5 / 2 4 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > g r a a a a h h h h h h h < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 1 8 / 2 4 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 1 1 / 2 4 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > d o n e   i n   m a r a t h o n   F l o r i d a   l i s t e n i n g   t o   P a r a m o r e   : )   f u c k   R o n   D e S a n t i s < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 / 4 / 2 4 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 2 9 / 2 3 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > d a y   l a t e   : ( < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 2 1 / 2 3 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 1 4 / 2 3 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 2 / 7 / 2 3 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 3 0 / 2 3 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 2 3 / 2 3 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 1 6 / 2 3 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 9 / 2 3 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 1 / 2 / 2 3 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > b a c k   i n   s c h e d u l e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 2 7 / 2 3 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > d a y   l a t e < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 1 9 / 2 3 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 1 2 / 2 3 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 1 0 / 5 / 2 3 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > t h i s   w a s   l e f t   b l a n k   f o r   s o m e   r e a s o n ,   m a y b e   t h i s   e n t r y   g o t   l o s t .   b u t   i v e   n e v e r   m i s s e d   a   w e e k   i   d o n t   t h i n k   s o   t h i s   d e f i n i t e l y   h a p p e n e d .   n o t i c e d   t h i s   w a s   m i s s i n g   1 / 1 8 / 2 5   w h i l e   u p d a t i n g   m y   s i t e   : P < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 2 8 / 2 3 < / d i v > 
 < d i v > b o t t o m   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 2 1 / 2 3 < / d i v > 
 < d i v > b o t t o m   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 1 4 / 2 3 < / d i v > 
 < d i v > t o p   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 9 / 7 / 2 3 < / d i v > 
 < d i v > t o p   l e f t < / d i v > 
 < d i v > o u c h < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 3 1 / 2 3 < / d i v > 
 < d i v > m i d d l e   r i g h t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 8 / 2 4 / 2 3 < / d i v > 
 < d i v > m i d d l e   l e f t < / d i v > 
 < d i v > < b r > < / d i v > 
 < d i v > 6 / 6 / 2 3 < / d i v > 
 < d i v > n o   s i t e < / d i v > 
 < d i v > V e r y   i m p o r t a n t   s p e c i a l   d a t e !   T h i s   i s   w h e n   I   f i r s t   s t a r t e d   t a k i n g   e s t r o g e n ,   b u t   a s   y o u   c a n   s e e   t h e   o t h e r   d a t e s   d o n  t   s t a r t   u n t i l   a u g u s t .   t h i s   i s   b e c a u s e   I   i n i t i a l l y   s t a r t i n g   t a k i n g   e s t r a d i o l   i n   i t s   p i l l   f o r m < / d i v > 
 � � � � r M a c i n t o s h   H D : U s e r s : c h l o e : d e v : c h l o - e x p o s e d : r e a d _ d i a r y . s c p t �  � �  ��B � �  ��A � �  ��@ � �  ��? � �  J�>
�> 
sdsk
�? 
cfol � � � � 
 U s e r s
�@ 
cfol � � � � 
 c h l o e
�A 
cfol � � � �  d e v
�B 
cfol � � � �  c h l o - e x p o s e d �<alis    8  Macintosh HD               �l�BD ����public                                                         ������i        ����  
 cu             chlo-exposed  &/:Users:chloe:dev:chlo-exposed:public/    p u b l i c    M a c i n t o s h   H D  #Users/chloe/dev/chlo-exposed/public   /    ��   � � � � � M a c i n t o s h   H D : U s e r s : c h l o e : d e v : c h l o - e x p o s e d : p u b l i c : I n j e c t i o n D i a r y . t x t�q   ascr  ��ޭ