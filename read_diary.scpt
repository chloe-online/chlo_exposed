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
refn � o   � ����� 0 fileref fileRef � �� ���
�� 
wrat � m   � �����  ��   �  � � � l  � ���������  ��  ��   �  ��� � I  � ��� ���
�� .rdwrclosnull���     **** � o   � ����� 0 fileref fileRef��  ��   � R      �� ���
�� .ascrerr ****      � **** � o      ���� 0 errmsg errMsg��   � k   � � � �  � � � I  � ��� ���
�� .sysodlogaskr        TEXT � b   � � � � � m   � � � � � � � . E r r o r   w r i t i n g   t o   f i l e :   � o   � ����� 0 errmsg errMsg��   �  ��� � Q   � � � ��� � I  � ��� ���
�� .rdwrclosnull���     **** � o   � ��� 0 fileref fileRef��   � R      �~�}�|
�~ .ascrerr ****      � ****�}  �|  ��  ��  ��  ��   �  ��{ � l     �z�y�x�z  �y  �x  �{       �w � ��w   � �v
�v .aevtoappnull  �   � **** � �u ��t�s � ��r
�u .aevtoappnull  �   � **** � k     � � �   � �   � �  R � �  e � �  x � �  � � �  ��q�q  �t  �s   � �p�p 0 errmsg errMsg � & �o �n�m J�l�k�j�i�h�g H�f \�e k�d�c�b�a�`�_�^�]�\ ��[�Z�Y�X�W�V�U�T�S�R �
�o 
note
�n 
body�m 0 notecontent noteContent
�l .earsffdralis        afdr
�k 
ctxt�j $0 scriptfileastext scriptFileAsText
�i 
alis
�h 
ctnr�g 0 scriptfolder scriptFolder�f 0 current_path  �e 0 filepath filePath
�d 
psxp
�c 
strq
�b .sysoexecTEXT���     TEXT
�a 
file
�` 
perm
�_ .rdwropenshor       file�^ 0 fileref fileRef�]  �\  
�[ .sysodlogaskr        TEXT�Z  0 encodedcontent encodedContent
�Y 
set2
�X .rdwrseofnull���     ****
�W 
refn
�V 
wrat�U 
�T .rdwrwritnull���     ****
�S .rdwrclosnull���     ****�R 0 errmsg errMsg�r �� 
*��/�,E�UO� )j �&E�O��&�,E�O��&�%�&E�UO��&�%E�Oa �a ,a ,%j O *a �/a el E` W X  a j OhO�E` O ,_ a jl O_ a _ a  ja ! "O_ j #W $X $ a %�%j O _ j #W X  hascr  ��ޭ