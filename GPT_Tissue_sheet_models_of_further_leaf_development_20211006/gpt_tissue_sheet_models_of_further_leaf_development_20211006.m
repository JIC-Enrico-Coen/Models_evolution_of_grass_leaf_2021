function [m,result] = gpt_tissue_sheet_models_of_further_leaf_development_20211006( m, varargin )
%[m,result] = gpt_tissue_sheet_models_of_further_leaf_development_20211006( m, varargin )
%   Morphogen interaction function.
%   Written at 2021-10-06 17:58:10.
%   GFtbox revision 20210803, 2020-08-03 15:00.

% The user may edit any part of this function lying between lines that
% begin "%%% USER CODE" and "%%% END OF USER CODE".  Those lines themselves
% delimiters themselves must not be moved, edited, deleted, or added.

    result = [];
    if isempty(m), return; end

    setGlobals();
    
    % Handle new-style callbacks.
    if nargin > 1
        if exist('ifCallbackHandler','file')==2
            [m,result] = ifCallbackHandler( m, varargin{:} );
        end
        return;
    end

    fprintf( 1, '%s found in %s\n', mfilename(), which(mfilename()) );

    realtime = m.globalDynamicProps.currenttime;
    dt = m.globalProps.timestep;

%%% USER CODE: INITIALISATION
    if (Steps(m)==0) && m.globalDynamicProps.doinit
        % Put any code here that should only be performed at the start of
        % the simulation.

        % Reset several fields of m to their default states.
        % Give the command "help resetMeshValues" for details.
        % You can delete this if you do not want this to happen.
        m = resetMeshValues( m );
       % m = leaf_plotoptions( m, 'highgradcolor', [1 0.5 0], 'lowgradcolor', [0 1 1] ); % orange and cyan
        m = leaf_plotoptions( m, 'highgradcolor', [0 0 0.9], 'lowgradcolor', [1 1 1] ); % orange and cyan
        m = leaf_mgen_plotpriority( m, ...                                    
                   {'id_dul','id_pul'}, [1 2]); % set id_DUL and id_PUL as priprioty over all other morphogens in multiplot mode.

        if m.globalProps.IFsetsoptions
            m = setUpModelOptions( m, ...
                'modelname', { 'Grassleaf', 'nsheathmutant','prs','dicot','bop', 'Kaplan','woxprs','Kwoxprs' },'dicot' ,  ...
                'clonetime', {}, 0.02, ...
                'clonetype', { 'random', 'biggest' }, 'random', ...
                'makecells', {}, false ...
            );
        end

        % Any further initialisation here.

    end
    OPTIONS = getModelOptions( m );
    printModelOptions( m );
    
%Cell Div
%  m = leaf_setproperty(m,'bioApresplitproc',@GFtbox_Precellsplit_Callback);
%  m = leaf_plotoptions(m, 'userpreplotproc', @GFtbox_Preplot_Callback);
%  m.secondlayer.averagetargetarea = 0;
 %make a grid
%    if OPTIONS.makecells && ~hasNonemptySecondLayer( m )
  %  m = leaf_makesecondlayer (m, 'mode', 'latlong', 'divisions', [75 18], 'plane', 'xy');%'subdivisions' , [1 1],
%    end
   % m = leaf_plotoptions (m, 'bioAemptyalpha', 0)
  m.secondlayer.averagetargetarea = 0;
%%% END OF USER CODE: INITIALISATION

%%% SECTION 1: ACCESSING MORPHOGENS AND TIME.
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.

% Each call of getMgenLevels below returns four results:
% XXX_i is the index of the morphogen called XXX.
% XXX_p is the vector of all of its values.
% XXX_a is its mutation level.
% XXX_l is the "effective" level of the morphogen, i.e. XXX_p*XXX_a.
% In SECTION 3 of the automatically generated code, all of the XXX_p values
% will be copied back into the mesh.

    polariser_i = FindMorphogenRole( m, 'POLARISER' );
    P = m.morphogens(:,polariser_i);
    [kapar_i,kapar_p,kapar_a,kapar_l] = getMgenLevels( m, 'KAPAR' );  %#ok<ASGLU>
    [kaper_i,kaper_p,kaper_a,kaper_l] = getMgenLevels( m, 'KAPER' );  %#ok<ASGLU>
    [kbpar_i,kbpar_p,kbpar_a,kbpar_l] = getMgenLevels( m, 'KBPAR' );  %#ok<ASGLU>
    [kbper_i,kbper_p,kbper_a,kbper_l] = getMgenLevels( m, 'KBPER' );  %#ok<ASGLU>
    [knor_i,knor_p,knor_a,knor_l] = getMgenLevels( m, 'KNOR' );  %#ok<ASGLU>
    [strainret_i,strainret_p,strainret_a,strainret_l] = getMgenLevels( m, 'STRAINRET' );  %#ok<ASGLU>
    [arrest_i,arrest_p,arrest_a,arrest_l] = getMgenLevels( m, 'ARREST' );  %#ok<ASGLU>
    [id_base_i,id_base_p,id_base_a,id_base_l] = getMgenLevels( m, 'ID_BASE' );  %#ok<ASGLU>
    [id_plus_i,id_plus_p,id_plus_a,id_plus_l] = getMgenLevels( m, 'ID_PLUS' );  %#ok<ASGLU>
    [id_mid_i,id_mid_p,id_mid_a,id_mid_l] = getMgenLevels( m, 'ID_MID' );  %#ok<ASGLU>
    [id_pzmargin_i,id_pzmargin_p,id_pzmargin_a,id_pzmargin_l] = getMgenLevels( m, 'ID_PZMARGIN' );  %#ok<ASGLU>
    [id_midveintip_i,id_midveintip_p,id_midveintip_a,id_midveintip_l] = getMgenLevels( m, 'ID_MIDVEINTIP' );  %#ok<ASGLU>
    [id_edge_i,id_edge_p,id_edge_a,id_edge_l] = getMgenLevels( m, 'ID_EDGE' );  %#ok<ASGLU>
    [s_rim_i,s_rim_p,s_rim_a,s_rim_l] = getMgenLevels( m, 'S_RIM' );  %#ok<ASGLU>
    [s_base_i,s_base_p,s_base_a,s_base_l] = getMgenLevels( m, 'S_BASE' );  %#ok<ASGLU>
    [s_pzmargin_i,s_pzmargin_p,s_pzmargin_a,s_pzmargin_l] = getMgenLevels( m, 'S_PZMARGIN' );  %#ok<ASGLU>
    [s_midline_i,s_midline_p,s_midline_a,s_midline_l] = getMgenLevels( m, 'S_MIDLINE' );  %#ok<ASGLU>
    [id_rim_i,id_rim_p,id_rim_a,id_rim_l] = getMgenLevels( m, 'ID_RIM' );  %#ok<ASGLU>
    [id_pmarg_i,id_pmarg_p,id_pmarg_a,id_pmarg_l] = getMgenLevels( m, 'ID_PMARG' );  %#ok<ASGLU>
    [id_leaf_i,id_leaf_p,id_leaf_a,id_leaf_l] = getMgenLevels( m, 'ID_LEAF' );  %#ok<ASGLU>
    [id_bottom_i,id_bottom_p,id_bottom_a,id_bottom_l] = getMgenLevels( m, 'ID_BOTTOM' );  %#ok<ASGLU>
    [id_blade_i,id_blade_p,id_blade_a,id_blade_l] = getMgenLevels( m, 'ID_BLADE' );  %#ok<ASGLU>
    [s_prox2_i,s_prox2_p,s_prox2_a,s_prox2_l] = getMgenLevels( m, 'S_PROX2' );  %#ok<ASGLU>
    [s_tip_i,s_tip_p,s_tip_a,s_tip_l] = getMgenLevels( m, 'S_TIP' );  %#ok<ASGLU>
    [s_celldivthresh_i,s_celldivthresh_p,s_celldivthresh_a,s_celldivthresh_l] = getMgenLevels( m, 'S_CELLDIVTHRESH' );  %#ok<ASGLU>
    [id_final_i,id_final_p,id_final_a,id_final_l] = getMgenLevels( m, 'ID_FINAL' );  %#ok<ASGLU>
    [id_lateral_i,id_lateral_p,id_lateral_a,id_lateral_l] = getMgenLevels( m, 'ID_LATERAL' );  %#ok<ASGLU>
    [id_marginal_i,id_marginal_p,id_marginal_a,id_marginal_l] = getMgenLevels( m, 'ID_MARGINAL' );  %#ok<ASGLU>
    [id_pz_i,id_pz_p,id_pz_a,id_pz_l] = getMgenLevels( m, 'ID_PZ' );  %#ok<ASGLU>
    [id_subdiv5_i,id_subdiv5_p,id_subdiv5_a,id_subdiv5_l] = getMgenLevels( m, 'ID_SUBDIV5' );  %#ok<ASGLU>
    [id_sheath_i,id_sheath_p,id_sheath_a,id_sheath_l] = getMgenLevels( m, 'ID_SHEATH' );  %#ok<ASGLU>
    [s_prox_i,s_prox_p,s_prox_a,s_prox_l] = getMgenLevels( m, 'S_PROX' );  %#ok<ASGLU>
    [id_notpz_i,id_notpz_p,id_notpz_a,id_notpz_l] = getMgenLevels( m, 'ID_NOTPZ' );  %#ok<ASGLU>
    [id_dicot_i,id_dicot_p,id_dicot_a,id_dicot_l] = getMgenLevels( m, 'ID_DICOT' );  %#ok<ASGLU>
    [s_marginal_i,s_marginal_p,s_marginal_a,s_marginal_l] = getMgenLevels( m, 'S_MARGINAL' );  %#ok<ASGLU>
    [id_marginal2_i,id_marginal2_p,id_marginal2_a,id_marginal2_l] = getMgenLevels( m, 'ID_MARGINAL2' );  %#ok<ASGLU>
    [v_kperpz_i,v_kperpz_p,v_kperpz_a,v_kperpz_l] = getMgenLevels( m, 'V_KPERPZ' );  %#ok<ASGLU>
    [v_kparpz_i,v_kparpz_p,v_kparpz_a,v_kparpz_l] = getMgenLevels( m, 'V_KPARPZ' );  %#ok<ASGLU>
    [s_mid_i,s_mid_p,s_mid_a,s_mid_l] = getMgenLevels( m, 'S_MID' );  %#ok<ASGLU>
    [id_opp_i,id_opp_p,id_opp_a,id_opp_l] = getMgenLevels( m, 'ID_OPP' );  %#ok<ASGLU>
    [id_meristem_i,id_meristem_p,id_meristem_a,id_meristem_l] = getMgenLevels( m, 'ID_MERISTEM' );  %#ok<ASGLU>
    [id_early_i,id_early_p,id_early_a,id_early_l] = getMgenLevels( m, 'ID_EARLY' );  %#ok<ASGLU>
    [id_middle_i,id_middle_p,id_middle_a,id_middle_l] = getMgenLevels( m, 'ID_MIDDLE' );  %#ok<ASGLU>
    [id_late_i,id_late_p,id_late_a,id_late_l] = getMgenLevels( m, 'ID_LATE' );  %#ok<ASGLU>
    [id_sector_i,id_sector_p,id_sector_a,id_sector_l] = getMgenLevels( m, 'ID_SECTOR' );  %#ok<ASGLU>
    [id_overlap_i,id_overlap_p,id_overlap_a,id_overlap_l] = getMgenLevels( m, 'ID_OVERLAP' );  %#ok<ASGLU>
    [id_central_i,id_central_p,id_central_a,id_central_l] = getMgenLevels( m, 'ID_CENTRAL' );  %#ok<ASGLU>
    [id_base2_i,id_base2_p,id_base2_a,id_base2_l] = getMgenLevels( m, 'ID_BASE2' );  %#ok<ASGLU>
    [id_subdiv1_i,id_subdiv1_p,id_subdiv1_a,id_subdiv1_l] = getMgenLevels( m, 'ID_SUBDIV1' );  %#ok<ASGLU>
    [id_subdiv2_i,id_subdiv2_p,id_subdiv2_a,id_subdiv2_l] = getMgenLevels( m, 'ID_SUBDIV2' );  %#ok<ASGLU>
    [id_open_i,id_open_p,id_open_a,id_open_l] = getMgenLevels( m, 'ID_OPEN' );  %#ok<ASGLU>
    [id_subdiv3_i,id_subdiv3_p,id_subdiv3_a,id_subdiv3_l] = getMgenLevels( m, 'ID_SUBDIV3' );  %#ok<ASGLU>
    [id_subdiv4_i,id_subdiv4_p,id_subdiv4_a,id_subdiv4_l] = getMgenLevels( m, 'ID_SUBDIV4' );  %#ok<ASGLU>
    [s_central_i,s_central_p,s_central_a,s_central_l] = getMgenLevels( m, 'S_CENTRAL' );  %#ok<ASGLU>
    [s_auricle_i,s_auricle_p,s_auricle_a,s_auricle_l] = getMgenLevels( m, 'S_AURICLE' );  %#ok<ASGLU>
    [s_overlap_i,s_overlap_p,s_overlap_a,s_overlap_l] = getMgenLevels( m, 'S_OVERLAP' );  %#ok<ASGLU>
    [id_ul_i,id_ul_p,id_ul_a,id_ul_l] = getMgenLevels( m, 'ID_UL' );  %#ok<ASGLU>
    [id_ll_i,id_ll_p,id_ll_a,id_ll_l] = getMgenLevels( m, 'ID_LL' );  %#ok<ASGLU>
    [id_pul_i,id_pul_p,id_pul_a,id_pul_l] = getMgenLevels( m, 'ID_PUL' );  %#ok<ASGLU>
    [id_dul_i,id_dul_p,id_dul_a,id_dul_l] = getMgenLevels( m, 'ID_DUL' );  %#ok<ASGLU>
    [id_kaplan_i,id_kaplan_p,id_kaplan_a,id_kaplan_l] = getMgenLevels( m, 'ID_KAPLAN' );  %#ok<ASGLU>
    [id_margrow_i,id_margrow_p,id_margrow_a,id_margrow_l] = getMgenLevels( m, 'ID_MARGROW' );  %#ok<ASGLU>
    [id_stipule_i,id_stipule_p,id_stipule_a,id_stipule_l] = getMgenLevels( m, 'ID_STIPULE' );  %#ok<ASGLU>
    [id_stbound_i,id_stbound_p,id_stbound_a,id_stbound_l] = getMgenLevels( m, 'ID_STBOUND' );  %#ok<ASGLU>
    [id_stpoint_i,id_stpoint_p,id_stpoint_a,id_stpoint_l] = getMgenLevels( m, 'ID_STPOINT' );  %#ok<ASGLU>
    [s_stbound_i,s_stbound_p,s_stbound_a,s_stbound_l] = getMgenLevels( m, 'S_STBOUND' );  %#ok<ASGLU>
    [v_petiole_i,v_petiole_p,v_petiole_a,v_petiole_l] = getMgenLevels( m, 'V_PETIOLE' );  %#ok<ASGLU>
    [id_boundary_i,id_boundary_p,id_boundary_a,id_boundary_l] = getMgenLevels( m, 'ID_BOUNDARY' );  %#ok<ASGLU>
    [s_boundary_i,s_boundary_p,s_boundary_a,s_boundary_l] = getMgenLevels( m, 'S_BOUNDARY' );  %#ok<ASGLU>
    [id_subdiv6_i,id_subdiv6_p,id_subdiv6_a,id_subdiv6_l] = getMgenLevels( m, 'ID_SUBDIV6' );  %#ok<ASGLU>
    [id_ulsub_i,id_ulsub_p,id_ulsub_a,id_ulsub_l] = getMgenLevels( m, 'ID_ULSUB' );  %#ok<ASGLU>
    [id_leafbase_i,id_leafbase_p,id_leafbase_a,id_leafbase_l] = getMgenLevels( m, 'ID_LEAFBASE' );  %#ok<ASGLU>
    [s_leafbase_i,s_leafbase_p,s_leafbase_a,s_leafbase_l] = getMgenLevels( m, 'S_LEAFBASE' );  %#ok<ASGLU>
    [id_boundary2_i,id_boundary2_p,id_boundary2_a,id_boundary2_l] = getMgenLevels( m, 'ID_BOUNDARY2' );  %#ok<ASGLU>
    [id_olateral_i,id_olateral_p,id_olateral_a,id_olateral_l] = getMgenLevels( m, 'ID_OLATERAL' );  %#ok<ASGLU>
    [id_ilateral_i,id_ilateral_p,id_ilateral_a,id_ilateral_l] = getMgenLevels( m, 'ID_ILATERAL' );  %#ok<ASGLU>
    [v_sheath_i,v_sheath_p,v_sheath_a,v_sheath_l] = getMgenLevels( m, 'V_SHEATH' );  %#ok<ASGLU>
    [s_marginal2_i,s_marginal2_p,s_marginal2_a,s_marginal2_l] = getMgenLevels( m, 'S_MARGINAL2' );  %#ok<ASGLU>
    [id_wrapper_i,id_wrapper_p,id_wrapper_a,id_wrapper_l] = getMgenLevels( m, 'ID_WRAPPER' );  %#ok<ASGLU>

% Mesh type: general

%            Morphogen    Diffusion   Decay   Dilution   Mutant
%            --------------------------------------------------
%                KAPAR         ----    ----       ----     ----
%                KAPER         ----    ----       ----     ----
%                KBPAR         ----    ----       ----     ----
%                KBPER         ----    ----       ----     ----
%                 KNOR         ----    ----       ----     ----
%            POLARISER          0.5     0.1       ----     ----
%            STRAINRET         ----    ----       ----     ----
%               ARREST         ----    ----       ----     ----
%              ID_BASE         ----    ----       ----     ----
%              ID_PLUS         ----    ----       ----     ----
%               ID_MID         ----    ----       ----     ----
%          ID_PZMARGIN         ----    ----       ----     ----
%        ID_MIDVEINTIP         ----    ----       ----     ----
%              ID_EDGE         ----    ----       ----     ----
%                S_RIM          0.5       5       ----     ----
%               S_BASE         ----    ----       ----     ----
%           S_PZMARGIN        0.008    ----       ----     ----
%            S_MIDLINE         ----    ----       ----     ----
%               ID_RIM         ----    ----       ----     ----
%             ID_PMARG         ----    ----       ----     ----
%              ID_LEAF         ----    ----       ----     ----
%            ID_BOTTOM         ----    ----       ----     ----
%             ID_BLADE         ----    ----       ----     ----
%              S_PROX2          0.1      10       ----     ----
%                S_TIP          0.5       5       ----     ----
%      S_CELLDIVTHRESH         ----    ----       ----     ----
%             ID_FINAL         ----    ----       ----     ----
%           ID_LATERAL         ----    ----       ----     ----
%          ID_MARGINAL         ----    ----       ----     ----
%                ID_PZ         ----    ----       ----     ----
%           ID_SUBDIV5         ----    ----       ----     ----
%            ID_SHEATH         ----    ----       ----     ----
%               S_PROX        0.001       5       ----     ----
%             ID_NOTPZ         ----    ----       ----     ----
%             ID_DICOT         ----    ----       ----     ----
%           S_MARGINAL        0.008       5       ----     ----
%         ID_MARGINAL2         ----    ----       ----     ----
%             V_KPERPZ         ----    ----       ----     ----
%             V_KPARPZ         ----    ----       ----     ----
%                S_MID         ----    ----       ----     ----
%               ID_OPP         ----    ----       ----     ----
%          ID_MERISTEM         ----    ----       ----     ----
%             ID_EARLY         ----    ----       ----     ----
%            ID_MIDDLE         ----    ----       ----     ----
%              ID_LATE         ----    ----       ----     ----
%            ID_SECTOR         ----    ----       ----     ----
%           ID_OVERLAP         ----    ----       ----     ----
%           ID_CENTRAL         ----    ----       ----     ----
%             ID_BASE2         ----    ----       ----     ----
%           ID_SUBDIV1         ----    ----       ----     ----
%           ID_SUBDIV2         ----    ----       ----     ----
%              ID_OPEN         ----    ----       ----     ----
%           ID_SUBDIV3         ----    ----       ----     ----
%           ID_SUBDIV4         ----    ----       ----     ----
%            S_CENTRAL         ----    ----       ----     ----
%            S_AURICLE         ----    ----       ----     ----
%            S_OVERLAP         0.03     0.1       ----     ----
%                ID_UL         ----    ----       ----     ----
%                ID_LL         ----    ----       ----     ----
%               ID_PUL         ----    ----       ----     ----
%               ID_DUL         ----    ----       ----     ----
%            ID_KAPLAN         ----    ----       ----     ----
%           ID_MARGROW         ----    ----       ----     ----
%           ID_STIPULE         ----    ----       ----     ----
%           ID_STBOUND         ----    ----       ----     ----
%           ID_STPOINT         ----    ----       ----     ----
%            S_STBOUND        0.008    ----       ----     ----
%            V_PETIOLE         ----    ----       ----     ----
%          ID_BOUNDARY         ----    ----       ----     ----
%           S_BOUNDARY         ----    ----       ----     ----
%           ID_SUBDIV6         ----    ----       ----     ----
%             ID_ULSUB         ----    ----       ----     ----
%          ID_LEAFBASE         ----    ----       ----     ----
%           S_LEAFBASE         0.05    ----       ----     ----
%         ID_BOUNDARY2         ----    ----       ----     ----
%          ID_OLATERAL         ----    ----       ----     ----
%          ID_ILATERAL         ----    ----       ----     ----
%             V_SHEATH         ----    ----       ----     ----
%          S_MARGINAL2         0.03    ----       ----     ----
%           ID_WRAPPER         ----    ----       ----     ----


%%% USER CODE: MORPHOGEN INTERACTIONS

% In this section you may modify the mesh in any way that does not
% alter the set of nodes.

if (Steps(m)==0) && m.globalDynamicProps.doinit
%cell information 
%     m = leaf_setcellcolorinfo (m,...
%         'factor', c_cloneid_i,...
%         'mode', 'indexed',...
%         'colors', [1,1,1])
%     switch OPTIONS.clonetype
%         case 'random'
%             %Mark every cell with a random colour
%             numcells = getNumberOfCells(m);
%             randomColors = randcolor (numcells, [0 0 0], [1 1 1]);
%             m= leaf_setcellcolorinfo(m,'factor',c_cloneid_i,'colors',randomColors);
%             c_cloneid = 0:(numcells-1);
%         case 'biggest'
%             m = leafsetcellcolorinfo(m,'factor',c_cloneid_i, 'colors', [0 1 0; 1 0 0]);
%               % Set C_CLONEID to zero where you want green and 1 where you want red.
%             [~,perm] = sort( m.secondlayer.cellarea, 'descend' );
%             c_cloneid(:) = 0;
%             c_cloneid( perm([1 2]) ) = 1;
%     end
% 
%  
% %CELL DIV
%      CELL_AREA_AT_DIVISION = 0.0005;
%      s_celldivthresh_p(:) = CELL_AREA_AT_DIVISION;

    angles = atan2( m.nodes(:,2), m.nodes(:,1) );
    tol = 0.01;
    % Angles of the columns of vertexes are about -1.8440, -1.7042, -1.5691, -1.4298
    % The sectorStart and sectorEnd avlues must be chosen to includ the
    % middle two and exclude the outer two.

%Set up sector
    sectorStart = -1.51; 
     sectorEnd = -0.8;

   

    sectorNodes = (angles > sectorStart) & (angles < sectorEnd);
    id_sector_p = double( sectorNodes );
    [m,ok] = leaf_mgen_plotpriority( m, 'ID_SECTOR', 1, 0.5 );

    if OPTIONS.makecells && ~hasNonemptySecondLayer( m )
        % %make a grid
        %m = leaf_makesecondlayer (m, 'mode', 'latlong', 'divisions', [75 18] , 'subdivisions' , [1 1], 'plane', 'xy');
        m = leaf_makesecondlayer (m, 'mode', 'latlong' , 'divisions', [75 30] , 'subdivisions' , [1 1], 'plane', 'xy', 'hemisphere', 's');
    end
    m = leaf_plotoptions (m, 'bioAemptyalpha', 0);
            
 
%Set up nodes for the identity factors, MID is the midvein region, opp is
%the keyhole region, rim is the distal rim, BASE is the proximal rim.        
    id_mid_p=((m.nodes(:,2)>0.059)&(m.nodes(:,1)>-0.01)&(m.nodes(:,1)<0.01));
    id_opp_p=((m.nodes(:,2)<-0.059)&(m.nodes(:,1)>-0.015)&(m.nodes(:,1)<0.015)); %use this for midline SHOULD CHANGE NAME
    id_bottom_p=(m.nodes(:,3)<-0.013);
    id_rim_p(m.nodes(:,3)==max(m.nodes(:,3)))=1;
    id_overlap_p=((m.nodes(:,2)<-0.052)&(m.nodes(:,1)>-0.02)&(m.nodes(:,1)<0.02));
    id_wrapper_p=((m.nodes(:,2)<-0.058)&(m.nodes(:,1)>-0.02)&(m.nodes(:,1)<0.02));
    id_subdiv2_p=id_overlap_p;
       
%Set up nodes for plus and minum organisers, PLUS is the proximal rim
%(base), tip is at the tip of the modvein and is defined where rim and
%MID overlap. 
 switch OPTIONS.modelname
        case {'Grassleaf', 'nsheathmutant', 'bop'}    
            id_base_p=(m.nodes(:,3)<=-0.009);
        case {'dicot', 'prs','woxprs', 'Kaplan','Kwoxprs'}
        id_base_p=(m.nodes(:,3)<-0.009);   
 end
    
    id_plus_p=((m.nodes(:,3)<-0.009)&(m.nodes(:,3)>-0.01));
    id_base2_p=((m.nodes(:,3)<-0.0075)&(m.nodes(:,3)>=-0.009));
    id_midveintip_p = id_mid_p.*id_rim_p;
    id_leaf_p = (m.nodes(:,3) >=-0.009);
    id_overlap_p= id_overlap_p.*id_base_p;


% Clamp s_midline as 1 at MID (midvein region) and 0 at opp (keyhole region)
    s_midline_p=id_mid_p;
    m.morphogenclamp( (id_mid_p==1), s_midline_i ) = 1;
    m = leaf_mgen_conductivity(m, s_midline_i, 0.05);    
    m = leaf_mgen_absorption(m, s_midline_i, 0.1);
    m = leaf_mgen_dilution(m, s_midline_i, 0);
            
% Clamp s_overlap 
    s_overlap_p=id_overlap_p;
    m.morphogenclamp( ((id_overlap_p==1)|(id_mid_p==1)), s_overlap_i ) = 1;
    m = leaf_mgen_conductivity(m, s_overlap_i, 0.03);   
    m = leaf_mgen_absorption(m, s_overlap_i, 0.1);
    m = leaf_mgen_dilution(m, s_overlap_i, 0);
        

%Fix the base and overlap to simulate the attachment to the base of the flower

    m = leaf_fix_vertex( m, 'vertex', id_base_p==1, 'dfs', 'z' );
    m = leaf_fix_vertex( m, 'vertex', id_overlap_p==1, 'dfs', 'yz');

    
end

%Parameters
    Gstart=0.32; %start of growth
    EarlyStop =  0.8; % 
    GenAct = 0.15;
    LeafZone = 0.65; % 

    
switch OPTIONS.modelname
     case {'Grassleaf', 'nsheathmutant', 'bop'}
         MiddleStop = 1.15;
         LateStop=1.25; ... 
         FinalStop=1.4;
     case {'dicot', 'prs','woxprs', 'Kaplan','Kwoxprs'}
          MiddleStop = 1.15; 
          LateStop=1.35;... 
          FinalStop=1.35;
end
   
    
%define pz and nsheath domains
if (realtime >=GenAct) && (realtime < GenAct+dt )
   switch OPTIONS.modelname
     case {'Grassleaf', 'nsheathmutant', 'bop'}
        id_dicot_p(:) = 0;
        id_kaplan_p(:) = 0;
        id_margrow_p(:)= 0;
     case {'dicot', 'prs','woxprs'}
        id_dicot_p(:) = 1;
        id_kaplan_p(:) = 0;
        id_margrow_p(:)= 0;
     case {'Kaplan','Kwoxprs'}
        id_dicot_p(:) = 1;
        id_kaplan_p(:) = 1;
        id_margrow_p(:)= 0;
   end

 
   switch OPTIONS.modelname
       case {'Grassleaf', 'bop'}
           %set up central, lateral and marginal domains.  Blade corresponds
           %to all three.
           id_central_p = id_leaf_l.*(s_midline_l > 0.62);
           id_marginal_p = id_leaf_l.*(s_overlap_l>0.75);
           id_lateral_p = id_leaf_l.*((id_central_p+id_marginal_p) <0.1); 
           id_pz_p = id_leaf_l;
           id_blade_p = id_pz_p;
           id_marginal2_p = id_overlap_p;
       case 'nsheathmutant'
           id_central_p = id_leaf_l.*(s_midline_l > 0.62);
           id_marginal_p = id_leaf_l.*(s_overlap_l>0.75);
           id_lateral_p = id_leaf_l.*((id_central_p+id_marginal_p) <0.1); 
           id_marginal_p(:) = 0;
           id_pz_p=(s_overlap_p<=0.75).*id_leaf_l;
           id_meristem_p =(s_overlap_p>0.75) ;
           id_blade_p = id_pz_p;
       case 'prs'
           id_central_p = id_leaf_l.*(s_midline_l > 0.9);
           id_marginal_p(:) = 0;
           id_lateral_p = id_leaf_l.*(s_midline_l>=0.62).*(s_midline_l<=0.9);
           id_olateral_p = id_lateral_p.*(s_midline_l<0.7);
           id_ilateral_p=id_lateral_p.*(~id_olateral_p);
           id_pz_p = id_leaf_l.*(id_central_p + id_lateral_p);
           id_stbound_p = id_leaf_l.*(~id_pz_p).*(s_midline_l>0.58); %RICO
           id_blade_p = id_pz_p;
        case {'woxprs','Kwoxprs'} 
           id_central_p = id_leaf_l.*(s_midline_l > 0.9);
           id_marginal_p(:) = 0;
           id_lateral_p = id_leaf_l.*(s_midline_l>=0.65).*(s_midline_l<=0.9); 
           id_ilateral_p=id_lateral_p;
           id_pz_p = id_leaf_l.*(id_central_p + id_lateral_p);
           id_blade_p = id_pz_p;
       case {'dicot', 'Kaplan'}   
           id_central_p = id_leaf_l.*(s_midline_l > 0.9);
           id_marginal_p = id_leaf_l.*(s_midline_l>0.52).*(s_midline_l<0.62); %RICO
           id_lateral_p = id_leaf_l.*(~id_marginal_p).*(s_midline_l<=0.9).*(s_midline_l>0.52); 
           id_olateral_p = id_lateral_p.*(s_midline_l<0.7); 
           id_ilateral_p=id_lateral_p.*(~id_olateral_p);
           id_stipule_p = id_marginal_p.*(s_midline_l<0.58); %RICO
           id_stbound_p = id_marginal_p.*(~id_stipule_p).*(s_midline_l<0.62); %RICO
           id_stpoint_p = id_stipule_p.*id_rim_p; %RICO
           id_pz_p = id_leaf_l.*(id_central_p + id_lateral_p+ id_marginal_p);
           id_blade_p = id_pz_p;

   end
 id_notpz_p = (id_pz_p<0.1);
end

if (realtime >=GenAct+dt) && (realtime < GenAct+2*dt )
     
   switch OPTIONS.modelname
       case{'Grassleaf', 'bop'}
           id_pzmargin_p=id_pz_p.*((m.nodes(:,2)<-0.058)&(m.nodes(:,1)>0.005));
           id_pzmargin_p=id_pzmargin_p + id_pz_p.*((m.nodes(:,2)>-0.058)&(m.nodes(:,2)<-0.04) &(m.nodes(:,1)<-0.005) &(m.nodes(:,1)>-0.04));
       case 'nsheathmutant'
           id_pzmargin_p = id_pz_p.*(s_overlap_l>0.64);
       case {'dicot',  'Kaplan'}
           id_pzmargin_p = id_pz_p.*((s_midline_l >0.52).*(s_midline_l<0.6)); 
           id_boundary2_p =  id_leaf_p.*((s_midline_l >=0.48).*(~id_pz_p));  
       case 'prs'
            id_pzmargin_p = id_pz_p.*((s_midline_l >=0.65).*(s_midline_l<0.78));  
       case {'woxprs','Kwoxprs'}
            id_pzmargin_p = id_pz_p.*((s_midline_l >=0.7).*(s_midline_l<0.85));  
            id_boundary_p = id_leaf_p.*(s_midline_l >=0.63).*(~id_pz_p);  
 
   end

% Clamp POLARISER to be 1 at PLUS and 0 at tip
        P=id_plus_p;
        m.morphogenclamp(((id_plus_p==1)|(id_midveintip_p==1)), polariser_i)=1; 
         
% Set up the properties of POLARISER
        m=leaf_mgen_conductivity(m, 'POLARISER', 0.5);
        m=leaf_mgen_absorption(m, 'POLARISER', 0.1);
    
 switch OPTIONS.modelname% 
     case {'Grassleaf', 'nsheathmutant', 'bop'}
 % Clamp s_mid as 1 at MID (midvein region)
        s_mid_p=id_mid_p;
        m.morphogenclamp( (id_mid_p ==1), s_mid_i ) = 1;
        m = leaf_mgen_conductivity(m, s_mid_i, 0.03);
        m = leaf_mgen_absorption(m, s_mid_i, 0.1);
        m = leaf_mgen_dilution(m, s_mid_i, 0);
% Clamp s_pzmargin as 1 at pzmargin and 0 at MID
         s_pzmargin_p=id_pzmargin_p;  %Petmargin needs  petmargin
         m.morphogenclamp( (id_pzmargin_p==1)|(id_mid_p ==1), s_pzmargin_i ) = 1;...
         m = leaf_mgen_conductivity(m, s_pzmargin_i, 0.008);
         m = leaf_mgen_absorption(m, s_pzmargin_i, 5); %
         m = leaf_mgen_dilution(m, s_pzmargin_i, 0);
     case {'dicot', 'prs','woxprs','Kaplan','Kwoxprs'}
% Clamp s_mid as 1 at MID (midvein region)  
        s_mid_p=id_mid_p;
        m.morphogenclamp( (id_mid_p ==1), s_mid_i ) = 1; ...
        m = leaf_mgen_conductivity(m, s_mid_i, 0.017);... 
        m = leaf_mgen_absorption(m, s_mid_i, 0.1);
        m = leaf_mgen_dilution(m, s_mid_i, 0);  
 % Clamp s_pzmargin as 1 at pzmargin 
         s_pzmargin_p=id_pzmargin_p;  %Petmargin needs  petmargin
         m.morphogenclamp( (id_pzmargin_p==1), s_pzmargin_i ) = 1;...
         m = leaf_mgen_conductivity(m, s_pzmargin_i, 0.008);
         m = leaf_mgen_absorption(m, s_pzmargin_i, 5); %
         m = leaf_mgen_dilution(m, s_pzmargin_i, 0);
         
% Clamp s_stbound as 1 at petmargin    
         s_stbound_p=id_stbound_p;  
         m.morphogenclamp( (id_stbound_p==1), s_stbound_i ) = 1;...
         m = leaf_mgen_conductivity(m, s_stbound_i, 0.008);
         m = leaf_mgen_absorption(m, s_stbound_i, 5); %
         m = leaf_mgen_dilution(m, s_stbound_i, 0);
         
   end    

% Clamp s_boundary as 1 at boundary  
         s_boundary_p=id_boundary_p;  %Petmargin needs  petmargin
         m.morphogenclamp( (id_boundary_p==1), s_boundary_i ) = 1;...
         m = leaf_mgen_conductivity(m, s_boundary_i, 0.008);
         m = leaf_mgen_absorption(m, s_boundary_i, 5); %
         m = leaf_mgen_dilution(m, s_boundary_i, 0);    
            
% Clamp s_central as 1 at CENTRAL 
        s_central_p=id_central_p;
        m.morphogenclamp( (id_central_p==1), s_central_i ) = 1;
        m = leaf_mgen_conductivity(m, s_central_i, 0.02);
        m = leaf_mgen_absorption(m, s_central_i, 0.1);
        m = leaf_mgen_dilution(m, s_central_i, 0);
 
%stop diffusion of midline 
        m = leaf_mgen_conductivity(m, s_midline_i, 0.0);
        m = leaf_mgen_absorption(m, s_midline_i, 0);
             
         
 % Clamp s_marginal as 1 at pzmargin and 0 at MID
         s_marginal_p=id_pzmargin_p.*id_marginal_p;  
         m.morphogenclamp((id_pzmargin_p==1)|(id_mid_p ==1),  s_marginal_i ) = 1;
         m = leaf_mgen_conductivity(m, s_marginal_i, 0.008);
         m = leaf_mgen_absorption(m, s_marginal_i, 5); 
         m = leaf_mgen_dilution(m, s_marginal_i, 0);


% Clamp s_marginal2 in overlap
    s_marginal2_p=id_marginal2_p;
    m.morphogenclamp((id_marginal2_p==1)|(id_mid_p==1), s_marginal2_i ) = 1;
    m = leaf_mgen_conductivity(m, s_marginal2_i, 0.03);   
    m = leaf_mgen_absorption(m, s_marginal2_i, 0.1);
    m = leaf_mgen_dilution(m, s_marginal2_i, 0);
        

         
 % Clamp s rim as 1 at rim and 0 at BASE
         s_rim_p=id_rim_p.*id_pz_p;
         m.morphogenclamp( (id_rim_p ==1)|(id_base_p ==1), s_rim_i ) = 1;
         m = leaf_mgen_conductivity(m, s_rim_i, 0.5);
         m = leaf_mgen_absorption(m, s_rim_i, 5);
         m = leaf_mgen_dilution(m, s_rim_i, 0);
         
% Clamp s tip as 1 at tip and 0 at BASE
         s_tip_p=id_midveintip_p.*id_pz_p;
         m.morphogenclamp( (id_midveintip_p ==1)|(id_base_p ==1), s_tip_i ) = 1;
         m = leaf_mgen_conductivity(m, s_tip_i, 0.5);
         m = leaf_mgen_absorption(m, s_tip_i, 5);
         m = leaf_mgen_dilution(m, s_tip_i, 0);
        
% %Clamp s base as 1 at BASE and 0 at rim (not used)
        s_base_p=id_base_p;
        m.morphogenclamp( (id_base_p ==1)|(id_rim_p==1), s_base_i ) = 1; 
        m = leaf_mgen_conductivity(m, s_base_i, 0.02);     
        m = leaf_mgen_absorption(m, s_base_i, 0.1);         
        m = leaf_mgen_dilution(m, s_base_i, 0);
  
%Clamp s pmf as 1 at BASE Note s_prox continues to diffuse
        s_prox_p=id_base_p;
        m.morphogenclamp( (id_base_p ==1)|(id_midveintip_p==1), s_prox_i ) = 1; 
        m = leaf_mgen_conductivity(m, s_prox_i, 0.001);      
        m = leaf_mgen_absorption(m, s_prox_i, 5);           
        m = leaf_mgen_dilution(m, s_prox_i, 0);


%zero the growth rates (not needed) 
   kapar_p(:) =0; 
   kbpar_p(:) =0; 
   kaper_p(:) =0; 
   kbper_p(:) =0; 
                      
 end


 
if realtime>=Gstart-2*dt && (realtime < Gstart-dt )
     id_subdiv2_p = id_subdiv2_p.*(s_rim_l>0.9);
end
 
if realtime>=Gstart-2*dt
   
        m = leaf_mgen_conductivity(m, s_base_i, 0.00);
        m = leaf_mgen_absorption(m, s_base_i, 0);
        m = leaf_mgen_conductivity(m, s_mid_i, 0.0);
        m = leaf_mgen_absorption(m, s_mid_i, 0);
        m = leaf_mgen_conductivity(m, s_central_i, 0.0);
        m = leaf_mgen_absorption(m, s_central_i, 0);
        m = leaf_mgen_conductivity(m, s_boundary_i, 0.0);... 
        m = leaf_mgen_absorption(m, s_boundary_i, 0);...
        id_subdiv1_p = (id_central_l+id_lateral_l).*id_base2_l; % subdivision domain.


end


if (realtime >=Gstart) && (realtime < EarlyStop ) 
    id_early_p(:) = 1.0;
else
    id_early_p(:) = 0.0;
end

if (realtime >EarlyStop) && (realtime < MiddleStop ) 
    id_middle_p(:) = 1.0;
else
    id_middle_p(:) = 0.0;
end


if (realtime >=MiddleStop) && (realtime < LateStop ) 
    id_late_p(:) = 1.0;
else
    id_late_p(:) = 0.0;
end

if (realtime >=LateStop) && (realtime < FinalStop ) 
    id_final_p(:) = 1.0;
    strainret_p = id_final_p;
else
    id_final_p(:) = 0.0;
end

% if


if (realtime >= EarlyStop-4*dt) && (realtime < EarlyStop-3*dt )
    id_subdiv3_p = (s_prox_l>0.3).*(id_central_l + id_plus_l);.... 
    
end

if (realtime >= EarlyStop-3*dt) && (realtime < EarlyStop-2*dt )
     id_subdiv6_p = id_pz_l.*(s_mid_l>0.5).*(s_prox_l>0.3); ...
            
end


switch OPTIONS.modelname% CHANGE NEW2
     case {'dicot', 'Kaplan', 'woxprs', 'prs','Kwoxprs'}
        if (realtime >= EarlyStop) && (realtime < EarlyStop+dt )
            id_leafbase_p = ((id_central_l + id_lateral_l +id_stbound_l +id_boundary_l).*((s_prox_l.*inh(0.6,s_mid_l).*pro(1,(s_boundary_l+ s_stbound_l)))>0.3)); 
                
            %Clamp s leafbase as 1 at BASE Note s_prox continues to diffuse
            s_leafbase_p=id_leafbase_p;
            m.morphogenclamp( (id_leafbase_p ==1|(id_midveintip_p==1)), s_leafbase_i ) = 1; ...
                m = leaf_mgen_conductivity(m, s_leafbase_i, 0.05);
            m = leaf_mgen_absorption(m, s_leafbase_i, 5);
            m = leaf_mgen_dilution(m, s_leafbase_i, 0);       

        end
                
        if (realtime >= MiddleStop) && (realtime < MiddleStop+dt )    
            P(id_stpoint_p==1)=0;
            m.morphogenclamp((id_stbound_p==1| (id_boundary2_p==1)|(id_stpoint_p==1)|(id_leafbase_p==1)), polariser_i)=1;
        end
    case {'Grassleaf', 'nsheathmutant', 'bop'}

        if (realtime >= EarlyStop-dt) && (realtime < EarlyStop )
                    id_subdiv2_p = (s_rim_l>0.8).*(id_lateral_p +id_marginal_p);.... subdivision domain
    
        end   


end


    if (realtime >= Gstart) && (realtime <FinalStop)
  
    Growbase=0.5; %basic growth rate
    Sthresh=0.7; %threshold for s_leafbase promoting growth
    kapar_p(:) = ...
        ...EARLY (PHASE 1)
                 4*Growbase*id_early_l.*id_blade_l... % basic early pd growth of blade
           ... grass
                .*pro(5, (s_prox_l>0.5).*inh(2,(s_prox_l-0.5).^2).*(0.93.*id_central_l +0.7*(id_lateral_l + id_marginal_l)).*inh(0.5, (1-s_mid_l)).*(id_dicot_l<0.1))...  mediolateral gradient in proximal growth promotion
                .*inh(4,s_pzmargin_l.*(id_dicot_l<0.1))... inhibit growth near margin to reduce bending back
                .*pro(5,(s_tip_l>0.2).*(1-s_mid_l).*(id_dicot_l<0.1))... promote distal growth to straighten tip
                .*inh(1.5, (s_prox_l<0.5).*(id_dicot_l<0.1))... inhibit distal growth to prevent bending back 
                .*inh(2,s_marginal_l.*(id_dicot_l<0.1))...  mediolateral gradient in growth rate
                .*inh(100, id_pzmargin_l.*id_marginal_l.*(id_dicot_l<0.1))...prevent outer margin of wt grass leaf from growing 
           ...dicot petiole-sheath
                .*pro(6, (s_prox_l>0.5).*inh(2,(s_prox_l-0.5).^2).*(id_central_l+1.2*id_lateral_l.*s_mid_l).*(id_ll_l<0.1).*id_dicot_l)...  mediolateral gradient in growth promotion   
                .*inh(1,(1-s_mid_l).*(id_ll_l<0.1).*(id_ul_l<0.1).*id_dicot_l)...  inhibit growth towards margin (not active after time 0.7 in petiole-leaf model)
                .*pro(1.5, (s_prox_l<=0.5).*s_rim_l.*(s_mid_l>0.5).*id_lateral_l.*id_dicot_l.*(id_ll_l<0.1).*(id_ul_l<0.1))... promote growth at rim to promote bending back (not active after time 0.7 in petiole-leaf model)  
                .*inh(100, id_marginal_l.*id_dicot_l)...prevent growth in marginal domain
             ...petiole-leaf
                .*pro(3, (s_prox_l<=0.5).*id_ll_l.* inh(2, (s_stbound_l>0.4)).*id_kaplan_l)...promote growth in lower leaf zone margins
                .*pro(7, id_ul_l.*inh(0.3, id_central_l).*id_kaplan_l)... promote growth of upper leaf zone
        ...MIDDLE (PHASE 2)
                  +4*Growbase*id_middle_l.*id_blade_l... % basic middle pd growth of blade
            ...grass
                .*pro(5.3, (s_prox_l>0.5).*inh(2,(s_prox_l-0.5).^2).*(id_central_l + 2*(id_lateral_l+id_marginal_l).*s_mid_l).*(id_dicot_l<0.1))... mediolateral gradient in proximal growth promotion 
                .*inh(2,(s_pzmargin_l>0.6).*(s_rim_l<0.7).*(id_dicot_l<0.1))... inhibit growth near pzmargin
                .*pro(1,(s_marginal_l>0.6).*(s_rim_l<0.7).*(id_dicot_l<0.1))... reduce growth inhibition near pzmargin in wt grass 
                .*pro(3, (s_prox_l<0.5).*s_prox_l.*(id_dicot_l<0.1))... promote proximal growth
                .*pro(0.5, (s_marginal_l>0.4).*(s_rim_l>0.8).*(id_wrapper_l<0.1).*(id_dicot_l<0.1))... promote marginal growth but not in wrapping edge
                .*inh(0.4,(s_rim_l>0.8).*(1-s_prox_l).*(s_tip_l<0.2).*(id_dicot_l<0.1))... inhibit growth of rim to cause inward bending 
                .*inh(100, id_pzmargin_l.*id_marginal_l.*(id_dicot_l<0.1))...prevent outer margin of wt grass leaf from growing 
                .*inh(3,(s_tip_l>0.2).*(s_mid_l>0.8).*(id_dicot_l<0.1))... inhibit growth near tip
            ...dicot
                .*pro(6, id_dicot_l.*(s_leafbase_l>Sthresh).*(id_lateral_l +id_central_l).*inh(0.5, s_mid_l).*(id_kaplan_l<0.1))... mediolateral gradient in growth promotion 
                .*inh(100,id_leafbase_l.*id_dicot_l)... inhibit growth at leaf base to prevent growth conflict with surrounding ring
                .*inh(100, id_marginal_l.*id_dicot_l)... prevent widening of marginal domain
                .*inh(10,(s_leafbase_l<Sthresh).*s_tip_l.*id_dicot_l.*(id_kaplan_l<0.1))... reduce growth in distal lamina
                .*inh(100, id_stbound_l)... inhibit growth at stipule-lateral boundary
             ...kaplan
               ... .*pro(1, id_kaplan_l.*id_dul_l.*(s_tip_l<0.5).*inh(5, id_stipule_l))... promote distal growth but not in stipule after time 0.7
               .*pro(1.5, id_kaplan_l.*id_dul_l.*inh(5, id_stipule_l))...
               ....*inh(100, (id_ll_l +id_pul_l+(s_tip_l>0.5)).* id_kaplan_l)... inibit growth in lower leaf zone, proximal upper leaf zone, and tip after time 0.7
               .*inh(100, (id_ll_l +id_pul_l).* id_kaplan_l)...
                .*inh(1, s_tip_l.* id_kaplan_l)...
           ...LATE (PHASE 3)
                +4*Growbase*id_late_l.*id_pz_l... promote growth by mediolateral domains
            ...grass
                .*inh(20, id_leafbase_l.*(id_dicot_l<0.1))... inhibit growth at base of ring
                .*pro(8, id_sheath_l.*(s_leafbase_l>0.5).*(id_dicot_l<0.1))...  promote growth in sheath length
                .*pro(8,id_blade_l.*(s_prox2_l>0.5).*(s_prox2_l<0.9).*pro(0.5, s_marginal_l.*(s_rim_l>0.8).*s_rim_l).*(id_dicot_l<0.1))... promote growth in proximal blade enhanced marginally
                .*pro(3,id_blade_l.*(s_tip_l>0.1).*(s_prox2_l<0.5).*s_rim_l.*inh(1, s_mid_l).*(id_dicot_l<0.1))... open up tip
                .*inh(1,(s_tip_l<0.05).*(s_prox2_l<0.5).*(id_dicot_l<0.1))...inhibit growth in blade
                .*inh(100, id_pzmargin_l.*id_marginal_l.*(id_dicot_l<0.1))...prevent outer margin of wt grass leaf from growing 
           ...dicot
                .*pro(5, id_sheath_l.*id_dicot_l.*(id_kaplan_l<0.1))... promote petiole growth in petiole length 
                .*pro(5,id_blade_l.*s_prox2_l.*pro(0.7, (s_rim_l>0.95)).*id_dicot_l.*(id_kaplan_l<0.1))...promote growth in lamina length proximally 
                .*inh(3, s_tip_l.*id_dicot_l.*(id_kaplan_l<0.1))... inhibit growth at tip
                .*inh(0.5, s_mid_l.*id_dicot_l.*(id_kaplan_l<0.1))...inibit growth towards midline
                .*inh(10, (s_leafbase_l>0.9).*id_dicot_l.*(id_kaplan_l<0.1))...inhibit growth at base of leaf
                .*pro(5,id_stipule_l.*(s_prox_l<0.3))... promote stipule growth in length following reorientation of polarity
                .*inh(100, id_stbound_l)...inhibit growth at stipule-lateral boundary
           ...kaplan
                .*pro(1,id_pul_l.*(s_prox2_l>0.1).*id_kaplan_l)... promote petiole growth 
        ...FINAL (PHASE 4)
                +4*Growbase*id_final_l.*id_pz_l... promote growth by mediolateral domains
            ...grass
                .*inh(20, id_leafbase_l.*(id_dicot_l<0.1))... inhibit growth at base of ring
                .*pro(8, id_sheath_l.*(s_leafbase_l>0.5).*(id_dicot_l<0.1))...  promote growth in sheath length
                .*pro(8,id_blade_l.*(s_prox2_l>0.5).*(s_prox2_l<0.9).*pro(0.5, s_marginal_l.*(s_rim_l>0.8).*s_rim_l).*(id_dicot_l<0.1))... promote growth in proximal blade enhanced marginally
                .*inh(1, id_blade_l.*(s_prox2_l<0.5).*pro(1, (s_tip_l>0.3)).*(id_dicot_l<0.1))...inhibit growth in blade
                .*inh(100, id_pzmargin_l.*id_marginal_l.*(id_dicot_l<0.1))...prevent outer margin of wt grass leaf from growing 
        ...BASE GROWTH 
                 + Growbase*id_bottom_l... 
            ...grass
                .*pro(4, (s_marginal2_l>0.8).*(0.5*id_early_l+ id_middle_l+ id_late_l+ id_final_l).*(id_wrapper_l<0.1).*(id_dicot_l<0.1))... keep shape of base 
                .*pro(6, (s_mid_l>0.8).*id_early_l.*(id_dicot_l<0.1))...
                .*pro(2, id_late_l.*(id_dicot_l<0.1))... was 6 stops base growing too much ;...
                .*pro(1, id_middle_l.*(id_dicot_l<0.1));... was 6 stops base growing too much 
 
              
    kbpar_p(:)= kapar_p...
             ...dicot
                .*inh(1, id_stipule_l.*id_dicot_l.*id_late_l)... bend out stipules by inhibiting growth on abaxial side
             ...grass
                +0.2*id_early_l.*(id_dicot_l<0.1);... curve primordium inwards by promoting abaxial growth
                
    kapar_p(:)= kapar_p;....

    kbper_p (:)=...
         ...EARLY (PHASE 1) 
                Growbase*id_early_l.*id_blade_l... 
                .*inh(1, s_mid_l.*(id_dicot_l<0.1))... )... .*id_central_linhibit growth in width of central zone
                ....*inh(1, s_mid_l.*id_central_l.*id_dicot_l)... inhibit growth in width of central zone
                .*inh(1, s_mid_l.*id_central_l.*(id_ul_l<0.1).*id_dicot_l)... inhibit growth in width of central zone but not in upper leaf zone after time 0.7 in petiole-leaf mode
                .*inh(1, id_mid_l.*(id_ul_l<0.1))...reduce midline width but not in upper leaf zone after time 0.7 in petiole-leaf model
                .*inh(5, s_tip_l.*(id_ul_l<0.1))... reduce tip width and bending but not in upper leaf zone after time 0.7 in petiole-leaf model
           ...grass
                .*pro(25, (s_rim_l>0.8).*inh(1, s_pzmargin_l).*inh(4, s_marginal_l).*inh(2, s_mid_l).*inh(100, id_pzmargin_l.*id_marginal_l).*(id_dicot_l<0.1))...  .*inh(0.8, s_mid_l)  
            ...dicot
                .*pro(6, (s_rim_l>0.7).*(id_central_l + id_lateral_l).*id_dicot_l)... promote growth in rim width
             ...kaplan 
              .*pro(1.5,id_dul_l.*pro(2, s_tip_l.*(id_mid_l<0.1)).*inh(1, id_central_l.*(s_tip_l<0.5)).*id_kaplan_l)...promote growth in distal upper leaf zone of petiole-leaf model
        ... MIDDLE (PHASE 2)
                 +Growbase*id_middle_l.*id_blade_l...  
          ...grass
                .*inh(1, (s_mid_l+id_mid_l).*(id_dicot_l<0.1))... inibit growth in width near midline
                .*pro(30, (s_rim_l>0.8).*inh(4, s_tip_l).*(s_tip_l<0.2).*inh(4, s_pzmargin_l).*pro(1.5, s_marginal_l).*inh(1, (s_marginal_l>0.6).*s_marginal_l).*inh(100, id_pzmargin_l.*id_marginal_l).*(id_dicot_l<0.1))...  good overlap with 20 rim growth, dicot reduced.
         ...dicot
                .*pro(20,id_stipule_l.*(s_rim_l>0.5).*(s_stbound_l<0.7).*id_dicot_l)... promote stipule growth in length
                ....*pro(2, (s_leafbase_l<Sthresh).*pro(1, id_olateral_l).*pro(1, s_rim_l).*inh(3,s_tip_l).*id_dicot_l.*(id_kaplan_l<0.1)).....promote growth in width of lamina at rim
                .*inh(100, id_stbound_l)... inhibit growth at stipule-lateral boundary
            ...kaplan
                .*inh(1, (s_mid_l+id_mid_l).*id_kaplan_l)...  inibit growth in width near midline RICO
                .*inh(100, id_ll_l.*(id_central_l + id_lateral_l).*id_kaplan_l)... inibit growth in width of lower leaf zone
                .*pro(5, id_dul_l.*(s_mid_l<0.95).*id_kaplan_l)...
        ... LATE (PHASE 3)
                +Growbase*id_late_l.*id_pz_l... 
           ...grass
               .*pro(2, id_blade_l.*s_prox2_l.*(s_rim_l>0.8).*(id_dicot_l<0.1))...
           ...dicot
                .*pro(8, id_blade_l.*(s_prox2_l+(1-s_tip_l)).*id_lateral_l.*pro(1, id_olateral_l).*(s_rim_l>0.95).*pro(1, s_rim_l).*inh(3,s_tip_l).*id_dicot_l.*(id_kaplan_l<0.1)).....promote growth in width of lamina at rim
                .*pro(1,id_leafbase_l.*(id_kaplan_l<0.1).*id_dicot_l)...promote growth in leaf base width
            ...kaplan
                .*pro(0.5,s_prox2_l.*id_kaplan_l)... promote growth in width at base of leaf
                .*inh(1, id_kaplan_l.*(10*id_mid_l +2*s_mid_l +s_tip_l + 2*id_pul_l))...reduce midline,tip and petiole width
               .*pro(10, id_dul_l.*(s_mid_l<0.95).*id_kaplan_l)...
         ... FINAL (PHASE 4)
                +Growbase*id_final_l.*id_pz_l... 
        ... BASE GROWTH
                + Growbase*(id_pz_l<0.1)...BASE GROWTH 
                .*inh(2, (s_mid_l>0.8).*id_final_l)... 
             ...grass
                .*inh(1, s_mid_l.*id_central_l.*(id_dicot_l<0.1))...
                .*inh(1, id_mid_l.*(id_dicot_l<0.1))...
                .*inh(1, s_mid_l.*id_dicot_l.*id_late_l)...
                .*pro(1, id_middle_l.*(id_dicot_l<0.1));... 
                   
               
    kaper_p (:)=  kbper_p...
                +3*id_late_l.*id_blade_l.*(id_dicot_l<0.1)... promote growth on inner surfae of blade
                +4*id_final_l.*id_marginal_l.*s_rim_l.*(s_rim_l>0.8).*(s_prox2_l<0.9).*(s_prox2_l>0.5).*id_blade_l.*(id_dicot_l<0.1)...promote growth on inner surfae of blade near marginal of wt
                  +(id_central_l +id_lateral_l).*(1-s_tip_l).*id_dicot_l.*id_middle_l.*(s_leafbase_l<Sthresh).*(id_kaplan_l<0.1);... promote growth on adaxial side of dicot lamina
                 
                  
    kbper_p (:)=  kbper_p;
                 
              
    knor_p(:) = 0.3;
    end

    if realtime > FinalStop % stop growth at end
        kapar_p (:)= 0;
        kbpar_p (:)= 0;
        kaper_p (:)= 0;
        kbper_p (:)= 0;
        knor_p(:) = 0;
        
    end


if (realtime >=LeafZone) && (realtime < LeafZone+dt )
        switch OPTIONS.modelname
            case {'Kaplan','Kwoxprs'}
            id_ulsub_p = (s_tip_l>0.15);  
        end    
end

if (realtime >=(LeafZone+0.05)) && (realtime < (LeafZone+0.05)+dt )
 switch OPTIONS.modelname
       case {'Grassleaf', 'bop', 'nsheathmutant'}
           %set up the LL and UL domains based on the forerunner tip in the
           %maize model 
           id_ul_p = 0.01*(s_tip_l>0.22);
           id_dul_p = 0.01*(s_tip_l>0.35);
           id_pul_p = 0.01*id_ul_p.*(~id_dul_p); %was 0.001 
           id_ll_p = 0.01*id_pz_l.*(id_ul_p<1);
       case { 'dicot', 'prs','woxprs'}
           %set up the LL and UL domains based on the forerunner tip in the
           %maize model 
           id_ul_p = 0.01*(s_tip_l>0.3);
           id_dul_p = 0.01*(s_tip_l>0.4);
           id_pul_p = 0.01*id_ul_p.*(~id_dul_p); %was 0.001 
           id_ll_p = 0.01*id_pz_l.*(id_ul_p<1);
           v_petiole_p=((s_prox_l.*inh(2.5, s_mid_l))>0.08).*(id_central_l +id_lateral_l);... was 2
       case { 'Kaplan','Kwoxprs'}
           %set up the LL and UL domains based on the forerunner tip in the
           %maize model 
           id_ul_p = (s_tip_l>0.22);
           id_dul_p = (s_tip_l>0.35);
           id_pul_p = id_ul_p.*(~id_dul_p); %was 0.001 
           id_ll_p = id_pz_l.*(id_ul_p<1);

 end    
end
if (realtime >=MiddleStop-2*dt)&&(realtime<MiddleStop-dt)
     id_subdiv5_p = (id_pz_l.*((s_prox_l.*pro(0.5,s_rim_l).*inh(1.5,s_mid_l))>= 0.09));
 end

if (realtime >=MiddleStop)&&(realtime<MiddleStop+dt)
    switch OPTIONS.modelname
       case{'Grassleaf', 'nsheathmutant'}
  
     PetBound=0.2; ....
     id_sheath_p = (id_pz_l.*((s_prox_l.*pro(1.5,s_rim_l).*inh(0.5,s_mid_l).*inh(1, s_marginal_l))>= PetBound));%set petiole boundary|id_pzmargin_p
     id_blade_p = id_pz_l.*(id_sheath_p<0.1); %SHEATH inhibits BLADE
     id_leafbase_p=id_pz_l.*((s_prox_l.*pro(0.3, s_pzmargin_l))>0.3);
     id_sheath_p =  id_sheath_p.*(~id_leafbase_p);
     
     %set up prox2
     s_prox2_p=id_sheath_p;
               m.morphogenclamp( (id_sheath_p ==1), s_prox2_i ) = 1; ...
              m = leaf_mgen_conductivity(m, s_prox2_i, 0.1);   
              m = leaf_mgen_absorption(m, s_prox2_i, 10);           
              m = leaf_mgen_dilution(m, s_prox2_i, 0);
              
     %Clamp s leafbase as 1 at BASE Note s_prox continues to diffuse
            s_leafbase_p=id_leafbase_p;
            m.morphogenclamp( (id_leafbase_p ==1|(id_midveintip_p==1)), s_leafbase_i ) = 1; ...
                m = leaf_mgen_conductivity(m, s_leafbase_i, 0.05);
            m = leaf_mgen_absorption(m, s_leafbase_i, 5);
            m = leaf_mgen_dilution(m, s_leafbase_i, 0);
  
         
         case 'bop'

     id_leafbase_p=id_pz_l.*(s_prox_l>0.25);
     id_blade_p = id_pz_l.*(id_leafbase_p<0.1); 
     
         %Clamp s leafbase as 1 at BASE Note s_prox continues to diffuse
            s_leafbase_p=id_leafbase_p;
            m.morphogenclamp( (id_leafbase_p ==1|(id_midveintip_p==1)), s_leafbase_i ) = 1; ...
                m = leaf_mgen_conductivity(m, s_leafbase_i, 0.05);
            m = leaf_mgen_absorption(m, s_leafbase_i, 5);
            m = leaf_mgen_dilution(m, s_leafbase_i, 0);
                
       
        case{'dicot' , 'prs','woxprs', 'Kaplan','Kwoxprs'}

     id_sheath_p =id_pz_l.*(s_leafbase_l>0.65);...
     id_blade_p = id_pz_l.*(id_sheath_p<0.1).*(id_leafbase_p<0.1); %SHEATH inhibits BLADE
     id_sheath_p((id_stipule_p==1)|(id_stbound_p==1))= 0;... RICO
     id_leafbase_p((id_stipule_p==1)|(id_stbound_p==1))= 0;... RICO
     id_sheath_p =  id_sheath_p.*(~id_leafbase_p);
     v_sheath_p=id_sheath_p;
     
     %set up prox2
     s_prox2_p=id_sheath_p;
               m.morphogenclamp( (id_sheath_p ==1), s_prox2_i ) = 1; ...
              m = leaf_mgen_conductivity(m, s_prox2_i, 0.1);   
              m = leaf_mgen_absorption(m, s_prox2_i, 10);           
              m = leaf_mgen_dilution(m, s_prox2_i, 0);
              
        

    end
end
 
if (realtime >=LateStop-2*dt)&&(realtime<LateStop-dt)
     id_subdiv4_p = id_blade_l.*(s_prox2_l>0.6);
 end

 if (realtime >=LateStop)&&(realtime<LateStop+dt)
     id_auricle_p = id_blade_l.*(s_prox2_l>0.6);
 end
 

 v_kparpz_p = kapar_p.*id_pz_l;
 v_kperpz_p = kaper_p.*id_pz_l;
%%% END OF USER CODE: MORPHOGEN INTERACTIONS

%%% SECTION 3: INSTALLING MODIFIED VALUES BACK INTO MESH STRUCTURE
%%% AUTOMATICALLY GENERATED CODE: DO NOT EDIT.
    m.morphogens(:,polariser_i) = P;
    m.morphogens(:,kapar_i) = kapar_p;
    m.morphogens(:,kaper_i) = kaper_p;
    m.morphogens(:,kbpar_i) = kbpar_p;
    m.morphogens(:,kbper_i) = kbper_p;
    m.morphogens(:,knor_i) = knor_p;
    m.morphogens(:,strainret_i) = strainret_p;
    m.morphogens(:,arrest_i) = arrest_p;
    m.morphogens(:,id_base_i) = id_base_p;
    m.morphogens(:,id_plus_i) = id_plus_p;
    m.morphogens(:,id_mid_i) = id_mid_p;
    m.morphogens(:,id_pzmargin_i) = id_pzmargin_p;
    m.morphogens(:,id_midveintip_i) = id_midveintip_p;
    m.morphogens(:,id_edge_i) = id_edge_p;
    m.morphogens(:,s_rim_i) = s_rim_p;
    m.morphogens(:,s_base_i) = s_base_p;
    m.morphogens(:,s_pzmargin_i) = s_pzmargin_p;
    m.morphogens(:,s_midline_i) = s_midline_p;
    m.morphogens(:,id_rim_i) = id_rim_p;
    m.morphogens(:,id_pmarg_i) = id_pmarg_p;
    m.morphogens(:,id_leaf_i) = id_leaf_p;
    m.morphogens(:,id_bottom_i) = id_bottom_p;
    m.morphogens(:,id_blade_i) = id_blade_p;
    m.morphogens(:,s_prox2_i) = s_prox2_p;
    m.morphogens(:,s_tip_i) = s_tip_p;
    m.morphogens(:,s_celldivthresh_i) = s_celldivthresh_p;
    m.morphogens(:,id_final_i) = id_final_p;
    m.morphogens(:,id_lateral_i) = id_lateral_p;
    m.morphogens(:,id_marginal_i) = id_marginal_p;
    m.morphogens(:,id_pz_i) = id_pz_p;
    m.morphogens(:,id_subdiv5_i) = id_subdiv5_p;
    m.morphogens(:,id_sheath_i) = id_sheath_p;
    m.morphogens(:,s_prox_i) = s_prox_p;
    m.morphogens(:,id_notpz_i) = id_notpz_p;
    m.morphogens(:,id_dicot_i) = id_dicot_p;
    m.morphogens(:,s_marginal_i) = s_marginal_p;
    m.morphogens(:,id_marginal2_i) = id_marginal2_p;
    m.morphogens(:,v_kperpz_i) = v_kperpz_p;
    m.morphogens(:,v_kparpz_i) = v_kparpz_p;
    m.morphogens(:,s_mid_i) = s_mid_p;
    m.morphogens(:,id_opp_i) = id_opp_p;
    m.morphogens(:,id_meristem_i) = id_meristem_p;
    m.morphogens(:,id_early_i) = id_early_p;
    m.morphogens(:,id_middle_i) = id_middle_p;
    m.morphogens(:,id_late_i) = id_late_p;
    m.morphogens(:,id_sector_i) = id_sector_p;
    m.morphogens(:,id_overlap_i) = id_overlap_p;
    m.morphogens(:,id_central_i) = id_central_p;
    m.morphogens(:,id_base2_i) = id_base2_p;
    m.morphogens(:,id_subdiv1_i) = id_subdiv1_p;
    m.morphogens(:,id_subdiv2_i) = id_subdiv2_p;
    m.morphogens(:,id_open_i) = id_open_p;
    m.morphogens(:,id_subdiv3_i) = id_subdiv3_p;
    m.morphogens(:,id_subdiv4_i) = id_subdiv4_p;
    m.morphogens(:,s_central_i) = s_central_p;
    m.morphogens(:,s_auricle_i) = s_auricle_p;
    m.morphogens(:,s_overlap_i) = s_overlap_p;
    m.morphogens(:,id_ul_i) = id_ul_p;
    m.morphogens(:,id_ll_i) = id_ll_p;
    m.morphogens(:,id_pul_i) = id_pul_p;
    m.morphogens(:,id_dul_i) = id_dul_p;
    m.morphogens(:,id_kaplan_i) = id_kaplan_p;
    m.morphogens(:,id_margrow_i) = id_margrow_p;
    m.morphogens(:,id_stipule_i) = id_stipule_p;
    m.morphogens(:,id_stbound_i) = id_stbound_p;
    m.morphogens(:,id_stpoint_i) = id_stpoint_p;
    m.morphogens(:,s_stbound_i) = s_stbound_p;
    m.morphogens(:,v_petiole_i) = v_petiole_p;
    m.morphogens(:,id_boundary_i) = id_boundary_p;
    m.morphogens(:,s_boundary_i) = s_boundary_p;
    m.morphogens(:,id_subdiv6_i) = id_subdiv6_p;
    m.morphogens(:,id_ulsub_i) = id_ulsub_p;
    m.morphogens(:,id_leafbase_i) = id_leafbase_p;
    m.morphogens(:,s_leafbase_i) = s_leafbase_p;
    m.morphogens(:,id_boundary2_i) = id_boundary2_p;
    m.morphogens(:,id_olateral_i) = id_olateral_p;
    m.morphogens(:,id_ilateral_i) = id_ilateral_p;
    m.morphogens(:,v_sheath_i) = v_sheath_p;
    m.morphogens(:,s_marginal2_i) = s_marginal2_p;
    m.morphogens(:,id_wrapper_i) = id_wrapper_p;

%%% USER CODE: FINALISATION
% to set pol arrows white outside pz
  m = calcPolGrad(m);
    m.polsetfrozen = perVertextoperFE( m, id_notpz_p ) > 0.5;
% one shot subdivision

switch OPTIONS.modelname

case {'Grassleaf', 'nsheathmutant', 'bop'}
% 
   if meshAtTime( m, Gstart )... 
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m, 'morphogen','id_subdiv2',...
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
             
  
   end
%    
    if meshAtOrAfterTime( m, Gstart)&& meshAtOrBeforeTime( m, EarlyStop) %subdivide during early phase

        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m,'minabslength',0.018, 'morphogen','id_subdiv1',... was 0.02
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
            
            
    end
     
    
    if meshAtTime( m, EarlyStop )
        m = leaf_setproperty( m, 'surfacetension', 0 );
        
       m = leaf_subdivide( m, 'morphogen','id_subdiv2',... was 0.02
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');  
            
    end

   
      if meshAtOrAfterTime( m, EarlyStop)&& meshAtOrBeforeTime( m, MiddleStop) %subdivide in middle phase
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m, 'minabslength',0.05,'morphogen','id_middle',... was 0.03
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
      end
      
      
      if meshAtOrAfterTime( m, MiddleStop)&& meshAtOrBeforeTime( m, LateStop) %subdivide in middle phase
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m, 'minabslength',0.35,'morphogen','id_late',...
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
      end

    if meshAtOrAfterTime( m, MiddleStop-dt)&& meshAtOrBeforeTime( m, MiddleStop) %subdivide during early phase

        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m,'minabslength',0.018, 'morphogen','id_subdiv5',... was 0.02
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
            
            
    end
     
         
      if meshAtOrAfterTime( m, LateStop)
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m, 'minabslength',0.5,'morphogen','id_final',...% was 0.1 inabslength 0.35
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
    end
   


case {'dicot', 'prs','woxprs'}... DICOT leaf
         
    if meshAtOrAfterTime( m, Gstart)&& meshAtOrBeforeTime( m, EarlyStop) %subdivide in EARLY phase
        m = leaf_setproperty( m, 'surfacetension', 0 );

       m = leaf_subdivide( m, 'minabslength',0.02,'morphogen','id_early',... % 
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
    end
     
    if meshAtTime( m, EarlyStop-1*dt )
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m, 'morphogen','id_subdiv6',... was 0.02
                'min',0.8,'max',1.1,... 
                'mode','mid','levels','interp');
    end
    
    if meshAtTime( m, EarlyStop)
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m, 'morphogen','id_stipule',... was 0.02
                'min',0.8,'max',1.1,... 
                'mode','mid','levels','interp');
    end
   
     if meshAtOrAfterTime( m, EarlyStop)&& meshAtOrBeforeTime( m, MiddleStop) %subdivide in MIDDLE phase
        m = leaf_setproperty( m, 'surfacetension', 0 );

       m = leaf_subdivide( m, 'minabslength',0.06,'morphogen','id_middle',... % Was 0.07 RICO minsabslength defines smallest size to go to over period of time. 
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
            
       m = leaf_subdivide( m, 'minabslength',0.015,'morphogen','id_stipule',... % RICO minsabslength defines smallest size to go to over period of time. 
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
     end
     
 

 
        if meshAtOrAfterTime( m, MiddleStop)&& meshAtOrBeforeTime( m, LateStop) ...LATE subdivision
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m, 'minabslength',0.1,'morphogen','id_late',...% 
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
            
       m = leaf_subdivide( m, 'minabslength',0.03,'morphogen','id_stipule',... % minsabslength defines smallest size to go to over period of time. 
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
        end
    

   
case { 'Kaplan', 'Kwoxprs'}
              
%      
     if meshAtTime( m,LeafZone+0.01) %subdivide in middle phase % was LeafZone+0.01
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m,'morphogen','id_ulsub',... %minsabslength defines smallest size to go to over period of time. (s_prox_l <= 0.25).*(s_mid_l>=0.6)
                'min',0.8,'max',1.1,... 
                'mode','mid','levels','interp');
     end
     
        if meshAtOrAfterTime( m, LeafZone+0.05)&& meshAtOrBeforeTime( m, EarlyStop) 
        m = leaf_setproperty( m, 'surfacetension', 0 );
        m = leaf_subdivide( m, 'minabslength',0.025,'morphogen','id_early',...%
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
        end
    
    if meshAtOrAfterTime( m, EarlyStop)&& meshAtOrBeforeTime( m, MiddleStop) %MIDDLE subdivide in middle phase
        m = leaf_setproperty( m, 'surfacetension', 0 );

       m = leaf_subdivide( m, 'minabslength',0.07,'morphogen','id_middle',... %  minsabslength defines smallest size to go to over period of time. 
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
            
      m = leaf_subdivide( m, 'minabslength',0.015,'morphogen','id_stipule',... % minsabslength defines smallest size to go to over period of time. 
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
     end

        if meshAtOrAfterTime( m, MiddleStop)&& meshAtOrBeforeTime( m, LateStop) 
        m = leaf_setproperty( m, 'surfacetension', 0 );

        m = leaf_subdivide( m, 'minabslength',0.1,'morphogen','id_late',...% 
                'min',0.8,'max',1.1,...
                'mode','mid','levels','interp');
        end
end


% In this section you may modify the mesh in any way whatsoever.
%%% END OF USER CODE: FINALISATION

end

function [m,result] = ifCallbackHandler( m, fn, varargin )
    result = [];
    if exist(fn,'file') ~= 2
        return;
    end
    [m,result] = feval( fn, m, varargin{:} );
end


%%% USER CODE: SUBFUNCTIONS

% make POL arrows white outside pz domain

function [m,result] = GFtbox_Preplot_Callback( m, theaxes ) %#ok<DEFNU>
    result = [];
    % Your code here.
    [id_notpz_i,id_notpz_p] = getMgenLevels( m, 'ID_NOTPZ' );  %#ok<ASGLU>
    m.polsetfrozen = perVertextoperFE( m, id_notpz_p ) > 0.5;

end
  
    
function [m,result] = GFtbox_Postplot_Callback( m, theaxes ) %#ok<DEFNU>
    result = [];
    % Your code here.
    m.polsetfrozen(:) = false;
end


% Here you may write any functions of your own, that you want to call from
% the interaction function, but never need to call from outside it.
% Remember that they do not have access to any variables except those
% that you pass as parameters, and cannot change anything except by
% returning new values as results.
% Whichever section they are called from, they must respect the same
% restrictions on what modifications they are allowed to make to the mesh.

% The GFtbox_..._Callback routines can be deleted if you do not use them.
% Those that you retain will be automatically called by GFtbox at certain
% points in the simulation cycle.
% If you retain them, their headers specifying their arguments and results
% must not be altered.
% Standard name for a function to be called to decide whether to split a cell.
% function [m,splits,splitcentre,splitdirection] = GFtbox_Precellsplit_Callback( m, ci )
% % ci is a list of indexes of N cells to be considered for splitting.
% % splits will be a list of N booleans, specifying which of the given cells
% % should be split.
% % splitcentre is an N*3 array.  For cells which are to be split, the
% % corresponding row is a point through which the splitting line should
% % pass.  For other cells it should be zero.
% % splitdirection is an N*3 array.  For cells which are to be split, the
% % corresponding row is the normal to the splitting plane.  For other cells
% % it is zero.
% % If a cell should be split but you do not want to specify a splitting
% % plane, set the corresponding rows of splitcentre and splitdirection to
% % zero.
%     
% 
%     % Get the morphogen for determining splitting threshold.
%     [s_celldivthresh_i,s_celldivthresh_p,s_celldivthresh_a,s_celldivthresh_l] = getMgenLevels( m, 'S_CELLDIVTHRESH' );  %#ok<ASGLU>
%     % Convert it to a perl-cell value.
%     perCellThreshold = perVertexToPerCell( m, s_celldivthresh_p );
%     % Split if the cell area exceeds the morphogen.
%     splits = (m.secondlayer.cellarea(ci) > perCellThreshold(ci)) & (perCellThreshold > 0) ;%& (realtime <50);
%     % Let GFtbox decide the splitting plane.
%     splitcentre = NaN( length(ci), 3 );
%     splitdirection = zeros( length(ci), 3 );
% end
% function [m,result] = GFtbox_Precelldivision_Callback( m, ci ) %#ok<DEFNU>
%     result = [];
%     % Get the morphogen for determining splitting threshold.
%     [s_celldivthresh_i,s_celldivthresh_p,s_celldivthresh_a,s_celldivthresh_l] = getMgenLevels( m, 'S_CELLDIVTHRESH' );  %#ok<ASGLU>
%     if isempty(s_celldivthresh_i)
%         % No such factor.
%         return;
%     end
%     % Convert it to a perl-cell value.
%     perCellThreshold = perVertexToPerCell( m, s_celldivthresh_p );
%     % Split if the cell area exceeds the morphogen.
%     result.divide = (m.secondlayer.cellarea(ci) > perCellThreshold(ci)) & (perCellThreshold > 0) ;%& (realtime <50);
%     % Let GFtbox decide the splitting plane.
%     result.dividepoint = NaN( length(ci), 3 );
%     result.perpendicular = zeros( length(ci), 3 );
% end
% 
% function [m,result] = GFtbox_Postcelldivision_Callback( m, ci, cei, newci, newcei, oe1, oe2, ne1, ne2, ne3 ) %#ok<DEFNU>
%     result = [];
%     % Your code here.
% end
% 
% function [m,result] = GFtbox_Postiterate_Callback( m ) %#ok<DEFNU>
%     result = [];
      % In this project we mark clones at an arbitrarily chosen moment.
    % This could be done in the main interaction function, but then we
    % would never get to see the clones exactly as they are established,
    % but only after a growth step and possible splitting of some of the
    % cells.  Putting the code here in the Postiterate callback avoids
    % this.  Note that Steps(m) and the current time have been
    % incremented since the main interaction function was called.
    

%     if meshAtTime( m, OPTIONS.clonetime, 0.005 )
%         [c_cloneid_i,c_cloneid] = getCellFactorLevels( m, 'c_cloneid' );
%         
% 
%         switch OPTIONS.clonetype
%             case 'random'
%                 % Mark every cell with a random colour.
%  
% 
%                 numcells = getNumberOfCells(m);
%                 % Set C_CLONEID to a different integer value for each cell.
%                 c_cloneid = 0:(numcells-1);
%                 % Here are several examples of getting sets of random colours.
%                 % The second and third arguments are colours in HSV (hue,
%                 % saturation, value) coordinates, specifying the allowed range.
%                  randomColors = randcolor( numcells, [0.25 1 1], [0.75 1 1] ); % greenish to blueish, fully bright and saturated
%         %         randomColors = randcolor( numcells, [0 0 0], [0 0 1] ); % greyscale
%          %       randomColors = randcolor( numcells, [0 0 0], [1 1 1] ); % all colours are possible
%                  m = leaf_setcellcolorinfo( m, 'factor',c_cloneid_i, 'colors', randomColors );
%                 

%                 % Set C_CLONEID to a different integer value for each cell.
%                 c_cloneid = 0:(numcells-1);
        

        

%             case 'biggest'
%                 % Mark a chosen set of cells with one colour and the rest
%                 % another colour.  Here we mark the biggest two cells red
%                 % and the rest green.
%  
% 
%                 m = leaf_setcellcolorinfo( m, 'factor',c_cloneid_i, 'colors', [0 1 0; 1 0 0] );
%                 
% 
%                 % Set C_CLONEID to zero where you want green and 1 where you want red.
%                 [~,perm] = sort( m.secondlayer.cellarea, 'descend' );
%                 c_cloneid(:) = 0;
%                 c_cloneid( perm([1 2]) ) = 1;
%         end
%         
% 
%         m.secondlayer.cellvalues(:,c_cloneid_i) = c_cloneid(:);
%     end
%     % Your code here.
% end
% 
% function [m,result] = GFtbox_Preplot_Callback( m, theaxes ) % %#ok<DEFNU> 
%     result = [];
%     [c_area_i, c_area] = getCellFactorLevels (m, 'c_area');
%     if c_area_i > 0
%         m.secondlayer.cellvalues(:,c_area_i)= m.secondlayer.cellarea;
%     end
% end
% 
% function [m,result] = GFtbox_Postplot_Callback( m, theaxes ) %#ok<DEFNU>
%     result = [];
%     % Your code here.
% end


